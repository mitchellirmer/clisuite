# YouTube Search
# := CLI for searching YouTube.
path="$HOME/.clisuite/metube/"
pl_loc="$HOME/Music/Stream/Playlists/"

printHelp(){
    echo "========METUBE HELP=========="
    echo "metube <option> <argument(s)>"
    echo "EXAMPLE:  metube search \"nebraska football\" 5"
    echo "1)  < -s or search>  <\"search terms\">               <number of desired search results>"
    echo "2)  < -d or desc>    <line number of video title>"
    echo "3)  < -p or play>    <line number of video title>"
    echo "4)  < -a or add>     <line number of video title>   <\"Playlist_Title\">"
    echo "5)  < -e or export>  <\"Playlist_Title\">"
    echo "=============================="
}

if [ -z "$1" ]; then
    printHelp
elif [ $1 == "-s" ] || [ $1 == "search" ]; then
    rm ${path}ytreturn.txt
    yt-dlp --print title --print uploader --print webpage_url "ytsearch$3:$2" > ${path}ytreturn.txt
    cat -n ${path}ytreturn.txt
elif [ $1 == "-d" ] || [ $1 == "desc" ]; then
    declare line=$2
    line=$((${line} + 2))
    line="${line}p"
    track=$(sed -n $line ${path}ytreturn.txt)
    yt-dlp --print title --print uploader --print upload_date --print webpage_url --print description $track
elif [ $1 == "-p" ] || [ $1 == "play" ]; then
    declare line=$2
    line=$((${line} + 2))
    line="${line}p"
    track=$(sed -n $line ${path}ytreturn.txt)
    mpv $track
elif ( [ $1 == "-a" ] || [ $1 == "add" ] ) && [[ ! -z "$3" ]]; then
    declare line=$2
    address=$((${line} + 2))
    line="${line}p"
    address="${address}p"
    track=$(sed -n $line ${path}ytreturn.txt)
    url=$(sed -n $address ${path}ytreturn.txt)
    echo $track > ${path}tmptitle.txt
    echo $url > ${path}tmpurl.txt
    paste ${path}tmpurl.txt ${path}tmptitle.txt >> ${path}${3}.m3u
    rm ${path}tmptitle.txt ${path}tmpurl.txt
elif [ $1 == "-e" ] || [ $1 == "export" ]; then
    cp -v -i ${path}${2}.m3u ${pl_loc}${2}.m3u
else
    printHelp
fi

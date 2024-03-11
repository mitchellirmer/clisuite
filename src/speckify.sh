  # Speckify Music
  # := Searches all playlists in the folder; returns output to screen and out.m3u playlist.

path="$HOME/.clisuite/src/"
pl_loc="$HOME/Music/Stream/Playlists/"

printHelp(){
    echo "========SPECKIFY HELP=========="
    echo "speckify <option> <argument(s)>"
    echo "EXAMPLE:  speckify search \"heads carolina\""
    echo "1)  < -s or search > <\"search terms\">"
    echo "2)  < -c or choose > <line number of track title>"
    echo "3)  < play >         <\"PlaylistName\">"
    echo "4)  < shuffle >      <\"PlaylistName\">"
    echo "5)  < library >"
    echo "=============================="
}

if [ -z "$1" ]; then
    printHelp
elif [ $1 == "-s" ] || [ $1 == "search" ]; then
    cd $pl_loc
    rm msearch.m3u
    grep -i "$2" *.m3u | cut -f2- -d: > msearch.m3u
    cat -n msearch.m3u
elif [ $1 == "-c" ] || [ $1 == "choose" ]; then
    cd $pl_loc
    line=$2
    line="${line}p"
    track=$(sed -n $line msearch.m3u)
    mpv --no-video $track
elif [ $1 == "play" ]; then
    cd $pl_loc
    list=$(ls *.m3u | cut -f1 -d. | fzf)
    mpv --no-video ${pl_loc}${list}.m3u
elif [ $1 == "shuffle" ]; then
    cd $pl_loc
    list=$(ls *.m3u | cut -f1 -d. | fzf)
    mpv --no-video --shuffle ${pl_loc}${list}.m3u
elif [ $1 == "library" ]; then
    cd $pl_loc
    ls *.m3u | cut -f1 -d. | more
else
    printHelp
fi

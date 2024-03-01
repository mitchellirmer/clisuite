Command Line Suite
==================

GitHub Pages: https://mitchellirmer.github.io/clisuite/

# 0.  About
These are my personal scripts that I use to improve my user experience with streamed multi-media and written content.  They are stored here as a backup for me and reference for others that want to practice scripting for regular tasks.  Should you choose to download these, know that it is at your own risk and there is no warranty of any kind.

# 1. readmode   

readmode is a script intended to remove clutter from articles opened in newsboat or w3m/lynx.  It feeds a website URL through cURL and Mozilla readability and opens in w3m.  The idea comes from here: <https://tech.toryanderson.com/2021/06/09/how-to-get-readable-mode-in-emacs-w3m/>  I don't use EMACS (yet(?)) and so I made it a little simpler by writing this script, calling it with an alias in my .zshrc, and adding a macro to my .newsboat/config.  See dependencies.txt for a list of required dependencies, which you must install on your own before using readmode.sh.  

# 2. metube    

metube is a replacement for the youtube https website.  It uses yt-dlp -search:N to search youtube and display the results.  You can read video descriptions and play videos directly with metube commands.  Video playback comes from mpv.  metube "integrates" with speckify (see #3) as a tool to create playlists.  Instead of playing one video at a time from the results, you can use metube to save video URLs and titles to .m3u playlists and export them to the speckify playlist library to playback later.  

#  3. speckify  
speckify is a streaming library user interface.  It uses mpv --no-video to stream audio from youtube or other sources.  It reads in .m3u playlist files with URL and title and searches your "library" of URLs to stream what you want without having to search youtube or another source first.  

# 4.  Installation:

1. Save/clone into /home/user/.clisuite/  
2. Add the following to your .zshrc or .bashrc or whatever handles your aliases.  

>####### CLISUITE "INSTALLATION" BELOW  
alias metube='sh $HOME/.clisuite/metube/metube.sh'  
alias readmode='sh $HOME/.clisuite/readmode/readmode.sh'  
alias speckify='sh $HOME/.clisuite/speckify/speckify.sh'  
#######  END CLISUITE "INSTALLATION"

3. To use readmode as a macro from newsboat, add this to your .newsboat/config  
> macro r set browser "sh $HOME/.clisuite/readmode/readmode.sh" ; open-in-browser ; set browser w3m/lynx/firefox
4. By default, speckify will save playlists to $HOME/Music/Stream/Playlists/  This can be changed by updating the "pl_loc" variable in the metube.sh and speckify.sh files.

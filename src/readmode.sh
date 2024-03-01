# Read Mode
# := Takes a URL as input and feeds it to Mozilla Readability.  Read in w3m.

path="$HOME/.clisuite/src/"

curl $1 | readability $1 > ${path}readmodetempfile.html
w3m ${path}readmodetempfile.html

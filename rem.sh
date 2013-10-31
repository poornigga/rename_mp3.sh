#!/bin/bash - 
#===============================================================================
#
#          FILE:rem.sh 
# 
#         USAGE: ./rem.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: bigdog (), 
#  ORGANIZATION: 
#       CREATED: 2013/10/30 15:42
#      REVISION:  ---
#===============================================================================

set -o nounset                              # Treat unset variables as an error

function usage() {
    echo -ne "\nusage: $0  input-dir-name output-dir-name\n\n"
}

if [ $# -lt 2 ]; then
    usage;
    exit;
fi
dpath="./target"

if [ ! -z "$dpath" ]; then
    mkdir -p "$dpath"
fi

find "$1" -name "*.mp3" | while read line 
do
    name=`id3tool "$line" | grep "Title" | awk -F: '{ print $2 }' | awk '{sub(/^[ \t]+/, "")};1' | awk '{sub(/[ \t]+$/, "")};1' `
    echo --"${name}"--
    cp "$line" ./"$dpath"/"${name}".mp3
done 

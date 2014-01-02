rename_mp3.sh
=============

mp3file = "QQMusic cache mp3 File, [osx]";

dependency: id3tool[https://github.com/poornigga/id3tool]

rename $mp3file name using mp3file.tag.name;

usage :
    ./rem.sh ./musics ./target
    [musics folder include origin mp3 files, target folder include target mp3 file]

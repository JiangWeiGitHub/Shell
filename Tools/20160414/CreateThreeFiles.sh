#!/bin/bash

if [ -e "/mnt/Music.mp3" ]
then
    rm /mnt/Music.mp3
fi
if [ -e "/mnt/Music.mp3" ]
then
    rm /mnt/Movie.wmv
fi
if [ -e "/mnt/Music.mp3" ]
then
    rm /mnt/Pic.jpg
fi

cp /trynode/Movie.wmv /mnt
setfattr -n user.uuid -v "5dfdbd62-b864-4824-9f7c-6c3cd8bf0d7e" "/mnt/Movie.wmv"
setfattr -n user.owner -v "c31a2e99-987d-4f65-9559-22e22ff603da" "/mnt/Movie.wmv"
setfattr -n user.readlist -v " " "/mnt/Movie.wmv"
setfattr -n user.writelist -v " " "/mnt/Movie.wmv"
setfattr -n user.type -v "file" "/mnt/Movie.wmv"
originalStr=`sha256sum "/mnt/Movie.wmv"`
processedStr=${originalStr:0:64}
setfattr -n user.hash -v "${processedStr}" "/mnt/Movie.wmv"

cp /trynode/Music.mp3 /mnt
setfattr -n user.uuid -v "892a1943-33bd-4b7d-ae59-ec9d3d2a8094" "/mnt/Music.mp3"
setfattr -n user.owner -v "c31a2e99-987d-4f65-9559-22e22ff603da" "/mnt/Music.mp3"
setfattr -n user.readlist -v " " "/mnt/Music.mp3"
setfattr -n user.writelist -v " " "/mnt/Music.mp3"
setfattr -n user.type -v "file" "/mnt/Music.mp3"
originalStr=`sha256sum "/mnt/Music.mp3"`
processedStr=${originalStr:0:64}
setfattr -n user.hash -v "${processedStr}" "/mnt/Music.mp3"

cp /trynode/Pic.jpg /mnt
setfattr -n user.uuid -v "3e04af9e-4148-45ad-a60d-fbbe32d000f7" "/mnt/Pic.jpg"
setfattr -n user.owner -v "c31a2e99-987d-4f65-9559-22e22ff603da" "/mnt/Pic.jpg"
setfattr -n user.readlist -v " " "/mnt/Pic.jpg"
setfattr -n user.writelist -v " " "/mnt/Pic.jpg"
setfattr -n user.type -v "file" "/mnt/Pic.jpg"
originalStr=`sha256sum "/mnt/Pic.jpg"`
processedStr=${originalStr:0:64}
setfattr -n user.hash -v "${processedStr}" "/mnt/Pic.jpg"

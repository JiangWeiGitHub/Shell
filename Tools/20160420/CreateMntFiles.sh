#!/bin/bash

# Create files & folders with specific xattr, copy Movie.wmv & Music.mp3 & Pic.jpg from /trynode folder

# tree:
# /mnt/
# |-- 1
# |   |-- 12.txt
# |   `-- 5
# |-- 11.txt
# |-- 2
# |   `-- 6
# |       |-- 12.txt
# |       `-- 7
# |-- 3
# |   `-- 6
# |       `-- 9
# |           |-- 10
# |           `-- 12.txt
# |-- 4
# |-- Movie.wmv
# |-- Music.mp3
# `-- Pic.jpg

admin_uuid="c31a2e99-987d-4f65-9559-22e22ff603da"

setFileHashXattr()
{
  originalStr=`sha256sum $1`
  processedStr=${originalStr:0:64}
  
  setfattr -n user.hash -v "${processedStr}" "$1"
}

setFolderHashXattr()
{
  setfattr -n user.hash -v "" "$1"
}

setUUIDXattr()
{
  setfattr -n user.uuid -v "$2" "$1"
}

setFolderTypeXattr()
{
  setfattr -n user.type -v "folder" "$1"
}

setFileTypeXattr()
{
  setfattr -n user.type -v "file" "$1"
}

setOwnerListXattr()
{
  setfattr -n user.owner -v "$2" "$1"
}

setReadListXattr()
{
  setfattr -n user.readlist -v "$2" "$1"
}

setWriteListXattr()
{
  setfattr -n user.writelist -v "$2" "$1"
}

#####################################################

path=`pwd`

if [ -e "/mnt" ]
then
  rm -rf /mnt/*
fi
mkdir -p /mnt
cd /mnt

#####################################################

mkdir 1
setFolderHashXattr "1"
setUUIDXattr "1" "854237a4-3582-48c1-8420-4536fa4263c7"
setFolderTypeXattr "1"
setOwnerListXattr "1" "$admin_uuid"
setReadListXattr "1" "$admin_uuid"
setWriteListXattr "1" " "

cd 1
touch 12.txt
echo "12.txt" > 12.txt
setFileHashXattr "12.txt"
setUUIDXattr "12.txt" "d03232a4-9b35-439f-b91b-ff20f6de6dc6"
setFileTypeXattr "12.txt"
setOwnerListXattr "12.txt" "$admin_uuid"
setReadListXattr "12.txt" "$admin_uuid"
setWriteListXattr "12.txt" " "

mkdir 5

# return to 1
cd ..

#####################################################

touch 11.txt
echo "11.txt" > 11.txt
setFileHashXattr "11.txt"
setUUIDXattr "11.txt" "ba6823f5-9e8c-47e9-abfd-84cb5d4253ab"
setFileTypeXattr "11.txt"
setOwnerListXattr "11.txt" "$admin_uuid"
setReadListXattr "11.txt" " "
setWriteListXattr "11.txt" " "

#####################################################

mkdir 2
setFolderHashXattr "2"
setUUIDXattr "2" "8a4dfc46-0820-4612-903c-7a4d050de594"
setFolderTypeXattr "2"
setOwnerListXattr "2" "$admin_uuid"
setReadListXattr "2" "$admin_uuid"
setWriteListXattr "2" " "

#####################################################

cd 2
mkdir 6
setFolderHashXattr "6"
setUUIDXattr "6" "7a7c1334-01f3-437d-8088-5e628afb6242"
setFolderTypeXattr "6"
setOwnerListXattr "6" " "
setReadListXattr "6" "$admin_uuid"
setWriteListXattr "6" "$admin_uuid"

#####################################################

cd 6
touch 12.txt
echo "12.txt" > 12.txt
setFileHashXattr "12.txt"
setUUIDXattr "12.txt" "7c6b9c6e-01cc-40d2-ad2b-249afef75891"
setFileTypeXattr "12.txt"
setOwnerListXattr "12.txt" " "
setReadListXattr "12.txt" " "
setWriteListXattr "12.txt" "$admin_uuid"

mkdir 7

#####################################################

# return to 6
cd ..

# return to 2
cd ..

#####################################################

mkdir 3
cd 3
mkdir 6
cd 6
mkdir 9
cd 9
mkdir 10
touch 12.txt
echo "12.txt" > 12.txt
setFileHashXattr "12.txt"
setUUIDXattr "12.txt" "6737651f-1420-4696-b6f7-76fba07d95b3"
setFileTypeXattr "12.txt"
setOwnerListXattr "12.txt" "$admin_uuid"
setReadListXattr "12.txt" " "
setWriteListXattr "12.txt" "$admin_uuid"

#####################################################

# return to 9
cd ..

# return to 6
cd ..

# return to 3
cd ..

#####################################################

mkdir 4
setFolderHashXattr "4"
setUUIDXattr "4" "88eb39b6-519f-46c2-ba3e-051079e9b6ac"
setFolderTypeXattr "4"
setOwnerListXattr "4" " "
setReadListXattr "4" " "
setWriteListXattr "4" " "

#####################################################

chmod 777 -R *

cd $path

########################################################################################
# Copy Three Special Files.
########################################################################################

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
setfattr -n user.owner -v "$admin_uuid" "/mnt/Movie.wmv"
setfattr -n user.readlist -v " " "/mnt/Movie.wmv"
setfattr -n user.writelist -v " " "/mnt/Movie.wmv"
setfattr -n user.type -v "file" "/mnt/Movie.wmv"
originalStr=`sha256sum "/mnt/Movie.wmv"`
processedStr=${originalStr:0:64}
setfattr -n user.hash -v "${processedStr}" "/mnt/Movie.wmv"

cp /trynode/Music.mp3 /mnt
setfattr -n user.uuid -v "892a1943-33bd-4b7d-ae59-ec9d3d2a8094" "/mnt/Music.mp3"
setfattr -n user.owner -v "$admin_uuid" "/mnt/Music.mp3"
setfattr -n user.readlist -v " " "/mnt/Music.mp3"
setfattr -n user.writelist -v " " "/mnt/Music.mp3"
setfattr -n user.type -v "file" "/mnt/Music.mp3"
originalStr=`sha256sum "/mnt/Music.mp3"`
processedStr=${originalStr:0:64}
setfattr -n user.hash -v "${processedStr}" "/mnt/Music.mp3"

cp /trynode/Pic.jpg /mnt
setfattr -n user.uuid -v "3e04af9e-4148-45ad-a60d-fbbe32d000f7" "/mnt/Pic.jpg"
setfattr -n user.owner -v "$admin_uuid" "/mnt/Pic.jpg"
setfattr -n user.readlist -v " " "/mnt/Pic.jpg"
setfattr -n user.writelist -v " " "/mnt/Pic.jpg"
setfattr -n user.type -v "file" "/mnt/Pic.jpg"
originalStr=`sha256sum "/mnt/Pic.jpg"`
processedStr=${originalStr:0:64}
setfattr -n user.hash -v "${processedStr}" "/mnt/Pic.jpg"

########################################################################################
# Copy many photos.
########################################################################################

cp -rf /trynode/photo/* /mnt/4

function scandir(){
    local cur_dir parent_dir workdir
    workdir=$1
    cd ${workdir}
    if [ ${workdir} = "/" ]
    then
        cur_dir=""
    else
        cur_dir=$(pwd)
    fi

    for dirlist in $(ls ${cur_dir})
    do
        if test -d ${dirlist};then
            cd ${dirlist}
            scandir ${cur_dir}/${dirlist}
            cd ..
        else
            setFileHashXattr ${cur_dir}/${dirlist}
            setUUIDXattr ${cur_dir}/${dirlist} "6737651f-1420-4696-b6f7-76fba07d95b3"
            setFileTypeXattr ${cur_dir}/${dirlist}
            setOwnerListXattr ${cur_dir}/${dirlist} "$admin_uuid"
            setReadListXattr ${cur_dir}/${dirlist} " "
            setWriteListXattr ${cur_dir}/${dirlist} "$admin_uuid"
        fi
    done
}

scandir /mnt/photo

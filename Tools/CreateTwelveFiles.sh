#!/bin/bash

# Create 12 files & folders with specific path
# $1: path for whole files & folders root folder

if [ $# -ne 1 ]
then
    echo "Bad format: you have to point the path!"
    exit 99
fi

path=`pwd`

mkdir -p $1
cd $1
mkdir -p 1 2 3 4
touch 11.txt
echo "11.txt" > 11.txt

cd 1
mkdir 5
touch 12.txt
echo "12.txt" > 12.txt

cd ..
cd 2
mkdir 6
cd 6
mkdir 7
touch 12.txt
echo "12.txt" > 12.txt

cd ../..

cd 3
mkdir 6
cd 6
mkdir 9
cd 9
mkdir 10
touch 12.txt
echo "12.txt" > 12.txt

cd ../../..

cd $path
chmod 777 -R *

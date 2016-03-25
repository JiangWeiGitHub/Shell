#!/bin/bash

# Create 10 files & folders with specific path
# $1: path for whole files & folders root folder

if [ $# -ne 1 ]
then
    echo "Bad format: you have to point the path!"
    exit 99
fi

path=`pwd`

mkdir -p $1
cd $1
mkdir -p 1 2 3
touch 4.txt
echo "4.txt" > 4.txt

cd 1
mkdir 5
touch 6.txt
echo "6.txt" > 6.txt

cd 5
mkdir 7
touch 8.txt
echo "8.txt" > 8.txt

cd ../..

cd 2
mkdir 9
touch 10.txt
echo "10.txt" > 10.txt

cd ..

cd $path
chmod 777 -R *

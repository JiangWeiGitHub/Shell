#!/bin/bash

# Create files & folders randomly with specific path & number
# $1: path for whole files & folders root folder
# $2: the amount of whole files & folders

path=`pwd`

mkdir -p $1
cd $1

for((i=1;i<=$2;i++))
do
    randomNum=`date +%s%N`
    swtich=$[randomNum%2]

    if [ ${swtich} -eq 0 ]
    then
        echo $randomNum > $randomNum.txt
    else
        mkdir $randomNum
    fi
done

chmod 777 -R *

cd $path



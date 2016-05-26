#!/bin/bash

# Create files randomly with specific path & number
# $1: path for whole files' root folder
# $2: the amount of whole files

path=`pwd`

mkdir -p $1
cd $1

for((i=1;i<=$2;i++))
do
    var=`cat /proc/sys/kernel/random/uuid`
    echo $var > $var.txt
    setfattr -n user.uuid -v "$var" "$var.txt"
done

chmod 777 -R *

cd $path

#!/bin/bash

for((i=1;i<=500;i++))
do
    num=`date +%s%N`
    hello=$[num%2]

    if [ ${hello} -eq 0 ]
    then
        echo $num > $num.txt
    else
        mkdir $num
    fi
done



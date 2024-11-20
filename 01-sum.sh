#! /bin/bash

x=(1 4 6 2 1 4 6 2 1 4 6 2)
len=${#x[@]}

sum=0
for i in "${x[@]}"; do
    sum=$(($sum + $i))
done

echo $sum
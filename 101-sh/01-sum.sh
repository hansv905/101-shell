#! /bin/bash

x=(1 4 6 2 1 4 6 2 1 4 6 2)
len=${#x[@]}
echo $len
sum=0
for i in "${x[@]}"; do
    if (($i % 2 == 0)); then
        continue
    fi
    sum=$(($sum + $i))

done

echo $sum
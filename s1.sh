#!/bin/bash

echo $1
if [ $1 != 'docker' ]; then
    echo "Invalid docker argument"
    exit 1
fi
shift
if [ $1 != 'run' ]; then
    echo "Invalid run argument"
    exit 1
fi
shift

for i in "$@"; do
    # echo $i
done
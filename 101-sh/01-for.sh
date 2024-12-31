#!/bin/bash

for i in {1..5}; do
    for j in {1..100}; do
        echo "$((i*j)) "
    done
done
echo
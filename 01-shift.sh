#!/bin/bash

while [ $# -gt 0 ]; do
    echo "$# th - $@"
    shift
done


# ❯ ./01-shift.sh 0 1 2 3 4 5
# 6 th - 0 1 2 3 4 5
# 5 th - 1 2 3 4 5
# 4 th - 2 3 4 5
# 3 th - 3 4 5
# 2 th - 4 5
# 1 th - 5
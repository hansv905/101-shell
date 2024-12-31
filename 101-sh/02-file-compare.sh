#! /bin/bash

li=$(ls *.sh 2>/dev/null)

for i in $li; do
    echo $(echo $i | sed 's/\.sh//' | sed 's/.*-//')
done

response=$(curl -s https://google.com | sed -n 's/.*<title>\(.*\)<\/title>.*/\1/p')
echo "$response"
#!/bin/bash

dir1="/lustre/AAE9/gins_driver/v1.0.0/somatic/filtered"
dir2="/data/AAE9/gins_driver/v1.0.0/somatic/filtered"

# 결과를 저장할 임시 파일 생성
tmp1=$(mktemp)
tmp2=$(mktemp)

# 각 디렉토리의 파일 목록과 크기를 임시 파일에 저장
cd "$dir1"
for file in *; do
    if [ -f "$file" ]; then
        size=$(ls -l "$file" | awk '{print $5}')
        echo "$file $size" >> "$tmp1"
    fi
done

cd "$dir2"
for file in *; do
    if [ -f "$file" ]; then
        size=$(ls -l "$file" | awk '{print $5}')
        echo "$file $size" >> "$tmp2"
    fi
done

echo "크기가 다른 파일 목록:"
echo "----------------------------------------"

# 두 파일을 비교하여 크기가 다른 파일 출력
while read -r line1; do
    filename1=$(echo "$line1" | cut -d' ' -f1)
    size1=$(echo "$line1" | cut -d' ' -f2)
    
    # 두 번째 디렉토리에서 같은 파일명 찾기
    line2=$(grep "^$filename1 " "$tmp2")
    if [ ! -z "$line2" ]; then
        size2=$(echo "$line2" | cut -d' ' -f2)
        
        if [ "$size1" != "$size2" ]; then
            echo "파일명: $filename1"
            echo "첫 번째 경로 크기: $size1 bytes"
            echo "두 번째 경로 크기: $size2 bytes"
            echo "----------------------------------------"
        fi
    fi
done < "$tmp1"

# 임시 파일 삭제
rm "$tmp1" "$tmp2"

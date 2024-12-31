#! /bin/bash

# 파일 검수용 스크립트
find /data/AADR -name "*.vcf.gz" -type f -size +5M -exec sh -c \
'   
    data_path=$1
    lustre_path=$(echo $data_path | sed 's/data/lustre/')

    data_path_size=$(ls -al $data_path | awk "{print \$5}")
    lustre_path_size=$(ls -al $lustre_path | awk "{print \$5}")

    # echo $data_path
    if [ $data_path_size -ne $lustre_path_size ]; then        
        echo "--not matched"
    fi
' _ {} \;


# find /data/AADR -name "*.vcf.gz" -type f -exec sh -c \
# '   
#     data_path=$1
#     lustre_path=$(echo $data_path | sed 's/data/lustre/')

#     data_path_size=$(ls -al $data_path | awk "{print \$5}")
#     lustre_path_size=$(ls -al $lustre_path | awk "{print \$5}")


#     echo $data_path
#     if [ $data_path_size -ne $lustre_path_size ]; then        
#         echo "--not MATCH"  $lustre_path_size ">>" $data_path_size   
#     fi
# ' _ {} \;


#!/bin/bash
echo "here document"
 
python3 <<EOF > output.data.gtf
import re
with open('data.gtf', 'r') as f:
    for line in f:
        transcript_id = re.findall(r'(?<=transcript_id\s")(.+?)(?=";)', line)
        if transcript_id:
            transcript_id = transcript_id[0]
        print(transcript_id)
EOF
echo "done"
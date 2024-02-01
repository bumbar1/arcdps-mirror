#!/bin/bash


UA="Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36"

curl --user-agent "$UA" --output d3d11.dll --remote-time "https://www.deltaconnected.com/arcdps/x64/d3d11.dll"

DATE=$(date -r d3d11.dll "+%F")
MD5=$(curl --silent "https://www.deltaconnected.com/arcdps/x64/d3d11.dll.md5sum" | cut -d' ' -f1)

git checkout -b "$DATE"
git add d3d11.dll
git commit --message "$DATE"
git tag --annotate "$DATE" --message "MD5: $MD5"
git push --tags

git checkout main

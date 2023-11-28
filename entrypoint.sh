#!/bin/bash

repo="alist-org/alist" &&
tag=$(curl -s "https://api.github.com/repos/$repo/releases/latest" | grep -o '"tag_name": ".*"' | sed 's/"tag_name": "//;s/"//') &&
download_url="https://github.com/$repo/releases/download/$tag/alist-linux-amd64.tar.gz" &&
echo "${download_url}" &&
curl -LJO "$download_url" &&
rm -rf alist &&
tar -xzvf alist-linux-amd64.tar.gz && rm -f alist-linux-amd64.tar.gz && chmod +x alist &&
# ./alist admin set PASSWORD &&
./alist server

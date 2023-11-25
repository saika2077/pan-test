repo="alist-org/alist"
tag=$(curl -s "https://api.github.com/repos/$repo/releases/latest" | grep -o '"tag_name": ".*"' | sed 's/"tag_name": "//;s/"//')
download_url="https://github.com/$repo/releases/download/$tag/alist-linux-amd64.tar.gz"
echo "${download_url}"
wget "$download_url" -O temp.tar.gz
rm -rf alist
tar -xzvf temp.tar.gz && rm -f temp.tar.gz && chmod +x alist
PASSWORD="${PASSWORD:-PASSWORD}"
./alist admin set ${PASSWORD}
./alist server

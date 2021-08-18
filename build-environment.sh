#!/bin/bash
response=$(curl -s https://api.github.com/repos/actions/virtual-environments/releases/latest)
url=$(echo $response | jq -r '.tarball_url')
rm -rf temp
mkdir temp
wget $url -O temp/sources.tar.gz
cd temp
mkdir sources
tar -xf sources.tar.gz -C sources
cd ..
cat $(find -name ubuntu2004.json) > temp/ubuntu2004.json

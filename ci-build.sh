#!/bin/bash
hugo --minify
if [ $? -ne 0 ]; then
    exit 1
fi
mkdir build
tar -czvf build/build.tar.gz -C public .
cp ci-deploy.sh ./build

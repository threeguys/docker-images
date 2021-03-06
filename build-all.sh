#!/bin/bash

for dir in *; do
    if [ -d "$dir" ] && [ -s "$dir/Dockerfile" ] ; then
      echo "Build docker image $dir"
      docker build --tag tgl/$dir --file $dir/Dockerfile $dir
    fi
done

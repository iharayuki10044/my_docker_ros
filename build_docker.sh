#!/bin/bash

while getopts nh opt
do
    case $opt in
        "n" ) has_n=1 ;;
        "h" ) has_h=1 ;;
    esac
done

if [ $has_n ]; then
    option="--no-cache"
fi

if [ $has_h ]; then
    echo "usage: build_docker.sh [-n use_no_cache_build]"
    exit
fi

docker build -t amsl_ros . $option
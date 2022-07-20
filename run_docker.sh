#!/bin/bash

bind_dirs=($(cat bind_dirs.txt | xargs))
build_dir="$(pwd)/.build"
devel_dir="$(pwd)/.devel"
startup_opt=""
mount_opt=""

while getopts bsh opt
do
    case $opt in
        "b" ) has_b=1 ;;
        "s" ) has_s=1 ;;
        "h" ) has_h=1 ;;
        *   ) has_h=1 ;;
    esac
done

if [ $has_b ]; then
    startup_opt+="-b "
fi

if [ $has_s ]; then
    startup_opt+="-s "
fi

if [ $has_h ]; then
    echo "usage: run_docker.sh [-b build_on_startup] [-s run_with_shell_mode]"
    exit
fi

for bind_dir in ${bind_dirs[@]}
do
    mount_opt+="--mount type=bind,source=$bind_dir,target=$bind_dir "
done

docker run \
    -it \
    --rm \
    --gpus all \
    $mount_opt \
    --mount type=bind,source=$build_dir,target=/home/amsl/catkin_ws/build \
    --mount type=bind,source=$devel_dir,target=/home/amsl/catkin_ws/devel \
    --net host \
    amsl_ros \
    bash .startup.sh ${startup_opt}
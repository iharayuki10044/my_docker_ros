FROM ros:noetic-ros-base
WORKDIR /home/amsl
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get -y upgrade
RUN apt-get install -y --no-install-recommends -o Dpkg::Options::="--force-confdef" -o Dpkg::Options::="--force-confold" keyboard-configuration \
    python3-pip \
    python3-rosdep \
    python3-osrf-pycommon \
    python3-catkin-tools \
    python3-opencv \
    ros-noetic-geometry \
    ros-noetic-geometry2 \
    ros-noetic-roslint \
    ros-noetic-pcl-ros \
    ros-noetic-cv-bridge \
    ros-noetic-image-transport \
    ros-noetic-image-geometry \
    ros-noetic-laser-geometry \
    ros-noetic-diagnostic-updater \
    libpcap-dev \
    libpcl-dev \
    libyaml-cpp-dev
# RUN pip3 install cnn-finetune matplotlib torch==1.8.1+cpu torchvision==0.9.1+cpu -f https://download.pytorch.org/whl/torch_stable.html
RUN pip3 install cnn-finetune matplotlib torch==1.8.1+cu111 torchvision==0.9.1+cu111 -f https://download.pytorch.org/whl/torch_stable.html
RUN mkdir -p /root/.cache/torch/hub/checkpoints
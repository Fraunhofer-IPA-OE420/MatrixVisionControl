# start with slim version of actual Debian
FROM debian:9-slim
ENV LC_ALL C
ENV DEBIAN_FRONTEND noninteractive

# entrypoint of Docker
CMD ["/bin/bash"]

# set environment variables
ENV TERM linux
ENV MVIMPACT_ACQUIRE_DIR /opt/mvIMPACT_Acquire
ENV MVIMPACT_ACQUIRE_DATA_DIR /opt/mvIMPACT_Acquire/data
ENV GENICAM_GENTL64_PATH /opt/mvIMPACT_Acquire/lib/x86_64
ENV GENICAM_ROOT /opt/mvIMPACT_Acquire/runtime
ENV container docker

# update packets and install minimal requirements
# after installation it will clean apt packet cache
RUN apt-get update && apt-get -y install build-essential && \
    iproute2 && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# move the directory mvIMPACT_Acquire with *.tgz and *.sh files to the container
COPY mvIMPACT_Acquire /var/lib/mvIMPACT_Acquire

# execute the setup script in an unattended mode
RUN cd /var/lib/mvIMPACT_Acquire && \
    ./install_mvGenTL_Acquire.sh -u && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

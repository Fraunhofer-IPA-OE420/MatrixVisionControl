# start with slim version of actual Debian
FROM --platform=linux/arm64 phusion/baseimage:master 


# set environment variables
ENV TERM linux
ENV MVIMPACT_ACQUIRE_DIR /opt/mvIMPACT_Acquire
ENV MVIMPACT_ACQUIRE_DATA_DIR /opt/mvIMPACT_Acquire/data
ENV GENICAM_GENTL64_PATH /opt/mvIMPACT_Acquire/lib/x86_64
ENV GENICAM_ROOT /opt/mvIMPACT_Acquire/runtime
ENV container docker
ENV LC_ALL C
ENV DEBIAN_FRONTEND noninteractive

USER root

#SSH
#RUN rm -f /etc/service/sshd/down
#RUN /etc/my_init.d/00_regen_ssh_host_keys.sh
#RUN /usr/sbin/enable_insecure_key

# update packets and install minimal requirements
# after installation it will clean apt packet cache
#RUN apt-get update 
#RUN apt-get -y install build-essential iproute2 

#RUN mkdir /var/lib/mvIMPACT_Acquire
# move the directory mvIMPACT_Acquire with *.tgz and *.sh files to the container
#COPY mvIMPACT_Acquire/install_mvGenTL_Acquire.sh /var/lib/mvIMPACT_Acquire/install_mvGenTL_Acquire.sh
#COPY mvIMPACT_Acquire/mvGenTL_Acquire-x86_64_ABI2-2.45.0.tgz /var/lib/mvIMPACT_Acquire/mvGenTL_Acquire-x86_64_ABI2-2.45.0.tgz
#COPY mvIMPACT_Acquire/mvGenTL_Acquire-ARM64_gnu-2.45.0.tgz /var/lib/mvIMPACT_Acquire/mvGenTL_Acquire-ARM64_gnu-2.45.0.tgz

# execute the setup script in an unattended mode
#RUN cd /var/lib/mvIMPACT_Acquire
#RUN ls /var/lib/mvIMPACT_Acquire
#RUN chmod a+x /var/lib/mvIMPACT_Acquire/install_mvGenTL_Acquire.sh
#RUN /var/lib/mvIMPACT_Acquire/install_mvGenTL_Acquire.sh -ogev -u 


# Use baseimage-docker's init system.
#CMD ["/sbin/my_init"]
#RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

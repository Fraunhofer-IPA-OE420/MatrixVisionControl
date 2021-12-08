# MatrixVisionControl
automatic control of the matrixVision Camera mvBlueCOUGAR-XT

[![Open in Gitpod](https://gitpod.io/button/open-in-gitpod.svg)](https://gitpod.io/#https://github.com/Fraunhofer-IPA-OE420/Puryfill)

# Install Docker Container
Download install files for ARM from webpage and store them in a folder named mvIMPACT_Acquire. Create a Dockerfile and be sure that it is optimzed on a ARM device.
<br>
Be sure that every file and the Dockerfile point to an ARM device and not a Linux PC
<br>
Open a bash and check the following parameters:
<br>ARM architecture:   &emsp;uname -m
<br>Kernel version:     &emsp;uname -r
<br>OS version:         &emsp;lsb_release -a
<br>OS name:            &emsp;lsb_release -a
<br>
<br>
Open the sh file and take the following adjustments, according to the results in the bash. The results printed here are from a Raspi3.
```
## Changes IPA

# get target name: type in bash in raspberry host "uname -m"
# Revpi: armv7l
# Rasp3: aarch64
ARM_ARCHITECTUR="aarch64"

## get kernel version: type in bash in raspberry host "uname -r"
# RevPI: 4.19.95-rt38-v7
# Rasp3: "5.10.63-v8+"
KERNEL_VERSION="5.10.63-v8+"

OS_VERSION="11.1"
OS_NAME="Debian"
OS_CODENAME="unknown"
VERSION="2.45.0"
######
```
The Version of the install file can be found in the file name.
<br>Comment out the lines above
```
#ARM_ARCHITECTURE="$(uname -m)" 
#OS_NAME="unknown"
#OS_VERSION="unknown"
#OS_CODENAME="unknown"
#KERNEL_VERSION="unknown"
#JETSON_KERNEL=""
```
<br>
<br>
In function check_distro_and_version() comment out all if-clauses and replace it by an echo, so the the function is not empty.
```
function check_distro_and_version()
{
  echo "determine OS Name, version and Kernel version done in constant"
}
```
<br>
Comment out the line
```
# needed at compile time (used during development, but not shipped with the final program)
#ACT=$API-$VERSION.tar
```

# Start the Docker Container
Insert the command
```
sudo docker run -ti --net=host --name matrixvision3 ghcr.io/fraunhofer-ipa-oe420/matrixvisioncontrol:main
```
To use a simple example application, type in
```
$ cd /opt/mvIMPACT_Acquire/apps/SingleCapture/arm64
$ ./SingleCapture
```
be sure to use the ARM application with the file ending arm64.

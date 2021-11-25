# MatrixVisionControl
automatic control of the matrixVision Camera mvBlueCOUGAR-XT

#Install Docker Container
Download install files for ARM from webpage and store them in a folder named mvIMPACT_Acquire. Create a Dockerfile and be sure that it is optimzed on a ARM device.
Be sure that every file and the Dockerfile point to an ARM device and not a Linux PC

Open a bash and check the following parameters:
ARM architecture:   uname -m
Kernel version:     uname -r
OS version:         lsb_release -a
OS name:            lsb_release -a

Open the sh file and take the following adjustments, according to the results in the bash. The results printed here are from a Raspi3.
```
##Changes IPA
# get target name: type in bash in raspberry host "uname -m"
ARM_ARCHITECTUR="aarch64"
# get kernel version: type in bash in raspberry host "uname -r"
KERNEL_VERSION="5.10.63-v8+"
OS_VERSION="11.1"
OS_NAME="Debian"
OS_CODENAME="unknown"
VERSION="2.45.0"
######
```
The Version of the install file can be found in the file name.
Comment out the lines above
```
#ARM_ARCHITECTURE="$(uname -m)"
#OS_NAME="unknown"
#OS_VERSION="unknown"
#OS_CODENAME="unknown"
#KERNEL_VERSION="unknown"
#JETSON_KERNEL=""
```


In function check_distro_and_version() comment out all if-clauses and replace it by an echo, so the the function is not empty.
```
function check_distro_and_version()
{
  echo "determine OS Name, version and Kernel version done in constant"
}
```

Comment out the line
```
# needed at compile time (used during development, but not shipped with the final program)
#ACT=$API-$VERSION.tar
```


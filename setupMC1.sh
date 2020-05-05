#!/bin/sh -e
echo begin setupMC1

DIR=~/Minecraft

# create folders
echo Setup 1/12
if [ ! -d "$DIR" ]; then
    mkdir "$DIR"
fi
cd "$DIR"
pwd

echo Setup 2/12
if [ ! -d "$DIR"/Natives ]; then
    mkdir "$DIR"/Natives
fi

# download minecraft
echo Setup 3/12
if [ ! -f Minecraft.jar ]; then
    wget https://s3.amazonaws.com/Minecraft.Download/launcher/Minecraft.jar
fi

# download java  
echo Setup 4/12
if [ ! -f jdk-8u211-linux-arm32-vfp-hflt.tar.gz ]; then
    wget https://www.dropbox.com/s/ihju7z043jhamr3/jdk-8u211-linux-arm32-vfp-hflt.tar.gz
fi

# download optifine
echo Setup 5/12
if [ ! -f OptiFine_1.12.2_HD_U_F4.jar ]; then
    wget https://www.dropbox.com/s/uegvot7v4tsw3a0/OptiFine_1.12.2_HD_U_F4.jar
fi

# install OpenAL Audio & glxgears demo
echo Setup 6/12
sudo apt-get -y install libalut0 libalut-dev && sudo apt-get -y install mesa-utils

cd "$DIR"/Natives

echo Setup 7/12
if [ ! -f liblwjgl.so ]; then
    wget https://www.dropbox.com/s/4oxcvz3ky7a3x6f/liblwjgl.so
fi

echo Setup 8/12
if [ ! -f libopenal.so ]; then
    wget https://www.dropbox.com/s/m0r8e01jg2og36z/libopenal.so
fi

cd "$DIR"

echo Setup 9/12
if [ ! -d /opt/jdk ]; then
    sudo mkdir /opt/jdk
fi

# extract oracle java  8
echo Setup 10/12
echo Extracting java ...
sudo tar -zxf jdk-8u211-linux-arm32-vfp-hflt.tar.gz -C /opt/jdk

#sudo update-alternatives --install /usr/bin/java java /opt/jdk/jdk1.8.0_211/bin/java 100
#sudo update-alternatives --install /usr/bin/javac javac /opt/jdk/jdk1.8.0_211/bin/javac 100

# get run script
echo Setup 11/12
sudo mv /home/pi/12-1RPI/runMC1_12_2_OptifineF4.sh Minecraft/runMC1_12_2_OptifineF4.sh
sudo chmod +x runMC1_12_2_OptifineF4.sh  

echo Setup 12/12
wget https://www.dropbox.com/s/j4ib66feomck3gb/setupMC2.sh
sudo chmod +x setupMC2.sh  

echo end setupMC1

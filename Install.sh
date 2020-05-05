cd
echo "Running automatic install, please pay attention!"
echo "Install for raspberry pi 4, extra steps are required on raspberry pi 3"
echo "https://www.raspberrypi.org/forums/viewtopic.php?f=78&t=243946"
echo "Follow steps 2 and 3 on a raspberry pi 3 then run installation"
echo "If you have doubts, use an alternate sd card"
echo "Heatsinks and a fan (If you are using a case) are required!"
echo "Any damage from overheating because you aren't using cooling devices is NOT my fault!"
echo "If you have the folder '/home/pi/Minecraft' you MUST delete it! Setup may fail and be unfixable!"
echo "Press any key to agree and continue with installation"
read -rsn1 input
echo Downloading java and installing run script
echo "Press any key to continue. If you already did this, press (S) to skip"
read -rsn1 input
if [ "$input" == "s" ]; then
echo skipped
else
mkdir ~/Minecraft  && sudo cp MinecraftRPI+/setupMC1.sh Minecraft/setupMC1.sh && sudo chmod +x Minecraft/setupMC1.sh && Minecraft/setupMC1.sh
echo Installing Run Script
sudo cp /home/pi/MinecraftRPI+/runMC1_12_2_OptifineF4.sh Minecraft/runMC1_12_2_OptifineF4.sh
sudo chmod +x Minecraft/runMC1_12_2_OptifineF4.sh
echo Download other technical things
echo Press any key to continue
read -rsn1 input
cd MinecraftRPI+
sudo chmod +x setupMC2.sh
setupMC2.sh
fi
echo "The launcher will now open. Log in, click edit profile, and set the version to '1.12.2', then click play. When the game crashes, close the launcher and continue here."
echo "Press any key to continue to open the launcher"
read -rsn1 input
cd ~/Minecraft && /opt/jdk/jdk1.8.0_211/bin/java -jar Minecraft.jar
echo Task failed succesfully
echo "Next part, downloading optifine, when the window pops up, click install"
echo "Press any key to continue to optifine installation"
read -rsn1 input
cd ~/Minecraft && /opt/jdk/jdk1.8.0_211/bin/java -jar OptiFine_1.12.2_HD_U_F4.jar
echo "Frames succesfully raised"
echo "The launcher will pop up again, make sure you have the profile 'Optifine' selected, then click play"
echo "Now installing the Minecraft launcher"
echo "This will take a second"
echo "Press any key to continue"
read -rsn1 input
echo "Beginning in"
echo "3"
sleep 1
echo "2"
sleep 1
echo "1"
sleep 1
cd
sudo chmod +x MinecraftRPI+/OpenMinecraft
sudo mv MinecraftRPI+/OpenMinecraft /usr/bin/OpenMinecraft
sudo chmod +x /usr/bin/OpenMinecraft
echo Launcher installation finished
echo "Now installing menu entry. (New)"
sudo cp MinecraftRPI+/Minecraft.png Minecraft/MenuIcon.png
sudo mv MinecraftRPI+/Desktopapp /usr/share/applications/Minecraft.desktop
sleep 1
echo Run command OpenMinecraft to play the wonderful game pro gamers know as, Minecraft
echo Or find it in the Menu!

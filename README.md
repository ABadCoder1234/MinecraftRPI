Pi3: In Menu\Preferences\Raspberry Pi Configuration :
Performance Tab - set GPU Memory to 64Mb
Reboot
Pi3: Enable ‘GL Driver’ from a terminal window
sudo raspi-config
This will start the config utility. Select 'Advanced Options', then select 'GL Driver', then select 'GL (Fake KMS)', then select 'Yes' to reboot and enable the driver. 
To install:
Click on install.sh in repository folder

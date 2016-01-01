#!/bin/sh

#  
#  DebInstaller
#



clear
echo  ----------------------Step 1 ----------------------
echo  -----------------CREATED BY AleDev-----------------
echo  --------------INFO debinstaller.aledev.tk------------
read -p "Inserire Ip Del Tuo Dispositivo: " ipwhu
echo  ----------------------Step 2 ----------------------
echo  --------Creazione Dei File Di Installazione--------
cd ~
mkdir DebInstaller
cd DebInstaller
echo  ----------------------Step 3 ----------------------
echo  ----------------Download File .deb----------------
wget http://apt.modmyi.com/pool/main/c/com.alexzielenski.zeppelin/com.alexzielenski.zeppelin_2.1.0-12_iphoneos-arm.deb
echo  ---------------------Step 4 ---------------------
echo  ---------------Trasferimento File...---------------
cd ~
cd DebInstaller
ssh-keygen -R $ipwhu
echo  ---------------------Step 5 ---------------------
echo "Please enter your SSH password when prompted [default is alpine]"
scp -rp Cydia root@$ipwhu:/private/var/root/Media
echo  ---------------------Step 6 ---------------------
echo "Please enter your SSH password one last time."
ssh root@$ipwhu 'cd /private/var/root/Media/DebInstaller; dpkg -i *.deb; sleep 4; reboot'
cd ~
rm -rf DebInstaller
echo "Deb Installato Con Succeso"
exit

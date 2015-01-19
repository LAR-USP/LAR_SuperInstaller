#! /bin/sh

#Based on a old manual from LAR "Softwares instalados no LAR"

#@author Marcelo Oliveira da Silva
#Dont call me if it isnt working anymore...
#do your job and fix it yourself!

#@author Raphael Montanari
#If you are reading this, you're fucked.


echo "LAR SUPER INSTALLER v0.1.1\n\n"


echo "..........START.........."


echo "---Adding Grub Customizer Repository..."
$(add-apt-repository ppa:danielrichter2007/grub-customizer -y)  >/dev/null

echo "---Adding RabbitVCS Repository..."
$(add-apt-repository ppa:rabbitvcs/ppa -y)  >/dev/null

echo "---Adding Java Repository..."
$(add-apt-repository ppa:webupd8team/java -y)  >/dev/null

echo "---Adding ROS Repository..."
$(sh -c 'echo "deb http://packages.ros.org/ros/ubuntu trusty main" > /etc/apt/sources.list.d/ros-latest.list')  >/dev/null

$(wget http://packages.ros.org/ros.key -O - | sudo apt-key add -)  >/dev/null


echo "---Adding VirtualBox Repository..."
$(wget -q http://download.virtualbox.org/virtualbox/debian/oracle_vbox.asc -O- | apt-key add - ) >/dev/null


echo "---Adding x86 compatibility..."
$(dpkg --add-architecture i386)  >/dev/null

echo "---Updating list and upgrading..."
apt-get update  >/dev/null
apt-get upgrade --yes  >/dev/null
apt-get dist-upgrade --yes  >/dev/null

echo "---Installing a lot of packages..."
apt-get install rabbitvcs-nautilus3 nautilus-open-terminal testdisk rabbitvcs-gedit rabbitvcs-cli grub-customizer sysv-rc-conf vlc openssh-server vim texlive-full ubuntu-restricted-extras kile kbibtex eclipse gimp okular dia wine gnuplot abntex gtkterm g++ samba gnome avahi-daemon weka p7zip-full oracle-java8-installer texmaker ros-indigo-desktop-full python-rosinstall dkms inkscape graphviz octave libreadline5:i386 freeglut3:i386 tcsh libsdl1.2-dev autoconf ntfs-config pmount htop links2 valgrind kchmviewer filezilla libeigen2-dev libdc1394-22-dev gnome-specimen v4l-utils libgtkglext1 libgtkglext1-dev python-gpgme --yes  >/dev/null

echo "---Installing OpenCV dependencies..."
apt-get install build-essential git subversion libgtk2.0-dev libjpeg-dev libpng12-dev libtiff4-dev libjasper-dev openexr libopenexr-dev cmake python-dev python-numpy python-tk python-vtk libtbb2 libtbb-dev libeigen3-dev yasm libfaac-dev libopencore-amrnb-dev libopencore-amrwb-dev libtheora-dev libvorbis-dev libxvidcore-dev libx264-dev libqt4-dev libqt4-opengl-dev sphinx-common texlive-latex-extra libv4l-dev libdc1394-22-dev libavcodec-dev libavformat-dev libswscale-dev default-jdk ant libvtk5-qt4-dev zlib1g-dev libglu1-mesa-dev libgtkglext1 libgtkglext1-dev --yes >/dev/null

echo "---Checking if everything is fine..."
dpkg --configure -a --yes >/dev/null
apt-get install -f --yes >/dev/null
apt-get install --fix-missing --yes >/dev/null
apt-get update >/dev/null
apt-get upgrade --yes >/dev/null
apt-get dist-upgrade --yes >/dev/null


echo "---Removing the damned package of hplip..."
sudo apt-get purge hplip --yes >/dev/null

echo "---Starting ROS..."
echo "---.---Remember to call \"rosdep update\" without root privilegies..."
rosdep init  >/dev/null

echo "..........END.........."

echo "All done... enjoy it, madafaka!"

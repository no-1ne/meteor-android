#Download android
cd ~
wget http://dl.google.com/android/android-sdk_r24.2-linux.tgz

rm -fr android-sdk-linux
#uncompress zip file
tar -xvf android*.tgz
rm android*.tgz
cd ~/android-sdk-linux/tools
#set paths
export ANDROID_HOME=~/android-sdk-linux/
export PATH=$PATH:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools

#install android sdk
echo y | android update sdk --all --force --no-ui --filter platform-tools,tools,build-tools-22.0.1,android-21,android-22,android-23
sudo dpkg --add-architecture i386
sudo apt-get update
sudo apt-get -y install lib32z1
sudo apt-get -y install libbz2-1.0:i386
sudo apt-get -y install openjdk-7-jdk


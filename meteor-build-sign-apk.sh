export ANDROID_HOME=~/android-sdk-linux/
export PATH=$PATH:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools
meteor add-platform android
meteor build ../build_out_dir --server https://$C9_HOSTNAME
rm *.apk
cp ../build_out_dir/android/release-unsigned.apk .
rm ~/.keystore

keytool -genkey -noprompt  -alias release  -keyalg RSA -keysize 2048 -validity 10000   -storepass password  -keypass password -dname "CN=startu, OU=IN, O=I, L=India, S=India, C=IN" 
jarsigner -verbose -sigalg SHA1withRSA -digestalg SHA1 release-unsigned.apk release -storepass password
$ANDROID_HOME/build-tools/22.0.1/zipalign 4 release-unsigned.apk final_app.apk

 

cp final_app.apk public/

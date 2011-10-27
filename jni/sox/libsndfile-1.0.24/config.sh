PREBUILT=/home/user/android-ndk/build/prebuilt/linux-x86/arm-eabi-4.4.0
PLATFORM=/home/user/android-ndk/build/platforms/android-3/arch-arm
export HOME=/home/user/android-ndk-r5b/apps/HelloNDK/libs/armeabi/
export CC="/home/user/android-ndk/build/prebuilt/linux-x86/arm-eabi-4.4.0/bin/arm-eabi-gcc"
export CFLAGS="-fPIC -DANDROID -nostdlib"
export ANDROID_ROOT="/home/user/android-ndk"
export LDFLAGS="-Wl,-rpath-link=$ANDROID_ROOT/build/platforms/android-3/arch-arm/usr/lib/ -L$ANDROID_ROOT/build/platforms/android-3/arch-arm/usr/lib/ -L$HOME"

export CPPFLAGS="-I$ANDROID_ROOT/build/platforms/android-3/arch-arm/usr/include/ -I/home/user/android-ndk-r5b/apps/HelloNDK/jni/sox/libogg/include/ -I/home/user/android-ndk-r5b/apps/HelloNDK/jni/sox/flac/include/ -I/home/user/android-ndk-r5b/apps/HelloNDK/jni/sox/vorbis/include/" 

export LIBS="-lc -logg -lvorbis -lflac"
export PKG_CONFIG_PATH="/home/user/android-ndk-r5b/apps/HelloNDK/obj/local/armeabi/"
./configure --host=arm-eabi --enable-shared


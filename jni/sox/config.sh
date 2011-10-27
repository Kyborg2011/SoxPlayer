PREBUILT=/home/user/android-ndk/build/prebuilt/linux-x86/arm-eabi-4.4.0
PLATFORM=/home/user/android-ndk/build/platforms/android-3/arch-arm
export HOME="/home/user/Dropbox/HelloNDK/libs/armeabi-v7a/"
export CC="/home/user/android-ndk/build/prebuilt/linux-x86/arm-eabi-4.4.0/bin/arm-eabi-gcc"

export ANDROID_ROOT="/home/user/android-ndk"
export LDFLAGS="-Wl,-rpath-link=$ANDROID_ROOT/build/platforms/android-5/arch-arm/usr/lib/ -L/home/user/Dropbox/HelloNDK/obj/local/armeabi-v7a/ -L$ANDROID_ROOT/build/platforms/android-3/arch-arm/usr/lib/ -L$HOME "
export CFLAGS="-fPIC -DANDROID -nostdlib"
export CPPFLAGS="-I$ANDROID_ROOT/build/platforms/android-3/arch-arm/usr/include/ -I/home/user/Dropbox/HelloNDK/jni/sox/libogg/include/ -I/home/user/Dropbox/HelloNDK/jni/sox/flac/include/ -I/home/user/Dropbox/jni/sox/vorbis/include/ -I/home/user/Dropbox/HelloNDK/jni/sox/lame-3.98.4/include/ -I/home/user/Dropbox/HelloNDK/jni/sox/flac/include/ -I/home/user/Dropbox/HelloNDK/jni/sox/libsndfile-1.0.24/src/ -I/home/user/Dropbox/HelloNDK/jni/sox/wavpack-4.60.1/ -I/home/user/Dropbox/HelloNDK/jni/sox/ffmpeg/ -I/home/user/Dropbox/HelloNDK/jni/sox/ffmpeg/libavcodec/ -I/home/user/Dropbox/HelloNDK/jni/sox/ffmpeg/libavformat/ -I/home/user/Dropbox/HelloNDK/jni/sox/lpc10/ -I/home/user/Dropbox/HelloNDK/jni/sox/libmad-0.15.1b/" 


export PKG_CONFIG_PATH="/home/user/Dropbox/HelloNDK/obj/local/armeabi/"
export LIBS="-lc -lgcc -lcutils -lutils -lEGL -lgsm -logg -lvorbis -lvorbisenc -lmp3lame -lvorbisfile -lFLAC -lsmr -lsmrx -lwavpack -lpostproc -lswscale -lavcodec -lavutil -lavformat -lffmpeg -llpc10 -lmad  -lsndfile -lfmemopen"
./configure --host=arm-eabi --enable-shared --enable-dl-lame


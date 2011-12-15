PREBUILT=/home/user/android-ndk/build/prebuilt/linux-x86/arm-eabi-4.4.0
PLATFORM=/home/user/android-ndk/build/platforms/android-3/arch-arm

./configure --target-os=linux \
    --arch=arm \
    --enable-nonfree \
    --disable-protocols \
    --enable-protocol=file \
    --disable-network \
    --enable-avfilter \
    --enable-cross-compile \
    --cc=$PREBUILT/bin/arm-eabi-gcc \
    --cross-prefix=$PREBUILT/bin/arm-eabi- \
    --nm=$PREBUILT/bin/arm-eabi-nm \
    --extra-cflags="-fPIC -DANDROID" \
    --disable-asm \
    --enable-neon \
    --enable-armv5te \
    --extra-ldflags="-Wl,-T,$PREBUILT/arm-eabi/lib/ldscripts/armelf.x -Wl,-rpath-link=$PLATFORM/usr/lib -L$PLATFORM/usr/lib -nostdlib $PREBUILT/lib/gcc/arm-eabi/4.4.0/crtbegin.o $PREBUILT/lib/gcc/arm-eabi/4.4.0/crtend.o -lc -lm -ldl"

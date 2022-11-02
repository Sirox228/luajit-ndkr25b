NDK=${ANDROID_NDK_HOME}

DEST=$(pwd)/build/$1

HOST_ARCH="linux-x86_64"

case "$1" in
    clean)
        make -C luajit clean
        ;;
    armeabi-v7a)
        export TOOLCHAIN=$NDK/toolchains/llvm/prebuilt/$HOST_ARCH
        export TARGET=armv7a-linux-androideabi
        export API=19
        export AR=$TOOLCHAIN/bin/llvm-ar
        export CC=clang
        export CROSSTC=$TOOLCHAIN/bin/$TARGET$API-
        # if needed, you can try setting this as $CC or you can steal GAS AS from old ndk such as r15c and point to it there
        export AS=$TOOLCHAIN/bin/llvm-as
        export CXX=$TOOLCHAIN/bin/$TARGET$API-clang++
        export RANLIB=$TOOLCHAIN/bin/llvm-ranlib
        export STRIP=$TOOLCHAIN/bin/llvm-strip
        export LIBSROOT=$TOOLCHAIN/sysroot/usr/lib/arm-linux-androideabi/$API
        rm luajit/src/Makefile
        cp -f Makefile luajit/src/Makefile
        $TOOLCHAIN/bin/ld --help
        make -C luajit CC="${CC} -m32" HOST_CC="${CC} -m32" STATIC_CC=${CROSSTC}${CC} DYNAMIC_CC=${CROSSTC}${CC} TARGET_LD="${CROSSTC}${CC} -L$LIBSROOT" CFLAGS="-O2" HOST_CFLAGS="-O2" TARGET_CFLAGS="${CFLAGS}" CROSS=${CROSSTC} DESTDIR="${DEST}"
        ;;
    arm64-v8a)
        export TOOLCHAIN=$NDK/toolchains/llvm/prebuilt/$HOST_ARCH
        export TARGET=aarch64-linux-android
        export API=21
        export AR=$TOOLCHAIN/bin/llvm-ar
        export CC=clang
        export CROSSTC=$TOOLCHAIN/bin/$TARGET$API-
        # if needed, you can try setting this as $CC or you can steal GAS AS from old ndk such as r15c and point to it there
        export AS=$TOOLCHAIN/bin/llvm-as
        export CXX=$TOOLCHAIN/bin/$TARGET$API-clang++
        export LD=$TOOLCHAIN/bin/ld
        export RANLIB=$TOOLCHAIN/bin/llvm-ranlib
        export STRIP=$TOOLCHAIN/bin/llvm-strip
        rm luajit/src/Makefile
        cp -f Makefile luajit/src/Makefile
        make -C luajit CC=${CC} HOST_CC=${CC} STATIC_CC=${CROSSTC}${CC} DYNAMIC_CC=${CROSSTC}${CC} TARGET_LD=$TOOLCHAIN/bin/ld CFLAGS="-O2" HOST_CFLAGS="-O2" TARGET_CFLAGS="${CFLAGS}" CROSS=${CROSSTC} DESTDIR="${DEST}"
        ;;
    x86-android)
        export TOOLCHAIN=$NDK/toolchains/llvm/prebuilt/$HOST_ARCH
        export TARGET=i686-linux-android
        export API=19
        export AR=$TOOLCHAIN/bin/llvm-ar
        export CC=clang
        export CROSSTC=$TOOLCHAIN/bin/$TARGET$API-
        # if needed, you can try setting this as $CC or you can steal GAS AS from old ndk such as r15c and point to it there
        export AS=$TOOLCHAIN/bin/llvm-as
        export CXX=$TOOLCHAIN/bin/$TARGET$API-clang++
        export LD=$TOOLCHAIN/bin/ld
        export RANLIB=$TOOLCHAIN/bin/llvm-ranlib
        export STRIP=$TOOLCHAIN/bin/llvm-strip
        rm luajit/src/Makefile
        cp -f Makefile luajit/src/Makefile
        make -C luajit CC="${CC} -m32" HOST_CC="${CC} -m32" STATIC_CC=${CROSSTC}${CC} DYNAMIC_CC=${CROSSTC}${CC} TARGET_LD=$TOOLCHAIN/bin/ld CFLAGS="-O2" HOST_CFLAGS="-O2" TARGET_CFLAGS="${CFLAGS}" CROSS=${CROSSTC} DESTDIR="${DEST}"
        ;;
    x86_64-android)
        export TOOLCHAIN=$NDK/toolchains/llvm/prebuilt/$HOST_ARCH
        export TARGET=x86_64-linux-android
        export API=21
        export AR=$TOOLCHAIN/bin/llvm-ar
        export CC=clang
        export CROSSTC=$TOOLCHAIN/bin/$TARGET$API-
        # if needed, you can try setting this as $CC or you can steal GAS AS from old ndk such as r15c and point to it there
        export AS=$TOOLCHAIN/bin/llvm-as
        export CXX=$TOOLCHAIN/bin/$TARGET$API-clang++
        export LD=$TOOLCHAIN/bin/ld
        export RANLIB=$TOOLCHAIN/bin/llvm-ranlib
        export STRIP=$TOOLCHAIN/bin/llvm-strip
        rm luajit/src/Makefile
        cp -f Makefile luajit/src/Makefile
        make -C luajit CC=${CC} HOST_CC=${CC} STATIC_CC=${CROSSTC}${CC} DYNAMIC_CC=${CROSSTC}${CC} TARGET_LD=$TOOLCHAIN/bin/ld CFLAGS="-O2" HOST_CFLAGS="-O2" TARGET_CFLAGS="${CFLAGS}" CROSS=${CROSSTC} DESTDIR="${DEST}"
        ;;
    x86_64-linux)
        export CFLAGS="-O2"
        make -C luajit CFLAGS="-O2" HOST_CFLAGS="-O2" TARGET_CFLAGS="${CFLAGS}"
        ;;
    *)
        echo 'specify one of "armeabi-v7a", "arm64-v8a", "x86", "x86_64" or "clean" as first argument'
        exit 1
        ;;
esac

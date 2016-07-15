#!/bin/bash

APS_ABI=${APS_ABI:=arm64-v8a}
. $HOME/code/android-prepare.sh

export AR="$APS_CROSS"gcc-ar
export AS="$APS_CROSS"as
export CC="$APS_CROSS"gcc
export CXX="$APS_CROSS"g++
export LD="$APS_CROSS"ld
export NM="$APS_CROSS"gcc-nm
export OBJDUMP="$APS_CROSS"objdump
export OBJCOPY="$APS_CROSS"objcopy
export RANLIB="$APS_CROSS"gcc-ranlib
export STRIP="$APS_CROSS"strip

rm -rf build
mkdir -p build
cd build
cmake \
    -DCMAKE_INSTALL_PREFIX=$APS_PREFIX \
    -DCMAKE_CXX_FLAGS="$APS_CPPFLAGS -I$APS_PREFIX/include" \
    -DCMAKE_SHARED_LINKER_FLAGS="$APS_LDFLAGS -L$APS_PREFIX/lib" \
    -DCMAKE_CROSSCOMPILING=TRUE \
    -DCMAKE_SYSTEM_PROCESSOR=$APS_ARCH \
    -DCMAKE_SYSTEM_NAME=Android \
    -DCMAKE_SYSTEM_VERSION=1 \
    -DCMAKE_ANDROID_API=$APS_API \
    -DCMAKE_SYSROOT="$APS_SYSROOT" \
    -DCMAKE_C_COMPILER="$CC" \
    -DCMAKE_C_COMPILER_ID=GNU \
    -DCMAKE_CXX_COMPILER="$CXX" \
    -DCMAKE_CXX_COMPILER_ID=GNU \
    -DCMAKE_ASM_COMPILER="$CC" \
    -DCMAKE_STRIP="$STRIP" \
    -DCMAKE_AR="$AR" \
    -DCMAKE_AS="$AS" \
    -DCMAKE_LINKER="$LD" \
    -DCMAKE_NM="$NM" \
    -DCMAKE_OBJCOPY="$OBJCOPY" \
    -DCMAKE_OBJDUMP="$OBJDUMP" \
    -DCMAKE_RANLIB="$RANLIB" \
    ..
if (( $? != 0 ));then exit -1;fi
make -j2
if (( $? != 0 ));then exit -1;fi
make install

#!/bin/bash

#"arm64-v8a" "x86_64" "mips64" "armeabi-v7a" "armeabi" "x86" "mips"

ALL_ABI=("arm64-v8a" "x86_64" "mips64" "armeabi-v7a" "armeabi" "x86" "mips")

for ABI in ${ALL_ABI[@]}
do
    export APS_ABI=$ABI
    ./android-build.sh
    if (( $? != 0 ));then echo "$ABI failed"; exit 1;fi
done


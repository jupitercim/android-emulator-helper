#!/bin/bash

SDK_DIR="$HOME/android-sdk"
export ANDROID_SDK_ROOT="$SDK_DIR"
#export ANDROID_HOME="$ANDROID_SDK_ROOT"
export JAVA_HOME="$SDK_DIR/amazon-corretto-17.jdk/Contents/Home"
export PATH="$PATH:$ANDROID_SDK_ROOT/cmdline-tools/12.0/bin:$ANDROID_SDK_ROOT/platform-tools:$ANDROID_SDK_ROOT/emulator:$JAVA_HOME/bin"

if [ ! -d "$SDK_DIR" ]; then
    echo "模拟器相关文件不存在，请先执行初始化脚本!"
    exit 0
fi

emulator  -avd Pixel_5_API_34 &

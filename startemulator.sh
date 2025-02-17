#!/bin/bash

SDK_DIR="$HOME/android-sdk"
export ANDROID_SDK_ROOT="$SDK_DIR"
export PATH="$PATH:$ANDROID_SDK_ROOT/tools/bin:$ANDROID_SDK_ROOT/platform-tools"

if [ ! -d "$SDK_DIR" ]; then
    echo "模拟器相关文件不存在，请先执行初始化脚本!"
    exit 0
fi

emulator  -avd Pixel_7_API_34 &

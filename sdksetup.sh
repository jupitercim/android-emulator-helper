#!/bin/bash

# 设置 SDK 路径
SDK_DIR="$HOME/android-sdk"
AVD_NAME="Pixel_7_API_34"  # 这里填写你想要启动的 AVD 名称
START_SCRIPT_URL="https://raw.githubusercontent.com/jupitercim/android-emulator-helper/refs/heads/main/startemulator.sh"

# 创建 Android SDK 安装目录
mkdir -p "$SDK_DIR"
cd "$SDK_DIR"

# 下载 Android SDK Command Line Tools
echo "下载 Android SDK Command Line Tools..."
SDK_URL="https://dl.google.com/android/repository/commandlinetools-mac-9123335_latest.zip"
##SDK_URL="https://dl.google.com/android/repository/commandlinetools-mac-11076708_latest.zip"
curl -O $SDK_URL

# 解压下载的 SDK 工具
echo "解压 SDK Command Line Tools..."
unzip commandlinetools-mac-9123335_latest.zip
mv cmdline-tools tools

# 设置环境变量
export ANDROID_SDK_ROOT="$SDK_DIR"
export PATH="$PATH:$ANDROID_SDK_ROOT/tools/bin:$ANDROID_SDK_ROOT/platform-tools"

# 安装 SDK 组件（模拟器、系统镜像、平台工具）
echo "安装 SDK 组件..."
yes | sdkmanager --sdk_root="$SDK_DIR" "platform-tools" "emulator" "system-images;android-34;google_apis_playstore;arm64-v8a"

#下载启动脚本
curl -L -o  startemulator.sh $START_SCRIPT_URL
chmod a+x startemulator.sh

# 创建 AVD（如果 AVD 不存在的话）
echo "检查并创建 AVD（如果不存在）..."
if ! emulator -list-avds | grep -q "$AVD_NAME"; then
  echo "AVD '$AVD_NAME' 不存在，正在创建 AVD..."
  sdkmanager --sdk_root="$SDK_DIR" "platforms;android-34"
  echo "no" | avdmanager create avd --name "$AVD_NAME" --package "system-images;android-34;google_apis_playstore;arm64-v8a" --device "pixel_7"
else
  echo "AVD '$AVD_NAME' 已经存在。"
fi


echo "初始化完成，请运行$SDK_DIR/startemulator.sh 启动模拟器"

#!/bin/bash

# 设置 SDK 路径
SDK_DIR="$HOME/android-sdk"
AVD_NAME="Pixel_5_API_34"  # 这里填写你想要启动的 AVD 名称
START_SCRIPT_URL="https://raw.githubusercontent.com/jupitercim/android-emulator-helper/refs/heads/main/startemulator.sh"

# 创建 Android SDK 安装目录
mkdir -p "$SDK_DIR"
cd "$SDK_DIR"

# 下载 Android SDK Command Line Tools
if [ -d cmdline-tools/12.0/ ]; then
    echo "Android SDK Common line Tool已存在跳过"
else
    echo "下载 Android SDK Command Line Tools..."
    SDK_URL="https://dl.google.com/android/repository/commandlinetools-mac-11076708_latest.zip"
    curl -O $SDK_URL
    if [ $? -ne 0 ]; then
        echo "Android  SDK Command Line Tools下载失败，请重新运行命令"
        exit 1
    fi
    # 解压下载的 SDK 工具
    echo "解压 SDK Command Line Tools..."
    unzip commandlinetools-mac-11076708_latest.zip
    mv cmdline-tools 12.0
    mkdir cmdline-tools
    mv 12.0 cmdline-tools/
fi
JDK_URL="https://corretto.aws/downloads/latest/amazon-corretto-17-aarch64-macos-jdk.tar.gz"

systeminfo==$(uname -a)
arminfo="ARM64"
if [[ $systeminfo =~ $arminfo ]]; then
    JDK_URL="https://corretto.aws/downloads/latest/amazon-corretto-17-aarch64-macos-jdk.tar.gz"
    jdk_file="amazon-corretto-17-aarch64-macos-jdk.tar.gz"
else
    JDK_URL="https://corretto.aws/downloads/latest/amazon-corretto-17-x64-macos-jdk.tar.gz"
    jdk_file="amazon-corretto-17-x64-macos-jdk.tar.gz"
fi

if [ -d amazon-corretto-17.jdk/Contents/Home ]; then
    echo "JDK 已安装，跳过"
else
    echo "开始下载 JDK from: $JDK_URL"
    curl -LO $JDK_URL
    if [ $? -ne 0 ]; then
        echo "Java SDK下载失败，请重新运行命令"
        exit 1
    fi
    tar zxvf $jdk_file
fi

echo "开始配置环境变量"
# 设置环境变量
export ANDROID_SDK_ROOT="$SDK_DIR"
#export ANDROID_HOME="$ANDROID_SDK_ROOT"
export JAVA_HOME="$SDK_DIR/amazon-corretto-17.jdk/Contents/Home"

export PATH="$PATH:$ANDROID_SDK_ROOT/cmdline-tools/12.0/bin:$ANDROID_SDK_ROOT/platform-tools:$JAVA_HOME/bin:$ANDROID_SDK_ROOT/emulator"

# 安装 SDK 组件（模拟器、系统镜像、平台工具）
echo "开始安装 Android SDK 组件..."
yes | sdkmanager --sdk_root="$SDK_DIR" "platform-tools" "emulator" "system-images;android-34;google_apis_playstore;arm64-v8a"

#下载启动脚本
echo "开始下载模拟器启动脚本"
curl -L -o  startemulator.sh $START_SCRIPT_URL
if [ $? -ne 0 ]; then
    echo "模拟器脚本下载失败，请重新运行命令"
    exit 1
fi
chmod a+x startemulator.sh

echo "开始下载Mac 模拟器启动应用"
curl -Lo androidemulator.zip "https://raw.githubusercontent.com/jupitercim/android-emulator-helper/refs/heads/main/androidemulator.zip"
if [ $? -ne 0 ]; then
    echo "模拟器运行程序下载失败，请重新运行命令"
    exit 1
fi
unzip androidemulator.zip

# 创建 AVD（如果 AVD 不存在的话）
if ! emulator -list-avds | grep -q "$AVD_NAME"; then
  echo "AVD '$AVD_NAME' 不存在，正在创建 AVD..."
  sdkmanager --sdk_root="$SDK_DIR" "platforms;android-34"
  echo "no" | avdmanager create avd --name "$AVD_NAME" --package "system-images;android-34;google_apis_playstore;arm64-v8a" --device "pixel_5"
else
  echo "AVD '$AVD_NAME' 已经存在。"
fi

echo "初始化完成，请点击运行 $SDK_DIR/AndroidEmulator.app 启动模拟器"

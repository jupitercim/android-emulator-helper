# Emulator-helper

## How to Install this Emulator helper

首先需要保证电脑上安装了`curl`， 并且保证电脑能够访问google 等海外服务。

1. 在你的应用程序中找到mac终端，打开并复制如下命令到其中：
```bash
bash -c "$(curl -fsSL https://raw.githubusercontent.com/jupitercim/android-emulator-helper/refs/heads/main/sdksetup.sh)"
```

终端为如下图所示这个应用：
![](https://raw.githubusercontent.com/jupitercim/android-emulator-helper/refs/heads/main/pic/terms.png)

如果电脑上缺少`curl`，可能会直接报错。
在上述命令运行过程中可能需要授权终端应用访问电脑的目录，还需要手动点击允许。

2. 在经过漫长的等待，而且上述运行没有报错之后，就完成了模拟器的安装。
进入命令行最后输出的`android-sdk`目录中，找到`AndroidEmulator`这个应用(如下图所示)，点击即可运行。
![](https://raw.githubusercontent.com/jupitercim/android-emulator-helper/refs/heads/main/pic/emulator.png)

如遇到其他问题，请CC上联系Sam Sang.

# Emulator-helper

## How to Install this Emulator helper

首先需要保证电脑上安装了`curl`， 并且保证电脑能够访问google 等海外服务。
同时你的电脑CPU为Apple Sillicon才可以，也就是M1/M2/M3/M4芯片的才行

1. 在你的应用程序中找到mac终端，打开并复制如下命令到其中：
```bash
bash -c "$(curl -fsSL https://raw.githubusercontent.com/jupitercim/android-emulator-helper/refs/heads/main/sdksetup.sh)"
```

终端为如下图所示这个应用：

![](https://raw.githubusercontent.com/jupitercim/android-emulator-helper/refs/heads/main/pic/terms.png)

如果电脑上缺少`curl`，可能会直接报错。
在上述命令运行过程中可能需要授权终端应用访问电脑的目录，还需要手动点击允许。

2. 在经过漫长的等待，而且上述运行没有报错之后，就完成了模拟器的安装。
进入命令行最后输出的目录中，找到`AndroidEmulator`这个应用(如下图所示)，点击即可运行。同时在系统的应用程序中也可以找到这个程序用于启动模拟器。

![](https://raw.githubusercontent.com/jupitercim/android-emulator-helper/refs/heads/main/pic/emulator.png)


## 安装和运行应用
点击`AndroidEmulator`启动模拟器，等待启动完成后。在模拟器中找到Chrome打开，在其中输入群里发的应用下载链接下载应用安装包。

等待下载完成之后，可以通过通知栏或者Chrome的下载中心找到下载的文件，点击进行安装。
首次通过Chrome安装应用会跳出如下弹框：
![](https://raw.githubusercontent.com/jupitercim/android-emulator-helper/refs/heads/main/pic/secure_tip.png)

点击Settings会跳到如下页面，打开Allow from this source后面的Switch，就可安装应用。

![](https://raw.githubusercontent.com/jupitercim/android-emulator-helper/refs/heads/main/pic/unknow_app_set.png)

如遇到其他问题，请CC上联系Sam Sang.

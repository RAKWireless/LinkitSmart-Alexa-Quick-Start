# Linkit-alexa-quick-start

## HardWare

### Connet linkit and audio board

![](https://github.com/RAKWireless/linkit-alexa-quick-start/raw/master/img/linkit-alexa/linkit-audio-connect.png)

### Interface

![](https://github.com/RAKWireless/linkit-alexa-quick-start/raw/master/img/linkit-alexa/interface.png)

### Schematic

**Note: I2S_SDI and I2S_SDO print backwards in the audio board**

![](https://github.com/RAKWireless/linkit-alexa-quick-start/raw/master/img/linkit-alexa/connect-pin.png)


Here to get [AudioBoard](https://www.aliexpress.com/store/product/WisCore-Open-Source-Hardware-Module-built-in-Amazon-Alexa-Voice-Service-function-Compatible-with-Raspberry-Pi/2805180_32811396241.html?spm=2114.12010608.0.0.3tOvIP)<br>


## SoftWare

### Prepare for SDK

#### Step 1: Get [linkitsmart7688-SDK](https://github.com/MediaTek-Labs/linkit-smart-7688-feed) from mtk and build it

Note: when compile 7688 sdk, if it failed just as:
![](https://github.com/RAKWireless/linkit-alexa-quick-start/raw/master/img/linkit-alexa/mtk-compile-wrong.png)

you should do as these, and then recompile

	cd feeds/linkit/mtk-sdk-wifi/
	mv mt_wifi.ko_3.18.44 mt_wifi.ko_3.18.45
	mv mt_wifi.ko_3.18.44_all mt_wifi.ko_3.18.45_all

#### Step 2: Enable Alexa Function

**Alexa depends some libs and utils, you need change them**

1. If your linkitsdk has these files, you need delete these files and replace them with opwrt-topdir

Delete:

	package/libs/alsa-lib 

	feeds/packages/libs/libao
	
	package/network/utils/curl
	
	package/network/utils/nghttp2

Download opwrt-topdir, and then 

	copy opwrt-topdir/* linkitSDK/

5. Install alexa feeds

	$ echo src-git rakalexa https://github.com/RAKWireless/Alexa-linkitsmart-feeds.git >> feeds.conf

### Compile the SDK
In the top directory of linkitSDK execute

	make V=s

### Burn firmware 

Burn firmware from [mtk-linkit](https://docs.labs.mediatek.com/resource/linkit-smart-7688/search?q=burn+firmware)

### Run Alexa Progress

**Note: before use alexa, you need set dsn-number in /etc/wiskeyinfo, such as "serial_num #=Rak.Alexa.000000", and the dsn-number must be different in each board**

After enter the system, set dsn-num then excute msload_go.sh to run the progress

Then [connect to internet](https://docs.labs.mediatek.com/resource/linkit-smart-7688/en/get-started/get-started-with-the-linkit-smart-7688-development-board/connect-to-the-internet)

Finally [login alexa](https://github.com/RAKWireless/wiscore/wiki/Setup-Wireless) and enjoy it

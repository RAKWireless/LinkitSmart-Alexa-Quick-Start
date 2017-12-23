# LinkitSmart-Alexa Quick Start

## Overview

![](https://github.com/RAKWireless/LinkitSmart-Alexa-Quick-Start/blob/master/img/overview.jpg)

This project is based on MediaTek linkitsmart official SDK, and compatible Amazon Alexa.

* [Introduction](Introduction.md)
	* HardWare
	* SoftWare

## Quick Start

### Prepare for SDK

#### Step 1: Get [linkitsmart7688-SDK](https://github.com/MediaTek-Labs/linkit-smart-7688-feed) from mtk and build it

Note: when compile 7688 sdk, if it failed just as:
![](https://github.com/RAKWireless/LinkitSmart-Alexa-Quick-Start/blob/master/img/linkit-alexa/mtk-compile-wrong.png)

you should do as these, and then recompile

	cd feeds/linkit/mtk-sdk-wifi/
	mv mt_wifi.ko_3.18.44 mt_wifi.ko_3.18.45
	mv mt_wifi.ko_3.18.44_all mt_wifi.ko_3.18.45_all

#### Step 2: Enable Alexa Function

**Alexa depends some libs and utils, you need change them**

1. If your linkitsmartSDK has these files, you need delete these files and replace them with opwrt-topdir/associative-dir

Delete:

	package/libs/alsa-lib

	feeds/packages/libs/libao
	
	package/network/utils/curl
	
	package/network/utils/nghttp2

Then build environment, copy opwrt-topdir/associative-dir to linkitsmart-SDK topdir

Copy next dir to your SDK:
	
	opwrt-topdir/feeds
	opwrt-topdir/package
	opwrt-topdir/target

5. Install alexa feeds as linkitsmart7688

		$ echo src-git rakalexa https://github.com/RAKWireless/LinkitSmart-Alexa-Quick-Start.git >> feeds.conf

then 

	./scripts/feeds update
	./scripts/feeds install -a

### Compile the SDK

In the top directory of linkitSDK


After modified as described above and then:

	make clean
	make V=s

### Burn firmware 

Burn firmware from [mtk-linkit](https://docs.labs.mediatek.com/resource/linkit-smart-7688/search?q=burn+firmware)

### Run Alexa Progress

**Note: before use alexa, you need set dsn-number in /etc/wiskeyinfo, such as "serial_num #=Rak.Alexa.000000", and the dsn-number must be different in each board** 		
1. After enter the system, set dsn-num then excute msload_go.sh to run the progress

2. Then [connect to internet](https://docs.labs.mediatek.com/resource/linkit-smart-7688/en/get-started/get-started-with-the-linkit-smart-7688-development-board/connect-to-the-internet)

3. Finally sign in alexa via app and enjoy it

Here you can log in Alexa,click “Amazon Alexa” 
   
   then input your amazon account and password, when you first login

![](https://github.com/RAKWireless/wiscore/blob/master/img/app/wiscore_app17.png)

   if you have signed in last time ,it’s will remember you account ,you should click “Continue” to log in.

![](https://github.com/RAKWireless/wiscore/blob/master/img/app/wiscore_app21.png)

   “Sign in” and then wait a few seconds, you will log in Alexa. Finally you can communicate with Alexa as follows

![](https://github.com/RAKWireless/wiscore/blob/master/img/app/wiscore_app22.png)

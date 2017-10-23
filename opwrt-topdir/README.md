# Build linkitsdk environment

**Alexa depends some libs and utils, you need change them**

1. Use the libs of rak-alexa

	package/libs/alsa-lib 

	feeds/packages/libs/libao
	
	package/network/utils/curl
	
	package/network/utils/nghttp2


2. Add device in 7688dts

	target/linux/ramips/dts/LINKIT7688.dts

![](https://github.com/RAKWireless/wiscore/raw/master/img/linit-alexa/linkit-alexa-dts.png)

3. Change kernel config

	target/linux/ramips/mt7688/config-3.18

	disable pwm, because trigger alexa and pwm is the same pin

![](https://github.com/RAKWireless/wiscore/raw/master/img/linkit-alexa/kernel-config-pwm.png)

	enable lzo

![](https://github.com/RAKWireless/wiscore/raw/master/img/linkit-alexa/kernel-config-lzo.png)

4. Add patches

	target/linux/ramips/patches-3.18/400-mt7688-soc-ralink.patch

You can copy these to linkitSDK, Or modify those files by your self

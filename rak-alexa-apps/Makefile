#seven
include $(TOPDIR)/rules.mk
#include $(INCLUDE_DIR)/kernel.mk

PKG_NAME:= rak-alexa-apps
PKG_RELEASE:=1
PKG_VERSION:=1.0

include $(INCLUDE_DIR)/package.mk
#PKG_BUILD_DIR:= $(BUILD_DIR)/$(PKG_NAME)
define Package/rak-alexa-apps
	SECTION:=utils
	CATEGORY:=Utilities
	TITLE:=apps and utils
  	DEPENDS:=@TARGET_ramips_mt7688_LinkIt7688 \
			+libao +libcrypto +libpthread +libcurl +librt +zlib +libuci +libopenssl +alsa-lib \
			+kmod-iio-core +kmod-lib-lzo +libiio +kmod-fs-nfs
endef

define Package/rak-alexa-apps/description
	apps building test
endef

define Build/Prepare
	mkdir -p $(PKG_BUILD_DIR)/src
	$(CP) ./src/bin/* $(PKG_BUILD_DIR)/src/
	$(CP) ./src/alexa_demo/lib $(PKG_BUILD_DIR)/src/
endef

define Build/Compile
	$(MAKE) -C src/alexa_demo/src/led \
		GCC="$(TARGET_CC)" \
		AR="$(TARGET_CROSS)ar"

	$(MAKE) -C src/alexa_demo/src \
		GCC="$(TARGET_CC)" \
		STRIP="$(TARGET_CROSS)strip"

	$(MAKE) -C src/luci_service \
		GCC="$(TARGET_CC)" \
		STRIP="$(STRIP)"

	$(CP) ./src/alexa_demo/src/alexa_run_demo $(PKG_BUILD_DIR)/src
	$(CP) ./src/luci_service/luci_service $(PKG_BUILD_DIR)/src

	
	$(MAKE) -C src/alexa_demo/src clean
	$(MAKE) -C src/luci_service clean
endef

	#$(TARGET_CONFIGURE_OPTS) CFLAGS="$(TARGET_CFLAGS) -I$(LINUX_DIR)/include"
define Package/rak-alexa-apps/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_DIR) $(1)/usr/lib
	$(INSTALL_DIR) $(1)/etc/wiskey

	$(INSTALL_BIN) $(PKG_BUILD_DIR)/src/msload_go.sh $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/src/16kk.raw $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/src/alexa_run_demo $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/src/tw_38067_access $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/src/wifistatus.sh $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/src/luci_service $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/src/unabto_tunnel $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/src/mtdtool $(1)/usr/bin

	
	$(CP) $(PKG_BUILD_DIR)/src/lib/*.so $(1)/usr/lib
	$(CP) $(PKG_BUILD_DIR)/src/sound $(1)/usr/lib

	$(CP) $(PKG_BUILD_DIR)/src/version $(1)/etc/wiskey
	
	$(INSTALL_DIR) $(1)/etc
	
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_DIR) $(1)/lib
	$(INSTALL_DIR) $(1)/sbin/

endef
	#$(INSTALL_BIN) $(PKG_BUILD_DIR)/src/16k.pcm $(1)/usr/bin
	#$(INSTALL_BIN) $(PKG_BUILD_DIR)/src/48k.pcm $(1)/usr/bin
	#$(CP) $(PKG_BUILD_DIR)/src/wisalexainfo $(1)/etc
	
$(eval $(call BuildPackage,rak-alexa-apps))


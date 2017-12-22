#
# Copyright (C) 2015 John Crispin <blogic@openwrt.org>
#
# This is free software, licensed under the GPL 2 license.
#

include $(TOPDIR)/rules.mk

include $(INCLUDE_DIR)/kernel.mk
PKG_NAME:=rak-alexa-env
PKG_RELEASE:=1

include $(INCLUDE_DIR)/package.mk

define Package/rak-alexa-env
  SECTION:=alexa
  CATEGORY:=Alexa Env
  TITLE:=MT7628/88 alexa
  DEPENDS:=@TARGET_ramips_mt7688_LinkIt7688 +rak-alexa-apps

  DEFAULT:=y
endef

define Package/rak-alexa-env/description
  alexa environments which include some libs and drivers
endef

define Build/Configure
	mkdir -p $(PKG_BUILD_DIR)
endef

define Build/Compile
endef

define Package/rak-alexa-env/install
	$(INSTALL_DIR) $(1)/lib/modules/$(LINUX_VERSION)/
	
	$(CP) ./alexa-driver/* $(1)/lib/modules/$(LINUX_VERSION)/
	$(CP) ./files/* $(1)

endef

$(eval $(call BuildPackage,rak-alexa-env))

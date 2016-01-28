##############################################
# OpenWrt Makefile for nodejs program
#
##############################################
include $(TOPDIR)/rules.mk
# Name and release number of this package
#PKG_NAME:=nodejs
#PKG_RELEASE:=1


PKG_NAME:=node-v4.2.6
PKG_VERSION:=v4.2.6
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME).tar.gz
PKG_SOURCE_URL:=https://nodejs.org/dist/v4.2.6/
PKG_MD5SUM:=b1287c356e904954da7e0c6435ff9948
PKG_MAINTAINER:=Richard-Qian

PKG_INSTALL:=1


PKG_BUILD_DIR := $(BUILD_DIR)/$(PKG_NAME)

include $(INCLUDE_DIR)/package.mk
 
define Package/nodejs
	SECTION:=utils
	CATEGORY:=Utilities
	TITLE:=nodejs.
	DEPENDS:= +libstdcpp +libstdc++ +libpthread +librt
endef

define Package/nodejs/description
	Nodejs package compiled by openwrt toolchains
endef
 
#define Build/Prepare
#	#mkdir -p $(PKG_BUILD_DIR)
#	#$(CP) ./src/* $(PKG_BUILD_DIR)/
#endef
CONFIGURE_ARGS= \
	--dest-cpu=$(ARCH) \
	--dest-os=linux \
	--without-snapshot \
	--without-npm 
	
#TARGET_LDFLAGS+=-rpath-link $(shell find $(STAGING_DIR) -name ld-uClibc.so.0)
#TARGET_LDFLAGS+= -L/home/weeds/Work/github/qianguozheng/oschina/openwrt-3.10.14/build_dir/toolchain-mipsel_24kec+dsp_gcc-4.8-linaro_uClibc-0.9.33.2/uClibc-0.9.33.2/lib/ld-uClibc.so.0

define Package/nodejs/install
	mkdir -p $(1)/usr/bin/
	$(CP) -rf  $(PKG_BUILD_DIR)/out/Release/node $(1)/usr/bin/
endef

# build a package.
$(eval $(call BuildPackage,nodejs))


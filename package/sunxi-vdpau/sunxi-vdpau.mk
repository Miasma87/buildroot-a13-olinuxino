################################################################################
#
# sunxi-vdpau
#
################################################################################

SUNXI_VDPAU_VERSION = 30c11e1a113b6447dd52cab7227720e3e01cc016
SUNXI_VDPAU_SITE = $(call github,linux-sunxi,libvdpau-sunxi,$(SUNXI_VDPAU_VERSION))

SUNXI_VDPAU_DEPENDENCIES = host-pkgconf libvdpau-dev
SUNXI_VDPAU_INSTALL_STAGING = YES
SUNXI_VDPAU_INSTALL_TARGET = YES

SUNXI_VDPAU_MAKE_ENV = \
	CFLAGS="$(TARGET_CFLAGS) -I$(TARGET_DIR)/usr/include" \
	$(TARGET_MAKE_ENV)


ifeq ($(BR2_ARM_EABIHF),y)
SUNXI_VDPAU_MAKE_ENV = \
	CC="$(TARGET_CC) -D__ARM_PCS_VFP" \
	$(TARGET_MAKE_ENV)
endif

define SUNXI_MALI_BUILD_CMDS
	$(SUNXI_MALI_MAKE_ENV) $(MAKE) -C $(@D) $(SUNXI_MALI_MAKE_OPTS) all
endef

define SUNXI_VDPAU_INSTALL_STAGING_CMDS
	$(SUNXI_VDPAU_MAKE_ENV) $(MAKE) -C $(@D) \
		$(SUNXI_VDPAU_MAKE_OPTS) DESTDIR=$(STAGING_DIR) install
endef

define SUNXI_VDPAU_INSTALL_TARGET_CMDS
	$(SUNXI_VDPAU_MAKE_ENV) $(MAKE) -C $(@D) \
		$(SUNXI_VDPAU_MAKE_OPTS) DESTDIR=$(TARGET_DIR) install
endef

define SUNXI_VDPAU_INSTALL_TARGET_CMDS
	$(SUNXI_VDPAU_MAKE_ENV) $(MAKE) -C $(@D) \
		$(SUNXI_VDPAU_MAKE_OPTS) DESTDIR=$(TARGET_DIR) install
endef

$(eval $(generic-package))

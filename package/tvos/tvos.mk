################################################################################
#
# TVOS
#
################################################################################

TVOS_VERSION = master
TVOS_SITE = $(call github,Miasma87,tvos,$(TVOS_VERSION))
TVOS_LICENSE = GPLv2+ LGPLv2.1+
#TVOS_LICENSE_FILES = COPYING COPYING.LIB
TVOS_DEPENDENCIES = host-pkgconf libcedarx
#TVOS_AUTORECONF = YES
#TVOS_INSTALL_STAGING = YES

#define TVOS_RUN_AUTOGEN
#    cd $(@D) ; ./bootstrap
#endef
#TVOS_POST_PATCH_HOOKS += TVOS_RUN_AUTOGEN

define TVOS_INIT_SCRIPT_INSTALL
	[ -f $(TARGET_DIR)/etc/init.d/S99TVOS ] || \
		$(INSTALL) -m 0755 -D package/tvos/S99TVOS \
			$(TARGET_DIR)/etc/init.d/S99TVOS
endef
TVOS_POST_INSTALL_TARGET_HOOKS += TVOS_INIT_SCRIPT_INSTALL

$(eval $(generic-package))

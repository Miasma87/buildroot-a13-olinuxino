################################################################################
#
# libcedarX
#
################################################################################

LIBCEDARX_VERSION = c7f4c949b10b69b6e92e3de0ef200ff59988f1fc
LIBCEDARX_SITE = $(call github,willswang,libcedarx,$(LIBCEDARX_VERSION))

LIBCEDARX_INSTALL_STAGING = YES

define LIBCEDARX_RUN_AUTOGEN
    cd $(@D) && ./autogen.sh
endef
LIBCEDARX_PRE_CONFIGURE_HOOKS += LIBCEDARX_RUN_AUTOGEN

LIBCEDARX_CONF_OPT += \
	--prefix=/usr

$(eval $(autotools-package))

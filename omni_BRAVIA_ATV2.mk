$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base.mk)

# Otherwise, If you have 32-bit device, add the below line instead of above line
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_minimal.mk

# Another common config inclusion
$(call inherit-product, $(SRC_TARGET_DIR)/product/embedded.mk)

# Replace ${_CODENAME_} with your Device Name's Value.
# Replace ${_VENDORNAME_} with your Brand's / Manufacturer's Value.
PRODUCT_COPY_FILES += device/${Sony}/${BRAVIA_ATV2}/prebuilt/kernel:kernel
# Fles under $(LOCAL_PATH)/recovery/root/ gets automatically copied into recovery
# PRODUCT_COPY_FILES += $(LOCAL_PATH)/recovery/root/*:root/*
PRODUCT_DEVICE := $BRAVIA_ATV2
PRODUCT_NAME := omni_BRAVIA_ATV2
PRODUCT_BRAND := Sony
PRODUCT_MODEL := BRAVIA 4K GB 
PRODUCT_MANUFACTURER := Sony

# Forcefully add mtp support (adb is already there)
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    persist.sys.usb.config=mtp

# Add fingerprint from Stock ROM build.prop
PRODUCT_BUILD_PROP_OVERRIDES += \
    # These lines are from my device. You MUST Replace yours.
    BUILD_FINGERPRINT="Sony/BRAVIA_ATV2_EU/BRAVIA_ATV2:9/PTT1.190515.001.S52/672101:user/release-keys" \
    PRIVATE_BUILD_DESC="BRAVIA_ATV2_EU-user 9 PTT1.190515.001.S52 672101 release-keys"
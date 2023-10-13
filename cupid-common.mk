#
# Copyright (C) 2023 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Enable updating of APEXes
$(call inherit-product, $(SRC_TARGET_DIR)/product/updatable_apex.mk)

# Installs gsi keys into ramdisk, to boot a developer GSI with verified boot.
$(call inherit-product, $(SRC_TARGET_DIR)/product/developer_gsi_keys.mk)

# Dynamic Partitions
PRODUCT_USE_DYNAMIC_PARTITIONS := true
PRODUCT_BUILD_SUPER_PARTITION := false

PRODUCT_PACKAGES += \
    fastbootd

# Health
PRODUCT_PACKAGES += \
    android.hardware.health@2.1-impl \
    android.hardware.health@2.1-impl.recovery \
    android.hardware.health@2.1-service

# Overlays
PRODUCT_ENFORCE_RRO_TARGETS := *

# Recovery
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/init/init.recovery.sun50iw9p1.rc:recovery/root/init.recovery.sun50iw9p1.rc

# Rootdir
PRODUCT_PACKAGES += \
    fstab.sun50iw9p1 \
    fstab.sun50iw9p1_ramdisk \
    init.device.rc \
    init.display.rc \
    init.sun50iw9p1.rc \
    init.sun50iw9p1.usb.rc \
    ueventd.sun50iw9p1.rc

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(LOCAL_PATH)

# Inherit the proprietary files
$(call inherit-product, vendor/allwinner/cupid-common/cupid-common-vendor.mk)

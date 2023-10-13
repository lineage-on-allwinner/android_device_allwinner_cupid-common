#
# Copyright (C) 2023 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Enable updating of APEXes
$(call inherit-product, $(SRC_TARGET_DIR)/product/updatable_apex.mk)

# Installs gsi keys into ramdisk, to boot a developer GSI with verified boot.
$(call inherit-product, $(SRC_TARGET_DIR)/product/developer_gsi_keys.mk)

# Audio
PRODUCT_PACKAGES += \
    android.hardware.audio.service \
    android.hardware.audio@5.0-impl \
    android.hardware.audio.effect@5.0-impl \
    audio.bluetooth.default \
    audio.usb.default \
    audio.r_submix.default

PRODUCT_PACKAGES += \
    android.hardware.soundtrigger@2.0-impl

PRODUCT_COPY_FILES += \
    $(call find-copy-subdir-files,*,$(LOCAL_PATH)/configs/audio/,$(TARGET_COPY_OUT_VENDOR)/etc)

PRODUCT_COPY_FILES += \
    frameworks/av/services/audiopolicy/config/bluetooth_audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/bluetooth_audio_policy_configuration.xml \
    frameworks/av/services/audiopolicy/config/r_submix_audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/r_submix_audio_policy_configuration.xml \
    frameworks/av/services/audiopolicy/config/default_volume_tables.xml:$(TARGET_COPY_OUT_VENDOR)/etc/default_volume_tables.xml

# Bluetooth
PRODUCT_PACKAGES += \
    android.hardware.bluetooth@1.0-impl-aw \
    android.hardware.bluetooth@1.0-service \
    android.hardware.bluetooth.audio@2.1-impl \
    libbt-xradio \
    libbt-broadcom \
    libbt-realtek \
    libbt-sprd \
    init.wireless.bluetooth.rc

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/bluetooth/bt_vendor.conf:$(TARGET_COPY_OUT_VENDOR)/etc/bluetooth/bt_vendor.conf \
    $(LOCAL_PATH)/configs/bluetooth/rtkbt.conf:$(TARGET_COPY_OUT_VENDOR)/etc/bluetooth/rtkbt.conf

PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.bluetooth.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.bluetooth.xml \
    frameworks/native/data/etc/android.hardware.bluetooth_le.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.bluetooth_le.xml

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

# Wireless
PRODUCT_PACKAGES += \
    wireless_hwinfo

# Inherit the proprietary files
$(call inherit-product, vendor/allwinner/cupid-common/cupid-common-vendor.mk)

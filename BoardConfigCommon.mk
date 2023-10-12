#
# Copyright (C) 2023 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

COMMON_PATH := device/allwinner/cupid-common

# Architecture
TARGET_ARCH := arm
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_CPU_VARIANT := generic
TARGET_CPU_VARIANT_RUNTIME := cortex-a53

TARGET_USES_64_BIT_BINDER := true

# Boot
BOARD_KERNEL_BASE := 0x40000000
BOARD_MKBOOTIMG_ARGS := --kernel_offset 0x80000 --ramdisk_offset 0x03000000 --dtb_offset 0x4000000 --header_version 0x2
BOARD_INCLUDE_DTB_IN_BOOTIMG := true

BOARD_KERNEL_CMDLINE := firmware_class.path=/vendor/etc/firmware selinux=1
BOARD_KERNEL_CMDLINE += androidboot.dtbo_idx=0,1,2
BOARD_KERNEL_CMDLINE += androidboot.selinux=permissive
BOARD_KERNEL_CMDLINE += androidboot.init_fatal_reboot_target=recovery

# Kernel
TARGET_KERNEL_ARCH := arm64
TARGET_KERNEL_HEADER_ARCH := arm64
TARGET_KERNEL_SOURCE := kernel/allwinner/h6
TARGET_KERNEL_CLANG_COMPILE := false
BOARD_KERNEL_IMAGE_NAME := Image
TARGET_KERNEL_ADDITIONAL_FLAGS := \
    HOSTCFLAGS="-fuse-ld=lld -Wno-unused-command-line-argument"

# Platform
TARGET_BOARD_PLATFORM := cupid
TARGET_BOOTLOADER_BOARD_NAME := sun50iw9p1

# Verified Boot
BOARD_AVB_ENABLE := true
BOARD_AVB_MAKE_VBMETA_IMAGE_ARGS += --flags 3
BOARD_AVB_RECOVERY_KEY_PATH := external/avb/test/data/testkey_rsa4096.pem
BOARD_AVB_RECOVERY_ALGORITHM := SHA256_RSA4096
BOARD_AVB_RECOVERY_ROLLBACK_INDEX := 1
BOARD_AVB_RECOVERY_ROLLBACK_INDEX_LOCATION := 1

# VNDK
BOARD_VNDK_VERSION := current

# Inherit the proprietary files
include vendor/allwinner/cupid-common/BoardConfigVendor.mk

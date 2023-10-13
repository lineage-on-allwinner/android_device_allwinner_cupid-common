#
# Copyright (C) 2023 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)
LOCAL_MODULE	   := fstab.sun50iw9p1_ramdisk
LOCAL_MODULE_STEM  := fstab.sun50iw9p1
LOCAL_MODULE_TAGS  := optional
LOCAL_MODULE_CLASS := ETC
LOCAL_SRC_FILES    := fstab.sun50iw9p1
LOCAL_MODULE_PATH  := $(TARGET_RAMDISK_OUT)
include $(BUILD_PREBUILT)

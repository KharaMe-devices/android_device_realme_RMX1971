#
# Copyright (C) 2019 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from Realme sdm710-common
include device/realme/sdm710-common/BoardConfigCommon.mk

DEVICE_PATH := device/realme/RMX1971

# Assert
TARGET_OTA_ASSERT_DEVICE := RMX1971,RMX1971CN

# Kernel
BOARD_KERNEL_CMDLINE     := console=ttyMSM0,115200n8 earlycon=msm_geni_serial,0xA90000 androidboot.hardware=qcom androidboot.console=ttyMSM0 video=vfb:640x400,bpp=32,memsize=3072000 msm_rtb.filter=0x237 ehci-hcd.park=3 lpm_levels.sleep_disabled=1 service_locator.enable=1 androidboot.configfs=true androidboot.usbcontroller=a600000.dwc3 swiotlb=1 loop.max_part=7
BOARD_KERNEL_CMDLINE     += androidboot.selinux=permissive
BOARD_KERNEL_BASE        := 0x00000000
BOARD_KERNEL_PAGESIZE    := 4096
BOARD_KERNEL_TAGS_OFFSET := 0x00000100
BOARD_KERNEL_IMAGE_NAME  := Image.gz-dtb
BOARD_RAMDISK_OFFSET     := 0x01000000

TARGET_KERNEL_ARCH 	 := arm64
ifeq ($(TARGET_PREBUILT_KERNEL),)
TARGET_KERNEL_HEADER_ARCH := arm64
TARGET_KERNEL_CLANG_COMPILE := true
TARGET_KERNEL_SOURCE := kernel/msm-4.9
TARGET_KERNEL_CONFIG := RMX1971_defconfig
endif

# Partitions
BOARD_BUILD_SYSTEM_ROOT_IMAGE := true

# Verified Boot
BOARD_AVB_ENABLE := true
BOARD_AVB_MAKE_VBMETA_IMAGE_ARGS += --flag 2

# Inherit from the proprietary version
-include vendor/realme/RMX1971/BoardConfigVendor.mk

# Copyright (C) 2009 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

#
# This file is the build configuration for a full Android
# build for sapphire hardware. This cleanly combines a set of
# device-specific aspects (drivers) with a device-agnostic
# product configuration (apps).
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base.mk)

$(call inherit-product, device/common/gps/gps_eu_supl.mk)

DEVICE_PACKAGE_OVERLAYS := device/huawei/u8800pro/overlay

# Discard inherited values and use our own instead.
PRODUCT_NAME := huawei_u8800pro
PRODUCT_DEVICE := u8800pro
PRODUCT_MODEL := huawei u8800pro
# Geno ADD
#PRODUCT_LOCALES := zh_CN zh_TW en_US

PRODUCT_PACKAGES += \
    LiveWallpapers \
    LiveWallpapersPicker \
    VisualizationWallpapers \
    MagicSmokeWallpapers \
    VisualizationWallpapers \
    librs_jni \
    Gallery3d \
    SpareParts \
    Term \
    overlay.default \
    gps.u8800pro \
    lights.u8800pro \
    gralloc.u8800pro \
    libOmxCore \
    libOmxVdec \
    libOmxVenc \
    dexpreopt \
    load_wifi \
    Torch \
    CMStats \

# proprietary side of the device
$(call inherit-product-if-exists, vendor/huawei/u8800pro/u8800pro-vendor.mk)

DISABLE_DEXPREOPT := false

# Init
PRODUCT_COPY_FILES += \
    device/huawei/u8800pro/init.huawei.rc:root/init.huawei.rc \
    device/huawei/u8800pro/init.rc:root/init.rc \
    device/huawei/u8800pro/init:root/init \
    device/huawei/u8800pro/adbd:root/sbin/adbd \
    device/huawei/u8800pro/ueventd.rc:root/ueventd.rc \
    device/huawei/u8800pro/initlogo.rle:root/initlogo.rle

# keylayout
PRODUCT_COPY_FILES += \
    device/huawei/u8800pro/qwerty.kl:system/usr/keylayout/qwerty.kl

# fstab
PRODUCT_COPY_FILES += \
    device/huawei/u8800pro/vold.fstab:system/etc/vold.fstab

# enhanced.conf
PRODUCT_COPY_FILES += \
    device/huawei/u8800pro/enhanced.conf:system/etc/enhanced.conf

PRODUCT_COPY_FILES += \
    device/huawei/u8800pro/init.qcom.bt.sh:system/etc/init.qcom.bt.sh \
    device/huawei/u8800pro/wpa_supplicant.conf:system/etc/wifi/wpa_supplicant.conf \
    device/huawei/u8800pro/dhcpcd.conf:system/etc/dhcpcd/dhcpcd.conf \
    device/huawei/u8800pro/media_profiles.xml:system/etc/media_profiles.xml

# vidc firmware
PRODUCT_COPY_FILES += \
    device/huawei/u8800pro/firmware/vidc_720p_command_control.fw:/system/etc/firmware/vidc_720p_command_control.fw \
    device/huawei/u8800pro/firmware/vidc_720p_h263_dec_mc.fw:/system/etc/firmware/vidc_720p_h263_dec_mc.fw \
    device/huawei/u8800pro/firmware/vidc_720p_h264_dec_mc.fw:/system/etc/firmware/vidc_720p_h264_dec_mc.fw \
    device/huawei/u8800pro/firmware/vidc_720p_h264_enc_mc.fw:/system/etc/firmware/vidc_720p_h264_enc_mc.fw \
    device/huawei/u8800pro/firmware/vidc_720p_mp4_dec_mc.fw:/system/etc/firmware/vidc_720p_mp4_dec_mc.fw \
    device/huawei/u8800pro/firmware/vidc_720p_mp4_enc_mc.fw:/system/etc/firmware/vidc_720p_mp4_enc_mc.fw \
    device/huawei/u8800pro/firmware/vidc_720p_vc1_dec_mc.fw:/system/etc/firmware/vidc_720p_vc1_dec_mc.fw \

# Install the features available on this device.
PRODUCT_COPY_FILES += \
    frameworks/base/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
    frameworks/base/data/etc/android.hardware.camera.autofocus.xml:system/etc/permissions/android.hardware.camera.autofocus.xml \
    frameworks/base/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/base/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/base/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/base/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/base/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/base/data/etc/android.hardware.touchscreen.multitouch.distinct.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.distinct.xml

#WIFI Modules
PRODUCT_COPY_FILES += \
    device/huawei/u8800pro/prebuilt/dhd.ko:/system/wifi/dhd.ko \

# prebuilt
PRODUCT_COPY_FILES += \
    device/huawei/u8800pro/prebuilt/libhardware_legacy.so:/system/lib/libhardware_legacy.so \
    device/huawei/u8800pro/prebuilt/overlay.default.so:/system/lib/hw/overlay.default.so \
#    device/huawei/u8800pro/prebuilt/libsensorservice.so:/system/lib/libsensorservice.so \


PRODUCT_PROPERTY_OVERRIDES += \
    ro.com.android.dateformat=dd-MM-yyyy \
    ro.build.baseband_version=129005 \
    ro.telephony.default_network=0 \
    ro.telephony.call_ring.multiple=false \
    ro.ril.hsxpa=1 \
    ro.ril.gprsclass=10 \


PRODUCT_PROPERTY_OVERRIDES += \
    rild.libpath=/system/lib/libril-qc-1.so \
    rild.libargs=-d /dev/smd0 \
    ro.telephony.ril_class=semc \
    wifi.interface=eth0 \
    wifi.supplicant_scan_interval=150 \
    ro.config.wifi_chip_is_bcm=true \
    ro.com.android.dataroaming=false

PRODUCT_PROPERTY_OVERRIDES += \
    ro.sf.lcd_density=240 \
    persist.sys.timezone=Asia/Shanghai

PRODUCT_PROPERTY_OVERRIDES += \
    ro.config.hwfeature_slavecamera=yes \
    ro.config.hwcameraset=63 \
    hw.secondary_mic=0 \
    ro.config.hw_addsettingsdbex=1 \
    ro.config.hw_gcf_mms=true \
    ro.config.wifi_chip_is_bcm=false \
    ro.config.hwft_PNN_function=true \
    persist.cust.tel.adapt=1 \
    persist.cust.tel.eons=1 \
    ro.config.hwfeature_gps_test=0 \
    ro.config.hwfeature_ecc=true \
    ro.config.lowbattery_shutdown=1 \
    ro.config.hwfeature_wakeupkey=1 \
    ro.config.endkeybehavior=true \
    ro.config.hw_menu_unlockscreen=false \
    ro.media.enc.lprof.duration=30 \
    ro.config.PicMaxSize=5mp \
    ro.config.hw_temperature_warn=true \
    ro.config.hw_clocksetting=0 \
    ro.additionalmounts=/HWUserData \
    ro.vold.switchablepair=/mnt/sdcard,/HWUserData \
    ro.vold.umsdirtyratio=20 \

# u8800pro uses high-density artwork where available
PRODUCT_LOCALES += hdpi

# we have enough storage space to hold precise GC data
PRODUCT_TAGS += dalvik.gc.type-precise

# This should not be needed but on-screen keyboard uses the wrong density without it.
PRODUCT_PROPERTY_OVERRIDES += \
    qemu.sf.lcd_density=240 


PRODUCT_PROPERTY_OVERRIDES += \
    ro.com.google.locationfeatures=1 \
    ro.setupwizard.enable_bypass=1 \
    ro.media.dec.jpeg.memcap=20000000 \
    dalvik.vm.lockprof.threshold=500 \
    dalvik.vm.dexopt-flags=m=y \
    dalvik.vm.heapsize=32m \
    dalvik.vm.execution-mode=int:jit \
    dalvik.vm.dexopt-data-only=1 \
    ro.opengles.version=131072  \
    ro.compcache.default=0


# addon by Geno
$(call inherit-product-if-exists, addon/addon.mk)
$(call inherit-product-if-exists, device/huawei/u8800pro/wifi/wifi.mk)


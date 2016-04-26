#
# Copyright (C) 2016 The YUTeleventures
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
$(call inherit-product-if-exists, vendor/yu/lettuce/lettuce-vendor.mk)

$(call inherit-product, frameworks/native/build/phone-hdpi-2048-dalvik-heap.mk)
$(call inherit-product, frameworks/native/build/phone-xxhdpi-2048-hwui-memory.mk)

# WCNSS
PRODUCT_COPY_FILES += \
    device/qcom/msm8916_64/WCNSS_qcom_wlan_nv.bin:system/etc/firmware/wlan/prima/WCNSS_qcom_wlan_nv.bin

# Ramdisk
PRODUCT_COPY_FILES += \
    $(call find-copy-subdir-files,*,device/yu/lettuce/ramdisk,root)

# Prebuilt
PRODUCT_COPY_FILES += \
    $(call find-copy-subdir-files,*,device/yu/lettuce/prebuilt/system,system)

# CodeAurora msm8916_64 Tree
include device/qcom/msm8916_64/msm8916_64.mk

# Overlay
DEVICE_PACKAGE_OVERLAYS += device/yu/lettuce/overlay
PRODUCT_PACKAGE_OVERLAYS += device/yu/lettuce/overlay


# Screen density
PRODUCT_AAPT_CONFIG := normal
PRODUCT_AAPT_PREF_CONFIG := xhdpi

# System property
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    persist.sys.usb.config=mtp

# ANT+
PRODUCT_PACKAGES += \
    AntHalService \
    com.dsi.ant.antradio_library \
    libantradio

# Camera
PRODUCT_PACKAGES += \
    libmm-qcamera

# Charger
ADDITIONAL_DEFAULT_PROPERTIES += \
    ro.usb.id.charge=3009 \
    ro.usb.id.mtp=3003 \
    ro.usb.id.mtp_adb=3004 \
    ro.usb.id.ptp=3005 \
    ro.usb.id.ptp_adb=3006 \
    ro.usb.id.ums=3007 \
    ro.usb.id.ums_adb=3008 \
    ro.usb.vid=2a96

# GPS
PRODUCT_PACKAGES += \
    gps.msm8916

# Keystore
PRODUCT_PACKAGES += \
    keystore.msm8916 \
    keystore.qcom

# Power HAL
PRODUCT_PACKAGES += \
    power.msm8916 \
    power.qcom

# Sensor HAL
PRODUCT_PACKAGES += \
    calmodule.cfg \
    libcalmodule_akm.so \
    libcalmodule_common \
    sensors.msm8916

# USB
PRODUCT_PACKAGES += \
    com.android.future.usb.accessory

# Wifi
PRODUCT_PACKAGES += \
    libwpa_client \
    libwcnss_qmi \
    wcnss_service

#
# Copyright (C) 2017 The LineageOS Project
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

$(call inherit-product, vendor/huawei/cherryplus/cherryplus-vendor.mk)
$(call inherit-product-if-exists, device/huawei/apps/myapps.mk)

# Overlays
DEVICE_PACKAGE_OVERLAYS += $(LOCAL_PATH)/overlay

PRODUCT_COPY_FILES += \
    frameworks/av/media/libstagefright/data/media_codecs_google_audio.xml:system/etc/media_codecs_google_audio.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_telephony.xml:system/etc/media_codecs_google_telephony.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_video.xml:system/etc/media_codecs_google_video.xml

# Permissions
NATIVE_PATH := frameworks/native/data/etc
PERM_PATH := system/etc/permissions
AHARD := android.hardware
PRODUCT_COPY_FILES += \
    $(NATIVE_PATH)/$(AHARD).bluetooth.xml:$(PERM_PATH)/$(AHARD).bluetooth.xml \
    $(NATIVE_PATH)/$(AHARD).bluetooth_le.xml:$(PERM_PATH)/$(AHARD).bluetooth_le.xml \
    $(NATIVE_PATH)/$(AHARD).camera.external.xml:$(PERM_PATH)/$(AHARD).camera.external.xml \
    $(NATIVE_PATH)/$(AHARD).camera.flash-autofocus.xml:$(PERM_PATH)/$(AHARD).camera.flash-autofocus.xml \
    $(NATIVE_PATH)/$(AHARD).camera.front.xml:$(PERM_PATH)/$(AHARD).camera.front.xml \
    $(NATIVE_PATH)/$(AHARD).camera.xml:$(PERM_PATH)/$(AHARD).camera.xml \
    $(NATIVE_PATH)/$(AHARD).location.gps.xml:$(PERM_PATH)/$(AHARD).location.gps.xml \
    $(NATIVE_PATH)/$(AHARD).location.xml:$(PERM_PATH)/$(AHARD).location.xml \
    $(NATIVE_PATH)/$(AHARD).opengles.aep.xml:$(PERM_PATH)/$(AHARD).opengles.aep.xml \
    $(NATIVE_PATH)/$(AHARD).sensor.accelerometer.xml:$(PERM_PATH)/$(AHARD).sensor.accelerometer.xml \
    $(NATIVE_PATH)/$(AHARD).sensor.compass.xml:$(PERM_PATH)/$(AHARD).sensor.compass.xml \
    $(NATIVE_PATH)/$(AHARD).sensor.gyroscope.xml:$(PERM_PATH)/$(AHARD).sensor.gyroscope.xml \
    $(NATIVE_PATH)/$(AHARD).sensor.light.xml:$(PERM_PATH)/$(AHARD).sensor.light.xml \
    $(NATIVE_PATH)/$(AHARD).sensor.proximity.xml:$(PERM_PATH)/$(AHARD).sensor.proximity.xml \
    $(NATIVE_PATH)/$(AHARD).sensor.stepcounter.xml:$(PERM_PATH)/$(AHARD).sensor.stepcounter.xml \
    $(NATIVE_PATH)/$(AHARD).telephony.gsm.xml:$(PERM_PATH)/$(AHARD).telephony.gsm.xml \
    $(NATIVE_PATH)/$(AHARD).telephony.cdma.xml:$(PERM_PATH)/$(AHARD).telephony.cdma.xml \
    $(NATIVE_PATH)/$(AHARD).touchscreen.multitouch.jazzhand.xml:$(PERM_PATH)/$(AHARD).touchscreen.multitouch.jazzhand.xml \
    $(NATIVE_PATH)/$(AHARD).usb.accessory.xml:$(PERM_PATH)/$(AHARD).usb.accessory.xml \
    $(NATIVE_PATH)/$(AHARD).usb.host.xml:$(PERM_PATH)/$(AHARD).usb.host.xml \
    $(NATIVE_PATH)/$(AHARD).wifi.xml:$(PERM_PATH)/$(AHARD).wifi.xml \
    $(NATIVE_PATH)/android.software.app_widgets.xml:$(PERM_PATH)/android.software.app_widgets.xml \
    $(NATIVE_PATH)/android.software.midi.xml:$(PERM_PATH)/android.software.midi.xml \
    $(NATIVE_PATH)/handheld_core_hardware.xml:$(PERM_PATH)/handheld_core_hardware.xml

# Screen density
PRODUCT_AAPT_CONFIG := normal
PRODUCT_AAPT_PREF_CONFIG := xhdpi

PRODUCT_TAGS += dalvik.gc.type-precise

# Audio
PRODUCT_PACKAGES += \
    audio.primary.default \
    audio.a2dp.default \
    audio.usb.default \
    audio.r_submix.default \
    libaudioutils \
    libaudioroute \
    libtinyalsa \
    libtinyxml \
    tinyplay \
    tinycap \
    tinymix \
    tinypcminfo

# KEYPAD
PRODUCT_PACKAGES += \
    usbaudio.kl

# Ramdisk
PRODUCT_PACKAGES += \
    fstab.hi6210sft \
    init.chip.usb.rc \
    init.hi6210sft.power.rc \
    init.hi6210sft.rc \
    init.hi6210sft.usb.rc \
    ueventd.hi6210sft.rc

PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    ro.magic.api.version=0.1 \
    persist.sys.usb.config=mtp

# adb as root
ADDITIONAL_DEFAULT_PROPERTIES += \
    ro.secure=0 \
    ro.adb.secure=0 \
    security.perf_harden=0 \
    ro.allow.mock.location=1

# USB
PRODUCT_PACKAGES += \
    com.android.future.usb.accessory

PRODUCT_PACKAGES += \
    ambientsdk

# Wifi
PRODUCT_PACKAGES += \
    libwpa_client \
    dhcpcd.conf \
    hostapd \
    wpa_supplicant \
    wpa_supplicant.conf

ifeq ($(BUILD_FULL_STAGEFRIGHT_K3),true)
PRODUCT_PACKAGES += libstagefrighthw
endif

PRODUCT_PACKAGES += \
	libshim_icu \
	libshim_wvm

# USB OTG support
PRODUCT_PROPERTY_OVERRIDES += \
	persist.sys.isUsbOtgEnabled=true

PRODUCT_PROPERTY_OVERRIDES += ro.telephony.ril_class=HuaweiRIL

# TWRP
PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/rootdir/twrp.fstab:recovery/root/etc/twrp.fstab \
	bionic/libc/zoneinfo/tzdata:recovery/root/system/usr/share/zoneinfo/tzdata

# Use ART small mode
#PRODUCT_PROPERTY_OVERRIDES += \
#	dalvik.vm.dex2oat-filter=balanced \
#	dalvik.vm.dex2oat-flags=--no-watch-dog \
#	dalvik.vm.image-dex2oat-filter=speed
#PRODUCT_PROPERTY_OVERRIDES += \
#	persist.sys.root_access=1

-include hardware/broadcom/wlan/bcmdhd/config/config-bcm.mk 
$(call inherit-product, frameworks/native/build/phone-xhdpi-2048-dalvik-heap.mk)

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

$(call inherit-product-if-exists, vendor/huawei/cherryplus/cherryplus-vendor.mk)
$(call inherit-product-if-exists, device/huawei/gapps/gapps.mk)
$(call inherit-product-if-exists, device/huawei/apps/myapps.mk)

# Overlays
DEVICE_PACKAGE_OVERLAYS += $(LOCAL_PATH)/overlay

# Media configuration
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/prebuilts/media_codecs.xml:system/etc/media_codecs.xml \
    $(LOCAL_PATH)/prebuilts/media_codecs_performance.xml:system/etc/media_codecs_performance.xml \
    $(LOCAL_PATH)/prebuilts/media_profiles.xml:system/etc/media_profiles.xml

PRODUCT_COPY_FILES += \
    frameworks/av/media/libstagefright/data/media_codecs_google_audio.xml:system/etc/media_codecs_google_audio.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_telephony.xml:system/etc/media_codecs_google_telephony.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_video.xml:system/etc/media_codecs_google_video.xml

# Audio configuration file
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/prebuilts/audio_effects.conf:system/vendor/etc/audio_effects.conf \
    $(LOCAL_PATH)/prebuilts/audio_policy.conf:system/etc/audio_policy.conf

# Camera
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/prebuilts/camera_orientation.cfg:system/etc/camera_orientation.cfg \
    $(LOCAL_PATH)/prebuilts/camera_resolutions.cfg:system/etc/camera_resolutions.cfg \
    $(LOCAL_PATH)/prebuilts/camera_videosnapshot.cfg:system/etc/camera_videosnapshot.cfg

# GPS
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/prebuilts/clatd.conf:system/etc/clatd.conf \
    $(LOCAL_PATH)/prebuilts/gps.conf:system/etc/gps.conf \
    $(LOCAL_PATH)/prebuilts/gpsconfig.xml:system/etc/gpsconfig.xml \
    $(LOCAL_PATH)/prebuilts/gpsconfig_beta.xml:system/etc/gpsconfig_beta.xml

# Misc
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/prebuilts/device_monitor_for_nff.conf:system/etc/device_monitor_for_nff.conf \
    $(LOCAL_PATH)/prebuilts/device_state_monitor.conf:system/etc/device_state_monitor.conf \
    $(LOCAL_PATH)/prebuilts/hisi_cfg.ini:system/etc/hisi_cfg.ini \
    $(LOCAL_PATH)/prebuilts/hisi_cfg_cherry.ini:system/etc/hisi_cfg_cherry.ini \
    $(LOCAL_PATH)/prebuilts/hisi_omx.cfg.txt:system/etc/hisi_omx_cfg.txt


# Thermal engine
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/prebuilts/thermald.xml:system/etc/thermald.xml \
    $(LOCAL_PATH)/prebuilts/thermald_performance.xml:system/etc/thermald_performance.xml

# Permissions
NATIVE_PATH := frameworks/native/data/etc
PERM_PATH := system/etc/permissions
PRODUCT_COPY_FILES += \
    $(NATIVE_PATH)/android.hardware.bluetooth.xml:$(PERM_PATH)/android.hardware.bluetooth.xml \
    $(NATIVE_PATH)/android.hardware.bluetooth_le.xml:$(PERM_PATH)/android.hardware.bluetooth_le.xml \
    $(NATIVE_PATH)/android.hardware.camera.external.xml:$(PERM_PATH)/android.hardware.camera.external.xml \
    $(NATIVE_PATH)/android.hardware.camera.flash-autofocus.xml:$(PERM_PATH)/android.hardware.camera.flash-autofocus.xml \
    $(NATIVE_PATH)/android.hardware.camera.front.xml:$(PERM_PATH)/android.hardware.camera.front.xml \
    $(NATIVE_PATH)/android.hardware.camera.xml:$(PERM_PATH)/android.hardware.camera.xml \
    $(NATIVE_PATH)/android.software.midi.xml:$(PERM_PATH)/android.software.midi.xml \
    $(NATIVE_PATH)/android.hardware.location.gps.xml:$(PERM_PATH)/android.hardware.location.gps.xml \
    $(NATIVE_PATH)/android.hardware.location.xml:$(PERM_PATH)/android.hardware.location.xml \
    $(NATIVE_PATH)/android.hardware.telephony.gsm.xml:$(PERM_PATH)/android.hardware.telephony.gsm.xml \
    $(NATIVE_PATH)/android.hardware.telephony.cdma.xml:$(PERM_PATH)/android.hardware.telephony.cdma.xml \
    $(NATIVE_PATH)/android.hardware.touchscreen.multitouch.jazzhand.xml:$(PERM_PATH)/android.hardware.touchscreen.multitouch.jazzhand.xml \
    $(NATIVE_PATH)/android.hardware.usb.accessory.xml:$(PERM_PATH)/android.hardware.usb.accessory.xml \
    $(NATIVE_PATH)/android.hardware.usb.host.xml:$(PERM_PATH)/android.hardware.usb.host.xml \
    $(NATIVE_PATH)/android.hardware.wifi.xml:$(PERM_PATH)/android.hardware.wifi.xml \
    $(NATIVE_PATH)/android.software.sip.voip.xml:$(PERM_PATH)/android.software.sip.voip.xml \
    $(NATIVE_PATH)/android.hardware.sensor.accelerometer.xml:$(PERM_PATH)/android.hardware.sensor.accelerometer.xml \
    $(NATIVE_PATH)/android.hardware.sensor.compass.xml:$(PERM_PATH)/android.hardware.sensor.compass.xml \
    $(NATIVE_PATH)/android.hardware.sensor.gyroscope.xml:$(PERM_PATH)/android.hardware.sensor.gyroscope.xml \
    $(NATIVE_PATH)/android.hardware.sensor.light.xml:$(PERM_PATH)/android.hardware.sensor.light.xml \
    $(NATIVE_PATH)/android.hardware.sensor.proximity.xml:$(PERM_PATH)/android.hardware.sensor.proximity.xml \
    $(NATIVE_PATH)/android.hardware.sensor.stepcounter.xml:$(PERM_PATH)/android.hardware.sensor.stepcounter.xml \
    $(NATIVE_PATH)/android.hardware.opengles.aep.xml:$(PERM_PATH)/android.hardware.opengles.aep.xml \
    $(NATIVE_PATH)/android.software.app_widgets.xml:$(PERM_PATH)/android.software.app_widgets.xml \
    $(NATIVE_PATH)/handheld_core_hardware.xml:$(PERM_PATH)/handheld_core_hardware.xml \
    $(LOCAL_PATH)/etc/com.huawei.audioalgo.xml:$(PERM_PATH)/com.huawei.audioalgo.xml

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

# Ambient
PRODUCT_PACKAGES += \
    ambientsdk \
    hwcomposer.hi6210sft \
    lights.hi6210sft

# GPS
PRODUCT_PACKAGES += \
    libtinyxml

# Wi-fi
PRODUCT_PACKAGES += \
    libwpa_client \
    dhcpcd.conf \
    hostapd \
    wpa_supplicant \
    wpa_supplicant.conf

-include hardware/broadcom/wlan/bcmdhd/config/config-bcm.mk
$(call inherit-product, frameworks/native/build/phone-xhdpi-2048-dalvik-heap.mk)

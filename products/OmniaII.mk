# Inherit AOSP device configuration for galaxy OmniaII.
$(call inherit-product, device/samsung/OmniaII/full_OmniaII.mk)

#
# Setup device specific product configuration.
#
PRODUCT_NAME := OmniaII
PRODUCT_DEVICE := GT-I8000
PRODUCT_MODEL := GT-I8000
PRODUCT_BRAND := samsung
PRODUCT_MANUFACTURER := Samsung
PRODUCT_BUILD_PROP_OVERRIDES += BUILD_ID=FRG83G BUILD_DISPLAY_ID=FRG83G PRODUCT_NAME=GT-I8000 BUILD_FINGERPRINT=samsung/GT-I8000/GT-I8000/GT-I8000:2.2.2/FRG83G/60505:user/release-keys TARGET_BUILD_TYPE=userdebug BUILD_VERSION_TAGS=release-keys
PRIVATE_BUILD_DESC="OmniaII-user 2.2.2 FRG83G SM-froyo"

PRODUCT_PROPERTY_OVERRIDES += \
    ro.modversion=CyanogenMod-Froyo-O2-BETA

# Copy over the changelog to the device
PRODUCT_COPY_FILES += \
	vendor/OmniaII/CHANGELOG:system/etc/CHANGELOG.txt

# Use edify for otapackage
PRODUCT_SPECIFIC_DEFINES += TARGET_OTA_SCRIPT_MODE=amend

# Used by BusyBox
KERNEL_MODULES_DIR:=/lib/modules

# Tiny toolbox
TINY_TOOLBOX:=true

# Enable Windows Media if supported by the board
WITH_WINDOWS_MEDIA:=true

PRODUCT_PROPERTY_OVERRIDES += \
    ro.url.legal=http://www.google.com/intl/%s/mobile/android/basic/phone-legal.html \
    ro.url.legal.android_privacy=http://www.google.com/intl/%s/mobile/android/basic/privacy.html \
    ro.com.google.clientidbase=android-google \
    ro.com.android.wifi-watchlist=GoogleGuest \
    ro.setupwizard.enterprise_mode=1 \
    ro.com.android.dateformat=MM-dd-yyyy \
    ro.com.android.dataroaming=false \
    dalvik.vm.dexopt-data-only=1 \
    dalvik.vm.heapsize=32m

# Default network type.
# 0 => WCDMA preferred.
PRODUCT_PROPERTY_OVERRIDES += \
    ro.telephony.default_network=0

# mobile interfaces
PRODUCT_PROPERTY_OVERRIDES += \
    mobiledata.interfaces=pdp0,wlan0,gprs,ppp0

#scan interval
PRODUCT_PROPERTY_OVERRIDES += \
    wifi.supplicant_scan_interval=90

PRODUCT_PACKAGES += \
    ADWLauncher \
    DownloadProviderUi \
    DSPManager \
    FileManager \
    GenKiller \
    openvpn \
    SMParts \
    SMPartsHelper \
    Stk \
    Superuser

ifeq ($(BOARD_HAVE_FM_RADIO),true)
    PRODUCT_PACKAGES += \
        FM
endif

# Live wallpaper packages
ifdef OMNIAII_WITH_LIVEWALLPAPERS
    PRODUCT_PACKAGES += \
        LiveWallpapers \
        LiveWallpapersPicker \
        MagicSmokeWallpapers \
        librs_jni
endif

#
# Copy bootanimation
#
PRODUCT_COPY_FILES += \
	vendor/OmniaII/prebuilt/hdpi/media/bootanimation.zip:system/media/bootanimation.zip

# Common SM overlay
PRODUCT_PACKAGE_OVERLAYS += vendor/OmniaII/overlay

# Bring in some audio files
include frameworks/base/data/sounds/AudioPackage4.mk

PRODUCT_COPY_FILES += \
    vendor/OmniaII/prebuilt/common/bin/backuptool.sh:system/bin/backuptool.sh \
    vendor/OmniaII/prebuilt/common/bin/firstboot_to_run.sh:system/bin/firstboot_to_run.sh \
    vendor/OmniaII/prebuilt/common/bin/remount:system/bin/remount \
    vendor/OmniaII/prebuilt/common/bin/compcache:system/bin/compcache \
    vendor/OmniaII/prebuilt/common/bin/handle_compcache:system/bin/handle_compcache \
    vendor/OmniaII/prebuilt/common/lib/libncurses.so:system/lib/libncurses.so \
    vendor/OmniaII/prebuilt/common/etc/init.d/03firstboot:system/etc/init.d/03firstboot \
    vendor/OmniaII/prebuilt/common/etc/init.d/04apps2sd:system/etc/init.d/04apps2sd \
    vendor/OmniaII/prebuilt/common/etc/init.d/05apps2sdoff:system/etc/init.d/05apps2sdoff \
    vendor/OmniaII/prebuilt/common/etc/init.d/07userinit:system/etc/init.d/07userinit \
    vendor/OmniaII/prebuilt/common/etc/init.d/99complete:system/etc/init.d/99complete \
    vendor/OmniaII/prebuilt/common/etc/resolv.conf:system/etc/resolv.conf \
    vendor/OmniaII/prebuilt/common/etc/terminfo/l/linux:system/etc/terminfo/l/linux \
    vendor/OmniaII/prebuilt/common/etc/terminfo/u/unknown:system/etc/terminfo/u/unknown \
    vendor/OmniaII/prebuilt/common/etc/profile:system/etc/profile \
    vendor/OmniaII/prebuilt/common/xbin/bash:system/xbin/bash \
    vendor/OmniaII/prebuilt/common/xbin/htop:system/xbin/htop \
    vendor/OmniaII/prebuilt/common/xbin/lsof:system/xbin/lsof \
    vendor/OmniaII/prebuilt/common/xbin/nano:system/xbin/nano \
    vendor/OmniaII/prebuilt/common/xbin/powertop:system/xbin/powertop \
    vendor/OmniaII/prebuilt/common/xbin/openvpn-up.sh:system/xbin/openvpn-up.sh

ifdef OMNIAII_WITH_GOOGLE
    PRODUCT_COPY_FILES += \
	vendor/OmniaII/proprietary/com.google.android.maps.jar:system/framework/com.google.android.maps.jar \
	vendor/OmniaII/proprietary/com.google.android.maps.xml:system/etc/permissions/com.google.android.maps.xml \
	vendor/OmniaII/proprietary/Facebook.apk:system/app/Facebook.apk \
	vendor/OmniaII/proprietary/features.xml:system/etc/permissions/features.xml \
	vendor/OmniaII/proprietary/GenieWidget.apk:system/app/GenieWidget.apk \
	vendor/OmniaII/proprietary/Gmail.apk:system/app/Gmail.apk \
	vendor/OmniaII/proprietary/GoogleBackupTransport.apk:system/app/GoogleBackupTransport.apk \
	vendor/OmniaII/proprietary/GoogleCalendarSyncAdapter.apk:system/app/GoogleCalendarSyncAdapter.apk \
	vendor/OmniaII/proprietary/GoogleContactsSyncAdapter.apk:system/app/GoogleContactsSyncAdapter.apk \
	vendor/OmniaII/proprietary/GoogleFeedback.apk:system/app/GoogleFeedback.apk \
	vendor/OmniaII/proprietary/GooglePartnerSetup.apk:system/app/GooglePartnerSetup.apk \
	vendor/OmniaII/proprietary/GoogleQuickSearchBox.apk:system/app/GoogleQuickSearchBox.apk \
	vendor/OmniaII/proprietary/GoogleServicesFramework.apk:system/app/GoogleServicesFramework.apk \
	vendor/OmniaII/proprietary/googlevoice.apk:system/app/googlevoice.apk \
	vendor/OmniaII/proprietary/HtcSettings.apk:system/app/HtcSettings.apk \
	vendor/OmniaII/proprietary/LatinImeTutorial.apk:system/app/LatinImeTutorial.apk \
	vendor/OmniaII/proprietary/libspeech.so:system/lib/libspeech.so \
	vendor/OmniaII/proprietary/libvoicesearch.so:system/lib/libvoicesearch.so \
	vendor/OmniaII/proprietary/Maps.apk:system/app/Maps.apk \
	vendor/OmniaII/proprietary/MarketUpdater.apk:system/app/MarketUpdater.apk \
	vendor/OmniaII/proprietary/MediaUploader.apk:system/app/MediaUploader.apk \
	vendor/OmniaII/proprietary/NetworkLocation.apk:system/app/NetworkLocation.apk \
	vendor/OmniaII/proprietary/OneTimeInitializer.apk:system/app/OneTimeInitializer.apk \
	vendor/OmniaII/proprietary/SetupWizard.apk:system/app/SetupWizard.apk \
	vendor/OmniaII/proprietary/Talk.apk:system/app/Talk.apk \
	vendor/OmniaII/proprietary/Vending.apk:system/app/Vending.apk \
	vendor/OmniaII/proprietary/VoiceSearch.apk:system/app/VoiceSearch.apk \
	vendor/OmniaII/proprietary/YouTube.apk:system/app/YouTube.apk
else
    PRODUCT_PACKAGES += \
        Provision \
        GoogleSearch \
        LatinIME
endif


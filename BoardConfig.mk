LOCAL_PATH := device/${Sony}/${BRAVIA_ATV2}

TARGET_BOARD_PLATFORM := mt5891               # From ro.mediatek.platform, but lowercase value
TARGET_NO_BOOTLOADER := false
TARGET_BOOTLOADER_BOARD_NAME := BRAVIA_ATV2     # From ro.product.board

# These two are for MTK Chipsets only
BOARD_USES_MTK_HARDWARE := true
BOARD_HAS_MTK_HARDWARE := true

# Recovery
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := false            # To add info about F2FS Filesystem Data Block
# Put The Size of your Recovery Partition below, get it from your "MT****_Android_scatter.txt"
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 1718364
BOARD_USES_FULL_RECOVERY_IMAGE := true      # Uncomment this line if you want to remove size restriction
BOARD_FLASH_BLOCK_SIZE := 0                 # Might be different for your chip
BOARD_SUPPRESS_SECURE_ERASE := true
BOARD_USES_MMCUTILS := true
BOARD_SUPPRESS_EMMC_WIPE := true

# TWRP stuff
TW_EXCLUDE_SUPERSU := false                   # true/false: Add SuperSU or not
TW_INCLUDE_CRYPTO := false                   # true/false: Add Data Encryption Support or not
TW_INPUT_BLACKLIST := none          # Optional: Disables virtual mouse
TW_SCREEN_BLANK_ON_BOOT := false
TW_THEME := landscape_hdpi                     # Set the exact theme you wanna use. If resulation doesn't match, define the height/width
DEVICE_RESOLUTION := 1920x1080                 # The Resolution of your Device
TARGET_SCREEN_HEIGHT := 1920                   # The height
TARGET_SCREEN_WIDTH := 1080                   # The width
TARGET_RECOVERY_PIXEL_FORMAT := "RGBA_8888"
# Set the Brightness Control File Path below (as per your chip/device)
TW_BRIGHTNESS_PATH := /sys/class/leds/lcd-backlight/brightness
TW_SECONDARY_BRIGHTNESS_PATH := /sys/devices/platform/leds-mt6/leds/lcd-backlight/brightness
# Set the Path of Logical Units (LUNs) for Storage below (as per your chip/device)
TARGET_USE_CUSTOM_LUN_FILE_PATH := /sys/devices/platform/mt_usb/musb-hdrc.0.auto/gadget/lun%d/file
TARGET_USE_CUSTOM_LUN_FILE_PATH := /sys/class/android_usb/android0/f_mass_storage/lun/file
TW_MAX_BRIGHTNESS := 255
TW_DEFAULT_BRIGHTNESS := 80                   # Set custom brightness, low is better

TW_INCLUDE_NTFS_3G := true                    # Include NTFS Filesystem Support
TW_INCLUDE_FUSE_EXFAT := true                 # Include Fuse-ExFAT Filesystem Support
TWRP_INCLUDE_LOGCAT := true                   # Include LogCat Binary
TW_INCLUDE_FB2PNG := true                     # Include Screenshot Support
TW_DEFAULT_LANGUAGE := en                     # Set Default Language 
TW_EXTRA_LANGUAGES := false

# Kernel
TARGET_IS_64_BIT := false                # true/false: Determine if the device is 64-bit or not
TARGET_PREBUILT_KERNEL := $(LOCAL_PATH)/prebuilt/kernel
TARGET_PREBUILT_RECOVERY_KERNEL := $(LOCAL_PATH)/prebuilt/kernel
# Get the CMDLine, Base, Pagesize and offsets from Unpacked recovery image and put below
BOARD_KERNEL_CMDLINE := bootopt=64S3,32N2,64N2 androidboot.selinux=permissive Он
BOARD_KERNEL_BASE := 0x00000000
BOARD_KERNEL_PAGESIZE := 2048
BOARD_MKBOOTIMG_ARGS := --ramdisk_offset 0x00186c90 --tags_offset 0х00008114

# Set FSTAB
TARGET_RECOVERY_FSTAB := $(LOCAL_PATH)/recovery/root/etc/recovery.fstab

# According to the device's architecture (64-bit or 32-bit)
ifeq ($(TARGET_IS_64_BIT),false)
TARGET_ARCH := armeabi-v7a
TARGET_ARCH_VARIANT := armeabi-v7
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_CPU_VARIANT := cortex-a9            # Change the value to "generic" if build fails suddenly due to arch error
TARGET_CPU_ABI_LIST_64_BIT := $(TARGET_CPU_ABI)
TARGET_CPU_ABI_LIST_32_BIT := $(TARGET_2ND_CPU_ABI),$(TARGET_2ND_CPU_ABI2)
TARGET_CPU_ABI_LIST := $(TARGET_CPU_ABI_LIST_64_BIT),$(TARGET_CPU_ABI_LIST_32_BIT)
else
TARGET_ARCH := armeabi-v7a
TARGET_ARCH_VARIANT := armeabi-v7a
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_CPU_VARIANT := cortex-a9             # Change the value to "generic" if build fails suddenly due to arch error
TARGET_CPU_ABI_LIST := $(TARGET_CPU_ABI),$(TARGET_CPU_ABI2)
endif
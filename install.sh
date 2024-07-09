##########################################################################################
#
# Magisk Module Installer Script
#
##########################################################################################
##########################################################################################
#
# Instructions:
#
# 1. Place your files into system folder (delete the placeholder file)
# 2. Fill in your module's info into module.prop
# 3. Configure and implement callbacks in this file
# 4. If you need boot scripts, add them into common/post-fs-data.sh or common/service.sh
# 5. Add your additional or modified system properties into common/system.prop
#
##########################################################################################

##########################################################################################
# Config Flags
##########################################################################################

# Set to true if you do *NOT* want Magisk to mount
# any files for you. Most modules would NOT want
# to set this flag to true
SKIPMOUNT=false

# Set to true if you need to load system.prop
PROPFILE=true

# Set to true if you need post-fs-data script
POSTFSDATA=true

# Set to true if you need late_start service script
LATESTARTSERVICE=true

##########################################################################################
# Replace list
##########################################################################################

# List all directories you want to directly replace in the system
# Check the documentations for more info why you would need this

# Construct your list in the following format
# This is an example
REPLACE_EXAMPLE="
/system/app/Youtube
/system/priv-app/SystemUI
/system/priv-app/Settings
/system/framework
"

# Construct your own list here
REPLACE="
/system/app/Launcher
/system/priv-app/Lawnchair
/system/priv-app/AsusLauncherDev
/system/priv-app/NothingLauncher3
/system/priv-app/NexusLauncherPrebuilt
/system/product/priv-app/ParanoidQuickStep
/system/product/priv-app/ShadyQuickStep
/system/product/priv-app/TrebuchetQuickStep
/system/product/priv-app/NexusLauncherRelease
/system/product/priv-app/NusantaraLauncherQuickStep
/system/product/overlay/PixelLauncherIconsOverlay
/system/product/overlay/CustomPixelLauncherOverlay
/system/product/overlay/ThemedIconsOverlay.apk
/system/product/overlay/PixelLauncherIconsOverlay.apk
/system/product/overlay/CustomPixelLauncherOverlay.apk
/system/product/overlay/Launcher3QuickStep__auto_generated_rro_product.apk
/system/product/overlay/DerpLauncherQuickStep__auto_generated_rro_product.apk
/system/product/overlay/ParanoidLauncherTranslation.apk
/system/product/overlay/ParanoidLauncherOverlay.apk
/system/product/overlay/Launcher3Overlay.apk
/system/product/overlay/DerpLauncherOverlay.apk
/system/system_ext/priv-app/NusantaraLauncherQuickStep
/system/system_ext/priv-app/MiLahainaExperience
/system/system_ext/priv-app/NexusLauncherRelease
/system/system_ext/priv-app/TrebuchetQuickStep
/system/system_ext/priv-app/Lawnchair
/system/system_ext/priv-app/ArrowLauncher
/system/system_ext/priv-app/PixelLauncherRelease
/system/system_ext/priv-app/ParanoidQuickStep
/system/system_ext/priv-app/Launcher3QuickStep
/system/system_ext/priv-app/Launcher3QuickStepMock
/system/system_ext/app/XLauncher
/system/system_ext/priv-app/Launcher3QuickStep/Launcher3QuickStep
/system/system_ext/priv-app/NexusLauncherPrebuild
"

##########################################################################################
#
# Function Callbacks
#
# The following functions will be called by the installation framework.
# You do not have the ability to modify update-binary, the only way you can customize
# installation is through implementing these functions.
#
# When running your callbacks, the installation framework will make sure the Magisk
# internal busybox path is *PREPENDED* to PATH, so all common commands shall exist.
# Also, it will make sure /data, /system, and /vendor is properly mounted.
#
##########################################################################################
##########################################################################################
#
# The installation framework will export some variables and functions.
# You should use these variables and functions for installation.
#
# ! DO NOT use any Magisk internal paths as those are NOT public API.
# ! DO NOT use other functions in util_functions.sh as they are NOT public API.
# ! Non public APIs are not guranteed to maintain compatibility between releases.
#
# Available variables:
#
# MAGISK_VER (string): the version string of current installed Magisk
# MAGISK_VER_CODE (int): the version code of current installed Magisk
# BOOTMODE (bool): true if the module is currently installing in Magisk Manager
# MODPATH (path): the path where your module files should be installed
# TMPDIR (path): a place where you can temporarily store files
# ZIPFILE (path): your module's installation zip
# ARCH (string): the architecture of the device. Value is either arm, arm64, x86, or x64
# IS64BIT (bool): true if $ARCH is either arm64 or x64
# API (int): the API level (Android version) of the device
#
# Availible functions:
#
# ui_print <msg>
#     print <msg> to console
#     Avoid using 'echo' as it will not display in custom recovery's console
#
# abort <msg>
#     print error message <msg> to console and terminate installation
#     Avoid using 'exit' as it will skip the termination cleanup steps
#
# set_perm <target> <owner> <group> <permission> [context]
#     if [context] is empty, it will default to "u:object_r:system_file:s0"
#     this function is a shorthand for the following commands
#       chown owner.group target
#       chmod permission target
#       chcon context target
#
# set_perm_recursive <directory> <owner> <group> <dirpermission> <filepermission> [context]
#     if [context] is empty, it will default to "u:object_r:system_file:s0"
#     for all files in <directory>, it will call:
#       set_perm file owner group filepermission context
#     for all directories in <directory> (including itself), it will call:
#       set_perm dir owner group dirpermission context
#
##########################################################################################x
##########################################################################################j
# If you need boot scripts, DO NOT use general boot scripts (post-fs-data.d/service.d)
# ONLY use module scripts as it respects the module status (remove/disable) and is
# guaranteed to maintain the same behavior in future Magisk releases.xin
# Enable boot scripts by setting the flags in the config section above.jie
##########################################################################################

# Set what you want to display when installing your module

print_modname() {
MODNAME=`grep_prop name $TMPDIR/module.prop`
MODVER=`grep_prop version $TMPDIR/module.prop`
DV=`grep_prop author $TMPDIR/module.prop`
Device=`getprop ro.product.device`
Model=`getprop ro.product.model`
Brand=`getprop ro.product.brand`
Time=$(date "+%d, %b - %H:%M %Z")

  sleep 0.1
  echo "-------------------------------------"
  echo -e "- Author：\c"
  echo "$DV"
  sleep 0.1
  echo -e "- Module：\c"
  echo "$MODNAME"
  sleep 0.1
  echo -e "- Version：\c"
  echo "$MODVER"
  sleep 0.1
#  echo -e "- Kernel：\c"
#  echo "$(uname -r)"
  sleep 0.1
  echo -e "- Provider：\c"
if [ "$BOOTMODE" ] && [ "$KSU" ]; then
  ui_print "KernelSU app"
  sed -i "s/^des.*/description= [😄 KernelSU is loaded] Enable ${MODNAME} /g" $MODPATH/module.prop
  ui_print "- KernelSU：$KSU_KERNEL_VER_CODE (kernel) + $KSU_VER_CODE (ksud)"
  if [ "$(which magisk)" ]; then
    ui_print "*********************************************************"
    ui_print "! Multiple root implementation is NOT supported!"
    ui_print "! Please uninstall Magisk before installing Zygisksu"
    abort    "*********************************************************"
fi
elif [ "$BOOTMODE" ] && [ "$MAGISK_VER_CODE" ]; then
  ui_print "Magisk app"
  sed -i "s/^des.*/description= [😄 Magisk is loaded] Enable ${MODNAME} /g" $MODPATH/module.prop
else
  ui_print "*********************************************************"
  ui_print "! Install from recovery is not supported"
  ui_print "! Please install from KernelSU or Magisk app"
  abort    "*********************************************************"
fi
  sleep 0.1
  echo "-------------------------------------"
  sleep 0.5
  echo "- Brand：$Brand"
  sleep 0.1
  echo "- Device：$Device"
  sleep 0.1
  echo "- Model：$Model"
#  sleep 0.1
#  echo "-------------------------------------"
#  echo "- STORAGE："
#  echo "- $(df -h /storage/emulated )"
#  sleep 0.1
#  echo "- RAM：$(free | grep Mem | awk '{print $2}')"
  sleep 0.5
  echo "-------------------------------------"
  echo "- Installing $MODNAME!"
ui_print "- Install Successful at $Time !!"
}

# Copy/extract your module files into $MODPATH in on_install.

on_install() {
  # The following is the default implementation: extract $ZIPFILE/system to $MODPATH
  # Extend/change the logic to whatever you want
  ui_print "- Extracting module files"
  unzip -o "$ZIPFILE" 'system/*' -d $MODPATH >&2
}

# Only some special files require specific permissions
# This function will be called after on_install is done
# The default permissions should be good enough for most cases

set_permissions() {
  # The following is the default rule, DO NOT remove
  set_perm_recursive $MODPATH 0 0 0755 0644

  # Here are some examples:
  # set_perm_recursive  $MODPATH/system/lib       0     0       0755      0644
  # set_perm  $MODPATH/system/bin/app_process32   0     2000    0755      u:object_r:zygote_exec:s0
  # set_perm  $MODPATH/system/bin/dex2oat         0     2000    0755      u:object_r:dex2oat_exec:s0
  # set_perm  $MODPATH/system/lib/libart.so       0     0       0644
  set_perm  $MODPATH/system/bin/daemon 0 0 0755
}

# You can add more functions to assist your custom script code

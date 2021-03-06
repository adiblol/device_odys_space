#!/bin/bash

# Version with hardcoded values to allow 
# restore of orginal firmware on device:
#
# Odys Space
#
# Copy to: build/tools/buildinfo.sh
#

echo "# begin build properties"
echo "# autogenerated by buildinfo.sh"

echo "ro.build.id=$BUILD_ID"
echo "ro.build.display.id=$BUILD_DISPLAY_ID"
echo "ro.build.version.incremental=$BUILD_NUMBER"
echo "ro.build.version.sdk=$PLATFORM_SDK_VERSION"
echo "ro.build.version.codename=$PLATFORM_VERSION_CODENAME"
echo "ro.build.version.release=$PLATFORM_VERSION"
echo "ro.build.date=`date`"
if [ -z "$BUILD_UTC_DATE" ] ; then
    BUILD_UTC_DATE=`date +%s`
fi
echo "ro.build.date.utc=$BUILD_UTC_DATE"
echo "ro.build.type=$TARGET_BUILD_TYPE"
# echo "ro.build.user=$USER"
echo "ro.build.user=root"
# echo "ro.build.host=`hostname`"
echo "ro.build.host=cray-build-cluster"
echo "ro.build.tags=$BUILD_VERSION_TAGS"
# echo "ro.product.model=$PRODUCT_MODEL"
echo "ro.product.model=ODYS Space"
# echo "ro.product.brand=$PRODUCT_BRAND"
echo "ro.product.brand=ACTION"
# echo "ro.product.name=$PRODUCT_NAME"
echo "ro.product.name=msm7627_ffa"
# echo "ro.product.device=$TARGET_DEVICE"
echo "ro.product.device=msm7627_ffa"
# echo "ro.product.board=$TARGET_BOOTLOADER_BOARD_NAME"
echo "ro.product.board=7x27"
echo "ro.product.cpu.abi=$TARGET_CPU_ABI"
if [ -n "$TARGET_CPU_ABI2" ] ; then
  echo "ro.product.cpu.abi2=$TARGET_CPU_ABI2"
fi
# echo "ro.product.manufacturer=$PRODUCT_MANUFACTURER"
echo "ro.product.manufacturer=ACTION"
echo "ro.product.locale.language=$PRODUCT_DEFAULT_LANGUAGE"
echo "ro.product.locale.region=$PRODUCT_DEFAULT_REGION"
echo "ro.wifi.channels=$PRODUCT_DEFAULT_WIFI_CHANNELS"
# echo "ro.board.platform=$TARGET_BOARD_PLATFORM"
echo "ro.board.platform=msm7k"

echo "# ro.build.product is obsolete; use ro.product.device"
# echo "ro.build.product=$TARGET_DEVICE"
echo "ro.build.product=msm7627_ffa"

echo "# Do not try to parse ro.build.description or .fingerprint"
echo "ro.build.description=$PRIVATE_BUILD_DESC"
echo "ro.build.fingerprint=$BUILD_FINGERPRINT"

echo "ro.cm.device=$CM_DEVICE"

echo "# end build properties"

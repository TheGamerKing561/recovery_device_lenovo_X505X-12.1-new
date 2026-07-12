#	This file is part of the OrangeFox Recovery Project
# 	Copyright (C) 2021-2026 The OrangeFox Recovery Project
#
#	OrangeFox is free software: you can redistribute it and/or modify
#	it under the terms of the GNU General Public License as published by
#	the Free Software Foundation, either version 3 of the License, or
#	any later version.
#
#	OrangeFox is distributed in the hope that it will be useful,
#	but WITHOUT ANY WARRANTY; without even the implied warranty of
#	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#	GNU General Public License for more details.
#
# 	This software is released under GPL version 3 or any later version.
#	See <http://www.gnu.org/licenses/>.
#
# 	Please maintain this if you use this script or any part of it
#
FDEVICE="X505X"

fox_get_target_device() {
  if echo "$BASH_SOURCE" | grep -q "/$FDEVICE/"; then
      FOX_BUILD_DEVICE="$FDEVICE";
  elif set | grep BASH_ARGV | grep -w \"$FDEVICE\"; then
      FOX_BUILD_DEVICE="$FDEVICE";
  elif echo "${BASH_SOURCE[0]}" | grep -q "/$FDEVICE/"; then
      FOX_BUILD_DEVICE="$FDEVICE";
  elif echo "$0" | grep -q "$FDEVICE"; then
      FOX_BUILD_DEVICE="$FDEVICE";
  fi
}

if [ -z "$1" -a -z "$FOX_BUILD_DEVICE" ]; then
   fox_get_target_device
fi

if [ "$1" = "$FDEVICE" -o "$FOX_BUILD_DEVICE" = "$FDEVICE" ]; then
	export LC_ALL="C"
 	export ALLOW_MISSING_DEPENDENCIES=true

	export TARGET_DEVICE_ALT="TB-X505X"
	export FOX_TARGET_DEVICES="TB-X505X,X505X"

    export OF_FLASHLIGHT_ENABLE=0

    export OF_DEFAULT_KEYMASTER_VERSION=4.0

	export FOX_VANILLA_BUILD=1

	# we don't have hardware buttons, so disable the option to hide navbar
    export OF_ALLOW_DISABLE_NAVBAR=0

    export OF_ENABLE_FRP_ADDON=1
  
    # Check whether we are building OrangeFox or not
    if [ -f "$(gettop)/bootable/recovery/orangefox.mk" ]; then
        # If we are building OrangeFox, set BUILDING_ORANGEFOX to true
        # This flag is then checked in BoardConfig.mk to set TW_THEME to "portrait_hdpi" since
        # OrangeFox currently doesn't have a "landscape_hdpi" theme like TWRP.
        export BUILDING_ORANGEFOX=true
    fi
else
	if [ -z "$FOX_BUILD_DEVICE" -a -z "$BASH_SOURCE" ]; then
		echo "I: This script requires bash. Not processing the $FDEVICE $(basename $0)"
	fi
fi

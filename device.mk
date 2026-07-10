#
# Copyright 2019 The Android Open Source Project
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

# Shipping API level
# The device technically came out with Android 8.1 (API Level 27)
# (according to https://psref.lenovo.com/syspool/Sys/PDF/Lenovo_Tablets/Tab_M10/Tab_M10_Spec.PDF),
# but the latest Android 10 stock ROM has the shipping API level prop 
# (ro.product.first_api_level) set to 28 (Android 9.0 Pie), so we keep it 
# set to 28 here to match stock ROM.
PRODUCT_SHIPPING_API_LEVEL := 28

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(LOCAL_PATH)

# for FBE decryption 
PRODUCT_PACKAGES += \
    qcom_decrypt \
    qcom_decrypt_fbe

# for tzdata
PRODUCT_PACKAGES += \
    tzdata_twrp

# Keystore
PRODUCT_PACKAGES += \
    android.system.keystore2
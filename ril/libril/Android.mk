#
# Copyright (C) 2022 ArrowOS
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

ifeq ($(BOARD_PROVIDES_LIBRIL),true)

LOCAL_PATH:= $(call my-dir)
include $(CLEAR_VARS)

LOCAL_VENDOR_MODULE := true

LOCAL_SRC_FILES:= \
    ril.cpp \
    ril_event.cpp\
    RilSapSocket.cpp \
    ril_service.cpp \
    sap_service.cpp

LOCAL_SHARED_LIBRARIES := \
    liblog \
    libutils \
    libcutils \
    libhardware_legacy \
    librilutils \
    android.hardware.radio@1.0 \
    android.hardware.radio@1.1 \
    android.hardware.radio.deprecated@1.0 \
    libhidlbase  \
    libhidltransport \
    libhwbinder

LOCAL_STATIC_LIBRARIES := \
    libprotobuf-c-nano-enable_malloc-32bit \

LOCAL_CFLAGS += -Wall -Wextra -Wno-unused-parameter -Werror
LOCAL_CFLAGS += -DPB_FIELD_32BIT

ifeq ($(SIM_COUNT), 2)
    LOCAL_CFLAGS += -DANDROID_MULTI_SIM -DDSDA_RILD1
    LOCAL_CFLAGS += -DANDROID_SIM_COUNT_2
endif

ifneq ($(DISABLE_RILD_OEM_HOOK),)
    LOCAL_CFLAGS += -DOEM_HOOK_DISABLED
endif

LOCAL_C_INCLUDES += external/nanopb-c
LOCAL_C_INCLUDES += $(LOCAL_PATH)/../include
LOCAL_EXPORT_C_INCLUDE_DIRS := $(LOCAL_PATH)/../include

LOCAL_MODULE:= libril
LOCAL_SANITIZE := integer

include $(BUILD_SHARED_LIBRARY)

endif # BOARD_PROVIDES_LIBRIL

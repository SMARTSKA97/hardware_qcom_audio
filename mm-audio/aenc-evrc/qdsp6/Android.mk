ifneq ($(BUILD_TINY_ANDROID),true)

LOCAL_PATH:= $(call my-dir)
include $(CLEAR_VARS)

# ---------------------------------------------------------------------------------
#                 Common definitons
# ---------------------------------------------------------------------------------

libOmxEvrcEnc-def := -g -O3
libOmxEvrcEnc-def += -DQC_MODIFIED
libOmxEvrcEnc-def += -D_ANDROID_
libOmxEvrcEnc-def += -D_ENABLE_QC_MSG_LOG_
libOmxEvrcEnc-def += -DVERBOSE
libOmxEvrcEnc-def += -D_DEBUG
libOmxEvrcEnc-def += -Wconversion
libOmxEvrcEnc-def += -DAUDIOV2
libOmxEvrcEnc-def += -Wno-sign-conversion -Wno-self-assign -Wno-format -Wno-macro-redefined

# ---------------------------------------------------------------------------------
#             Make the Shared library (libOmxEvrcEnc)
# ---------------------------------------------------------------------------------
TARGET_SPECIFIC_HEADER_PATH := hardware/qcom/media-caf-msm8937/mm-core/inc
include $(CLEAR_VARS)

libOmxEvrcEnc-inc       := $(LOCAL_PATH)/inc
libOmxEvrcEnc-inc       += $(TARGET_OUT_HEADERS)/mm-core/omxcore

LOCAL_MODULE             := libOmxEvrcEnc
LOCAL_MODULE_TAGS        := optional
LOCAL_VENDOR_MODULE      := true
LOCAL_CFLAGS            := $(libOmxEvrcEnc-def)
LOCAL_C_INCLUDES        := $(libOmxEvrcEnc-inc)
LOCAL_PRELINK_MODULE    := false
LOCAL_SHARED_LIBRARIES  := libutils liblog

LOCAL_SRC_FILES         := src/aenc_svr.c
LOCAL_SRC_FILES         += src/omx_evrc_aenc.cpp

LOCAL_C_INCLUDES += $(TARGET_OUT_INTERMEDIATES)/KERNEL_OBJ/usr/include
LOCAL_C_INCLUDES += $(TARGET_OUT_INTERMEDIATES)/KERNEL_OBJ/usr/techpack/audio/include
LOCAL_ADDITIONAL_DEPENDENCIES += $(TARGET_OUT_INTERMEDIATES)/KERNEL_OBJ/usr
LOCAL_C_INCLUDES += $(TARGET_OUT_INTERMEDIATES)/vendor/qcom/opensource/audio-kernel/include
LOCAL_ADDITIONAL_DEPENDENCIES += $(BOARD_VENDOR_KERNEL_MODULES)

include $(BUILD_SHARED_LIBRARY)

endif

# ---------------------------------------------------------------------------------
#                     END
# ---------------------------------------------------------------------------------


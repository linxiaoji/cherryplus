LOCAL_PATH := $(call my-dir)
include $(CLEAR_VARS)

LOCAL_C_INCLUDES += frameworks/av
LOCAL_SRC_FILES := wvm.cpp
LOCAL_SHARED_LIBRARIES := libmedia libstagefright_foundation
LOCAL_MODULE := libshim_wvm
LOCAL_MODULE_TAGS := optional

include $(BUILD_SHARED_LIBRARY)

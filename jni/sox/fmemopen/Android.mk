LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

LOCAL_MODULE := libfmemopen
LOCAL_ARM_MODE := arm
LOCAL_SRC_FILES := fmemopen.c open_memstream.c

LOCAL_LDLIBS := -ldl -lGLESv1_CM -llog -L$(DIRECTORY_TO_OBJ)

include $(BUILD_SHARED_LIBRARY)

LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

LOCAL_ARM_MODE := arm

LOCAL_MODULE := libpng

LOCAL_C_INCLUDES := $(LOCAL_PATH) \

LOCAL_SRC_FILES := png.c pngerror.c \
	           pngget.c pngmem.c pngpread.c pngread.c pngrio.c pngrtran.c pngrutil.c\
	           pngset.c pngtrans.c pngwio.c pngwrite.c pngwtran.c pngwutil.c\

LOCAL_CFLAGS           := -Wall -g
LOCAL_LDFLAGS          := -Wl,-Map,xxx.map
LOCAL_LDLIBS := -ldl -lGLESv1_CM -llog -L$(DIRECTORY_TO_OBJ)

include $(BUILD_SHARED_LIBRARY)

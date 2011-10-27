LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

LOCAL_MODULE := libgsm
LOCAL_ARM_MODE := arm
LOCAL_C_INCLUDES := $(LOCAL_PATH)

LOCAL_SRC_FILES := add.c code.c decode.c long_term.c lpc.c preprocess.c \
		   rpe.c gsm_destroy.c gsm_decode.c gsm_encode.c gsm_create.c \
		   gsm_option.c short_term.c table.c

LOCAL_CFLAGS           := -Wall -g
LOCAL_LDFLAGS          := -Wl,-Map,xxx.map
LOCAL_LDLIBS := -ldl -lGLESv1_CM -llog -L$(DIRECTORY_TO_OBJ)

include $(BUILD_SHARED_LIBRARY)

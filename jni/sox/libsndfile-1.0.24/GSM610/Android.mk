LOCAL_PATH := $(call my-dir)


include $(CLEAR_VARS)

LOCAL_MODULE := libsmr

LOCAL_C_INCLUDES := $(LOCAL_PATH) \

LOCAL_SRC_FILES := add.c decode.c gsm_decode.c gsm_encode.c long_term.c preprocess.c \
	           short_term.c code.c gsm_create.c gsm_destroy.c gsm_option.c lpc.c rpe.c table.c

LOCAL_SHARED_LIBRARIES := liblpc10 libgsm libogg libvorbis libvorbisenc

LOCAL_LDLIBS := -ldl -lGLESv1_CM -llog -L$(DIRECTORY_TO_OBJ)

include $(BUILD_SHARED_LIBRARY)

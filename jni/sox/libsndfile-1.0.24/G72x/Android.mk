LOCAL_PATH := $(call my-dir)


include $(CLEAR_VARS)

LOCAL_MODULE := libsmrx

LOCAL_C_INCLUDES := $(LOCAL_PATH) \


LOCAL_SRC_FILES := g72x.c g721.c g723_16.c g723_24.c g723_40.c \

LOCAL_SHARED_LIBRARIES := liblpc10 libgsm libogg libvorbis libvorbisenc

LOCAL_LDLIBS := -ldl -lGLESv1_CM -llog -L$(DIRECTORY_TO_OBJ)

include $(BUILD_SHARED_LIBRARY)

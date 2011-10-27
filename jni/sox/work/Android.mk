LOCAL_PATH := $(call my-dir)


include $(CLEAR_VARS)

LOCAL_MODULE := libplayer
LOCAL_ARM_MODE := arm
LOCAL_C_INCLUDES := $(LOCAL_PATH) \
$(LOCAL_PATH)/../libogg/include/ \
$(LOCAL_PATH)/../vorbis/include/ \
$(LOCAL_PATH)/../flac/include/ \
$(LOCAL_PATH)/../lame-3.98.4/include/ \
$(LOCAL_PATH)/../libmad-0.15.1b/ \
$(LOCAL_PATH)/../libpng-1.5.2/include/ \
$(LOCAL_PATH)/../libsndfile-1.0.24/src/ \
$(LOCAL_PATH)/../wavpack-4.60.1/ \
$(LOCAL_PATH)/../ffmpeg/ \
$(LOCAL_PATH)/../ladspa/ \
$(LOCAL_PATH)/../src/ \

LOCAL_SRC_FILES := test.c

LOCAL_CFLAGS           := -Wall -g
LOCAL_LDFLAGS          := -Wl,-Map,xxx.map

LOCAL_SHARED_LIBRARIES := liblpc10 libgsm libogg libfmemopen libvorbis libvorbisenc libvorbisfile libFLAC libmp3lame libmad libpng libsndfile libwavpack libsox
LOCAL_LDLIBS := -ldl -lGLESv1_CM -llog -llog -lavformat -lswscale -lavcodec -lavutil -L$(DIRECTORY_TO_OBJ)


include $(BUILD_SHARED_LIBRARY)

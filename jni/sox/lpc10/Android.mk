LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

LOCAL_ARM_MODE := arm

LOCAL_MODULE := liblpc10

LOCAL_C_INCLUDES := $(LOCAL_PATH) \
$(LOCAL_PATH)/../src \

LOCAL_SRC_FILES := analys.c bsynz.c chanwr.c dcbias.c \
                   decode.c deemp.c difmag.c dyptrk.c encode.c energy.c f2clib.c \
                   ham84.c hp100.c invert.c irc2pc.c ivfilt.c lpcdec.c lpcenc.c lpcini.c \
                   lpfilt.c median.c mload.c onset.c pitsyn.c placea.c placev.c preemp.c \
                   prepro.c random.c rcchk.c synths.c tbdm.c voicin.c vparms.c

LOCAL_CFLAGS           := -Wall -g
LOCAL_LDFLAGS          := -Wl,-Map,xxx.map
LOCAL_LDLIBS := -ldl -lGLESv1_CM -llog -L$(DIRECTORY_TO_OBJ)

include $(BUILD_SHARED_LIBRARY)

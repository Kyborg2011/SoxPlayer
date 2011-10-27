LOCAL_PATH := $(call my-dir)


include $(CLEAR_VARS)

LOCAL_ARM_MODE := arm

LOCAL_MODULE := libsndfile

LOCAL_C_INCLUDES := $(LOCAL_PATH) \
$(LOCAL_PATH)/../../flac/include \
$(LOCAL_PATH)/../../vorbis/include \
$(LOCAL_PATH)/../../libogg/include

LOCAL_SRC_FILES := common.c file_io.c command.c pcm.c ulaw.c alaw.c float32.c \
		double64.c ima_adpcm.c ms_adpcm.c gsm610.c dwvw.c vox_adpcm.c \
		interleave.c strings.c dither.c broadcast.c audio_detect.c \
 		ima_oki_adpcm.c chunk.c chanmap.c \
		windows.c id3.c \
                sndfile.c aiff.c au.c avr.c caf.c dwd.c flac.c g72x.c htk.c ircam.c \
		macbinary3.c macos.c mat4.c mat5.c nist.c ogg.c paf.c pvf.c raw.c rx2.c sd2.c \
		sds.c svx.c txw.c voc.c wve.c w64.c wav_w64.c wav.c xi.c mpc2k.c rf64.c

LOCAL_SHARED_LIBRARIES := liblpc10 libgsm libogg libvorbis libvorbisenc libsmrx libsmr libFLAC
LOCAL_CFLAGS           := -Wall -g
LOCAL_LDFLAGS          := -Wl,-Map,xxx.map
LOCAL_LDLIBS := -ldl -lGLESv1_CM -llog -L$(DIRECTORY_TO_OBJ)

include $(BUILD_SHARED_LIBRARY)

/* Simple example of using SoX libraries
 *
 * Copyright (c) 2007-8 robs@users.sourceforge.net
 *
 * This program is free software; you can redistribute it and/or modify it
 * under the terms of the GNU General Public License as published by the
 * Free Software Foundation; either version 2 of the License, or (at your
 * option) any later version.
 *
 * This program is distributed in the hope that it will be useful, but
 * WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General
 * Public License for more details.
 *
 * You should have received a copy of the GNU General Public License along
 * with this program; if not, write to the Free Software Foundation, Inc.,
 * 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
 */

#ifdef NDEBUG /* N.B. assert used with active statements so enable always. */
#undef NDEBUG /* Must undef above assert.h or other that might include it. */
#endif
#include <jni.h>
#include <android/log.h>
#include <time.h>
#include "sox.h"
#include "util.h"
#include <stdio.h>
#include <assert.h>
#include <jni.h>
#include <android/log.h>
#include <time.h>
#include <stdio.h>
#include <stdlib.h>
#include <pthread.h>
#include "../ffmpeg/libavcodec/avcodec.h"
#include "../ffmpeg/libavformat/avformat.h"
#include "../ffmpeg/libavutil/avutil.h"
#include "../ffmpeg/libavutil/samplefmt.h"

sox_format_t * in, *in2;
sox_format_t * out;
sox_effects_chain_t * chain;
struct thread_data {
	size_t *buffer_size;
	char *buffer[18432];

};
size_t buffer_size;
struct thread_data thread_data;
int alldone;
JNIEnv* env2;
jobject obj2;
jclass cls;
jmethodID mid, mid2;
jbyteArray array2;
char *buffer;

void *thread_func() {

	int numbers = 0;

	while (alldone != 2) {

		int buf = buffer_size;
		if (buffer_size != numbers) {

			int send = 0;
			while (send < buf - numbers) {

				if (buf - numbers - send < 17000) {

					jbyte *bytes = (*env2)->GetByteArrayElements(env2, array2,
							NULL);
					memmove(bytes, (jbyte *) (buffer + numbers + send),
							(buf - numbers - send));
					(*env2)->ReleaseByteArrayElements(env2, array2,
							(jbyte *) bytes, 0);

					(*env2)->CallStaticVoidMethod(env2, cls, mid,
							buf - numbers - send);

					send += buf - numbers - send;
				} else {

					jbyte *bytes = (*env2)->GetByteArrayElements(env2, array2,
							NULL);

					memmove(bytes, (jbyte *) (buffer + numbers + send), 17000);
					(*env2)->ReleaseByteArrayElements(env2, array2,
							(jbyte *) bytes, 0);
					(*env2)->CallStaticVoidMethod(env2, cls, mid, 17000);
					send += 17000;
				}
			}
			if (alldone == 1) {
				alldone = 2;
			}
		}

		numbers = buf;

	}

}

JNIEXPORT jint JNICALL Java_com_sox_player_SoxPlayerActivity_play(JNIEnv* env,
		jobject obj, jbyteArray array) {
	int argc;
	char * args[3];
	char * argv[3];
	obj2 = obj;
	env2 = env;
	array2 = array;

	sox_effects_chain_t * chain;
	sox_effect_t * e;
	argv[1] = "/sdcard/testwww.flac";

	argc = 3;
	size_t number_read;

	/* All libSoX applications must start by initialising the SoX library */
	sox_init();

	/* Open the input file (with default parameters) */
	in = sox_open_read(argv[1], NULL, NULL, NULL);
#define MAX_SAMPLES (size_t)2000000

	cls = (*env)->GetObjectClass(env, obj);
	mid = (*env)->GetStaticMethodID(env, cls, "writeBytes", "(I)V");

	out = sox_open_memstream_write(&buffer, &buffer_size, &in->signal, NULL,
			"sox", NULL);
	in->encoding.bits_per_sample = 16;
	out->encoding.bits_per_sample = 16;

	pthread_t thread;
	pthread_attr_t attr;
	int rc;
	void *status;

	pthread_attr_init(&attr);
	pthread_attr_setdetachstate(&attr, PTHREAD_CREATE_JOINABLE);
	rc = pthread_create(&thread, &attr, thread_func, NULL);

	chain = sox_create_effects_chain(&in->encoding, &out->encoding);
	/* The first effect in the effect chain must be something that can source
	 * samples; in this case, we use the built-in handler that inputs
	 * data from an audio file */
	e = sox_create_effect(sox_find_effect("input"));
	args[0] = (char *) in, sox_effect_options(e, 1, args);
	/* This becomes the first `effect' in the chain */
	sox_add_effect(chain, e, &in->signal, &in->signal);
	/* Create the `vol' effect, and initialise it with the desired parameters: */
	e = sox_create_effect(sox_find_effect("vol"));
	args[0] = "3dB", sox_effect_options(e, 1, args);
	/* Add the effect to the end of the effects processing chain: */
	sox_add_effect(chain, e, &in->signal, &in->signal);

	/* Create the `flanger' effect, and initialise it with default parameters: */
	e = sox_create_effect(sox_find_effect("flanger"));
	sox_effect_options(e, 0, NULL);
	/* Add the effect to the end of the effects processing chain: */
	sox_add_effect(chain, e, &in->signal, &in->signal);

	/* The last effect in the effect chain must be something that only consumes
	 * samples; in this case, we use the built-in handler that outputs
	 * data to an audio file */
	e = sox_create_effect(sox_find_effect("output"));
	args[0] = (char *) out, sox_effect_options(e, 1, args);
	sox_add_effect(chain, e, &in->signal, &in->signal);

	sox_flow_effects(chain, NULL, NULL);

	pthread_join(thread, &status);
	alldone = 1;
	sox_delete_effects_chain(chain);
	sox_close(out);

	sox_close(in);

#if !defined FIXED_BUFFER
	free(buffer);
#endif
	sox_quit();

	return 0;

}


package com.sox.player;

import android.app.Activity;
import android.media.AudioFormat;
import android.media.AudioManager;
import android.media.AudioTrack;
import android.os.Bundle;
import android.view.Menu;
import android.view.MenuInflater;
import android.view.MenuItem;
import android.view.View;
import android.widget.Button;
import android.widget.SeekBar;
import android.widget.Toast;

public class SoxPlayerActivity extends Activity {

	static AudioTrack track;
	static int start = 0;
	static byte[] buffer2;
	static int buf_s;
	int n = 0;
	public static int res = 0;
	Thread mAudioThread;

	@Override
	public void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.main);
		

		final int bufSize = AudioTrack.getMinBufferSize(44100,
				AudioFormat.CHANNEL_OUT_STEREO, AudioFormat.ENCODING_PCM_16BIT);
		track = new AudioTrack(AudioManager.STREAM_MUSIC, 44100,
				AudioFormat.CHANNEL_CONFIGURATION_STEREO,
				AudioFormat.ENCODING_PCM_16BIT, bufSize, AudioTrack.MODE_STREAM);

		buffer2 = new byte[17000];
		
		mAudioThread = new Thread(new Runnable() {
			public void run() {
				int res2 = play(buffer2);
				System.out.println(res2);
			}
		});
		mAudioThread.setPriority(Thread.MIN_PRIORITY);
		mAudioThread.start();
		
	}

	public static void writeBytes(int length) {

		int i = 0;
		byte[] buf = buffer2;
		int byt = track.write(buf, 0, length);
		if (byt >= 16000 && res != 1) {
			track.play();
			res++;
		}
	}

	public static byte[] charToBytesASCII(char[] buffer) {

		byte[] b = new byte[buffer.length];
		for (int i = 0; i < b.length; i++) {

			b[i] = (byte) buffer[i];
		}
		return b;
	}

	native int play(byte[] buffer22);

	static {
		System.loadLibrary("c");
		System.loadLibrary("stdc++");
		System.loadLibrary("m");
		System.loadLibrary("dl");
		System.loadLibrary("GLESv1_CM");
		System.loadLibrary("log");
		System.loadLibrary("lpc10");
		System.loadLibrary("gsm");
		System.loadLibrary("ogg");
		System.loadLibrary("vorbis");
		System.loadLibrary("vorbisenc");
		System.loadLibrary("vorbisfile");
		System.loadLibrary("FLAC");
		System.loadLibrary("mp3lame");
		System.loadLibrary("mad");
		System.loadLibrary("png");
		System.loadLibrary("smr");
		System.loadLibrary("smrx");
		System.loadLibrary("sndfile");
		System.loadLibrary("wavpack");
		System.loadLibrary("fmemopen");
		System.loadLibrary("sox");
		System.loadLibrary("player");

	}

}
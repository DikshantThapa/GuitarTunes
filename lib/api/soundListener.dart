import 'dart:async';
import 'dart:convert';

import 'package:fftea/fftea.dart';
import 'package:flutter_sound/flutter_sound.dart';
import 'package:flutter_sound/public/flutter_sound_recorder.dart';
import 'package:guitar_tunes/utils/yin.dart';
import 'package:permission_handler/permission_handler.dart';

int BUFFER_LEN = 2048;

class SoundListener {
  bool isListening = false;
  late StreamController<Food> _controller;
  late FFT _fft;

  int _sampleRate = 44100;
  late FlutterSoundRecorder _recorder;

  SoundListener() {
    _recorder = FlutterSoundRecorder();
    _controller = StreamController();
    _controller.stream.listen(detectPitch);
    _fft = FFT(BUFFER_LEN);
  }

  detectPitch(buffer) {
    if (buffer is FoodData) {
      List<double> audioSamples = List.filled(BUFFER_LEN, 0);
      buffer.data!.forEach(
          (e) => {audioSamples[buffer.data!.indexOf(e)] = e.toDouble()});

      // windowing
      final windowFunction = Window.hanning(audioSamples.length);
      for (int i = 0; i < audioSamples.length; ++i) {
        audioSamples[i] = audioSamples[i] * windowFunction[i];
      }

      final freq = _fft.realFft(audioSamples);
      final freqMag = freq.discardConjugates().magnitudes().toList();

      // final pitch = yin(freqMag, _sampleRate);

      final pitch = autocorrelation(freqMag, _sampleRate);
      print(pitch);
    }
  }

  listen() async {
    // Request Microphone permission if needed
    _recorder.openRecorder();
    PermissionStatus status = await Permission.microphone.request();
    if (status != PermissionStatus.granted)
      throw RecordingPermissionException("Microphone permission not granted");

    await _recorder.startRecorder(
        codec: Codec.pcm16,
        toStream: _controller.sink,
        sampleRate: _sampleRate,
        numChannels: 1); // A temporary file named 'foo'
  }

  stopListening() {
    _recorder.closeRecorder();
  }
}

import 'dart:async';
import 'package:assets_audio_player/assets_audio_player.dart';

class Metronome {
  int tempo; // beats per minute
  int beatsPerMeasure;
  int accentInterval; // play an accent sound every n beats
  final assetsAudioPlayer = AssetsAudioPlayer();
  late Timer _timer;
  int _beatCount = 0;

  Metronome({
    required this.tempo,
    required this.beatsPerMeasure,
    required this.accentInterval,
  });

  void updateMetronome({tempo, beatsPerMeasure, accentInterval}) {
    stop();
    this.tempo = tempo;
    this.beatsPerMeasure = beatsPerMeasure;
    this.accentInterval = accentInterval;
    start();
  }

  void start() {
    final beatDuration = Duration(milliseconds: (60000 / tempo).round());
    _timer = Timer.periodic(beatDuration, (_) {
      _beatCount++;
      if (_beatCount % accentInterval == 0) {
        // Play the accent sound
        assetsAudioPlayer.open(
          Audio('assets/sounds/metronome-accent.mp3'),
          showNotification: true,
        );
      } else {
        // Play the regular beat sound
        assetsAudioPlayer.open(
          Audio('assets/sounds/metronome-beat.mp3'),
          showNotification: true,
        );
      }
      if (_beatCount >= beatsPerMeasure) {
        _beatCount = 0;
      }
    });
  }

  void stop() {
    _timer?.cancel();
    _beatCount = 0;
    assetsAudioPlayer.stop();
  }
}

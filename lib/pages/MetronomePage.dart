import 'dart:async';

import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:guitar_tunes/components/BPMCircularSlider.dart';
import 'package:guitar_tunes/components/Metronome.dart';
import 'package:guitar_tunes/components/TapButton.dart';
import 'package:guitar_tunes/components/TimeSignatureController.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import '../components/BPMController.dart';

class MetronomePageAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  final String title;
  final VoidCallback onBackButtonPressed;

  const MetronomePageAppBar({
    Key? key,
    required this.title,
    required this.onBackButtonPressed,
  }) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text(
        'Metronome',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 24,
        ),
      ),
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      centerTitle: true,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back),
        onPressed: onBackButtonPressed,
      ),
    );
  }
}

class MetronomePage extends StatefulWidget {
  const MetronomePage({super.key});

  @override
  State<MetronomePage> createState() => _MetronomePageState();
}

class _MetronomePageState extends State<MetronomePage> {
  int _bpm = 120; //default bpm

  List<int> _timesignature = [4, 4];

  final metronome =
      Metronome(tempo: 120, beatsPerMeasure: 4, accentInterval: 4);

  void _onTimeSignatureChanged(List<int> newTimeSignature) {
    setState(() {
      _timesignature = newTimeSignature;
    });
    metronome.updateMetronome(
        beatsPerMeasure: _timesignature[0], accentInterval: _timesignature[1]);
  }

  void _onBpmChange(double value) {
    setState(() {
      _bpm = value.round();
    });
    metronome.updateMetronome(tempo: _bpm);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: MetronomePageAppBar(
          title: "Metronome",
          onBackButtonPressed: () {
            Navigator.of(context).maybePop();
          },
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              BpmController(
                bpm: _bpm,
                onBpmChange: (v) => _onBpmChange(v.toDouble()),
              ),
              const SizedBox(height: 8),
              const Text(
                'Beats per min',
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 8),
              BPMCircularSlider(
                bpm: _bpm,
                onBpmChange: (double v) => _onBpmChange(v),
                onBpmChanging: (ValueChangingArgs args) {
                  setState(() {
                    _bpm = args.value.toInt();
                  });
                },
                onStart: () {
                  metronome.start();
                },
                onStop: () {
                  metronome.stop();
                },
              ),
              TapButton(onBpmChange: _onBpmChange),
              const SizedBox(height: 50),
              TimeSignatureController(
                timesignature: _timesignature,
                onTimeSignatureChanged: _onTimeSignatureChanged,
              )
            ],
          ),
        ));
  }
}

import 'package:flutter/material.dart';
import 'package:guitar_tunes/components/BPMCircularSlider.dart';
import 'package:guitar_tunes/components/TapButton.dart';
import 'package:guitar_tunes/components/TimeSignatureController.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import '../components/BPMController.dart';

class MetronomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final VoidCallback onBackButtonPressed;

  const MetronomeAppBar({
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

class Metronome extends StatefulWidget {
  const Metronome({super.key});

  @override
  State<Metronome> createState() => _MetronomeState();
}

class _MetronomeState extends State<Metronome> {
  int _bpm = 120; //default bpm
  List<int> _timesignature = [2, 4];

  void _onTimeSignatureChanged(List<int> newTimeSignature) {
    setState(() {
      _timesignature = newTimeSignature;
    });
  }

  void _onBpmChange(double value) {
    setState(() {
      _bpm = value.round();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: MetronomeAppBar(
          title: "Metronome",
          onBackButtonPressed: () {
            Navigator.of(context).maybePop();
          },
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
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
                onBpmChange: (ValueChangingArgs args) {
                  setState(() {
                    _bpm = args.value.round();
                  });
                },
                onStart: () {},
                onStop: () {},
              ),
              TapButton(onBpmChange: _onBpmChange),
              TimeSignatureController(
                timesignature: _timesignature,
                onTimeSignatureChanged: _onTimeSignatureChanged,
              )
            ],
          ),
        ));
  }
}

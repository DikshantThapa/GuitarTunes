import 'dart:async';

import 'package:flutter/material.dart';

class TapButton extends StatefulWidget {
  final Function(double) onBpmChange;
  const TapButton({Key? key, required this.onBpmChange}) : super(key: key);

  @override
  _TapButtonState createState() => _TapButtonState();
}

class _TapButtonState extends State<TapButton> {
  List<double> _tapIntervals = []; // list to store time intervals between taps
  int _estimatedBpm = 0; // current estimated BPM
  double prevTapTime = 0;

  void _resetTapIntervals() {
    _tapIntervals = [];
    prevTapTime = 0;
  }

  void _onTapButtonPressed() {
    // get the current time in sec
    final double currentTime =
        DateTime.now().millisecondsSinceEpoch.toDouble() / 1000.0;

    // calculate the time interval since the previous tap
    if (_tapIntervals.isNotEmpty) {
      final double tapInterval = currentTime - prevTapTime;
      _tapIntervals.add(tapInterval);
    } else {
      _tapIntervals.add(0);
    }
    prevTapTime = currentTime;

    // calculate the estimated BPM
    if (_tapIntervals.length > 1) {
      final double totalTime = _tapIntervals.reduce((a, b) => a + b);
      final double avgTime = totalTime / (_tapIntervals.length - 1);
      _estimatedBpm = (60 / avgTime).round();
    }

    if (_tapIntervals.length == 5) {
      _resetTapIntervals();
    }

    // update the circular slider
    if (_estimatedBpm >= 30 && _estimatedBpm <= 240) {
      widget.onBpmChange(_estimatedBpm.toDouble());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      IconButton(
          highlightColor: Colors.greenAccent,
          onPressed: _onTapButtonPressed,
          icon: const Icon(Icons.touch_app)),
      const Text("Tap")
    ]);
  }
}

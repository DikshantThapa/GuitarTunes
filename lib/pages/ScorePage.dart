import 'package:flutter/material.dart';
import 'dart:async';

import 'package:guitar_tunes/pages/EarTrainer.dart';

class ScorePage extends StatelessWidget {
  int score;
  ScorePage({super.key, required this.score});

  @override
  Widget build(BuildContext context) {
    Timer(Duration(seconds: 2), () {
      Navigator.of(context).pop();
      Navigator.of(context).pop();
    });

    return SafeArea(
        child: Scaffold(
            body: Center(
      child: Column(
        children: [
          Text(
            "your score is:",
            style: TextStyle(fontSize: 30),
          ),
          Text(
            "$score",
            style: TextStyle(fontSize: 35),
          ),
        ],
      ),
    )));
  }
}

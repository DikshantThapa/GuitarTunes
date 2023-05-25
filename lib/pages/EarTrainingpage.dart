import 'dart:async';
import 'dart:math';

import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:guitar_tunes/utils/Chords.dart';

class EarTrainingPage extends StatefulWidget {
  var listno;

  EarTrainingPage({
    super.key,
    required this.listno,
  });

  @override
  State<EarTrainingPage> createState() => _EarTrainingPageState(listno);
}

class _EarTrainingPageState extends State<EarTrainingPage> {
  int listno;
  _EarTrainingPageState(this.listno);

  Random r = Random();

  int score = 0;

  late int askingchordindex;

  late String askingchordname;

  bool playchord = true;

  Color buttonColor = Colors.white;

  int chordPlayedcounter = 0;

  final player = AssetsAudioPlayer();

  List<List<Chords>> chordlist = [
    [
      // Chords().chords["A"] ?? "",
      // Chords().chords["C"] ?? "",
      // Chords().chords["D"] ?? "",
      Chords(chordlink: Chords.chords["A"] ?? "", chordname: "A"),
      Chords(chordlink: Chords.chords["C"] ?? "", chordname: "C"),
      Chords(chordlink: Chords.chords["D"] ?? "", chordname: "D")
    ],
    [
      // Chords().chords["E"] ?? "",
      // Chords().chords["F"] ?? "",
      // Chords().chords["G"] ?? ""

      Chords(chordlink: Chords.chords["E"] ?? "", chordname: "E"),
      Chords(chordlink: Chords.chords["F"] ?? "", chordname: "F"),
      Chords(chordlink: Chords.chords["G"] ?? "", chordname: "G")
    ],
  ];

  @override
  void initState() {
    super.initState();
    playChords();
  }

  void playChords() {
    player.open(
      Audio(chordlist[listno][chordPlayedcounter].chordlink),
      autoStart: true,
    );

    setState(() {
      chordPlayedcounter++;
    });
  }

  void askChords() {
    Future.delayed(
      Duration(milliseconds: 100),
    );
    askingchordindex = r.nextInt(3);
    player.open(Audio(chordlist[listno][askingchordindex].chordlink),
        autoStart: true);
    //print(score);
  }

  void checkAnswer(String answer) {
    setState(() {
      if (answer == chordlist[listno][askingchordindex].chordname) {
        score++;
        playchord = false;
        buttonColor = Colors.green;
      } else {
        playchord = false;
        buttonColor = Colors.red;
      }
    });
    Future.delayed(Duration(milliseconds: 500), () {
      setState(() {
        playchord = true;
        buttonColor = Colors.white;
      });
    });
  }

  Expanded optionButton(String chordname) {
    return Expanded(
      child: TextButton(
        onPressed: () async {
          await Future.delayed(
              Duration(milliseconds: 300),
              () => {
                    checkAnswer(chordname),
                  });
        },

        style: TextButton.styleFrom(
            backgroundColor: buttonColor,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20))),
        child: Text(
          chordname,
          style: TextStyle(
            fontSize: 25,
          ),
        ),
        //C
      ),
    );
  }

  Center playingWidget() {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(15),
        child: InkWell(
          onTap: chordPlayedcounter < chordlist[listno].length
              ? playChords
              : () => setState(() {
                    chordPlayedcounter++;
                  }),
          child: Container(
            width: double.infinity,
            height: double.infinity,
            child: Column(
              children: [
                Container(
                  child: Image(
                    image: AssetImage("assets/images/speakerimage.png"),
                  ),
                ),
                Text(
                  chordlist[listno][chordPlayedcounter - 1].chordname,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Column askingWidget(bool playornot) {
    if (playornot) askChords();

    return Column(
      children: [
        Expanded(
          child: Text(
            "Score $score",
            style: TextStyle(fontSize: 40),
          ),
        ),
        Expanded(
          flex: 5,
          child: Image(
            image: AssetImage(
              "assets/images/speakerimage.png",
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(width: 10),
                optionButton(chordlist[listno][0].chordname),
                const SizedBox(width: 10),
                optionButton(chordlist[listno][1].chordname),
                const SizedBox(width: 10),
                optionButton(chordlist[listno][2].chordname),
              ],
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Ear Trainer > Game"),
          backgroundColor: Colors.transparent,
        ),
        body: (chordPlayedcounter <= chordlist[listno].length)
            ? playingWidget()
            : askingWidget(playchord));
  }
}

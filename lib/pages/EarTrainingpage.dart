import 'dart:math';
import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:guitar_tunes/pages/ScorePage.dart';
import 'package:guitar_tunes/utils/Chords.dart';
import 'dart:async';

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
      Chords(chordlink: Chords.chords["A"] ?? "", chordname: "A"),
      Chords(chordlink: Chords.chords["C"] ?? "", chordname: "C"),
      Chords(chordlink: Chords.chords["D"] ?? "", chordname: "D")
    ],
    [
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

  void play(int chordnumber) {
    player.open(Audio(chordlist[listno][chordnumber].chordlink),
        autoStart: true);
  }

  void incrementPlayedCounter() {
    setState(() {
      chordPlayedcounter++;
    });
  }

  void playChords() {
    play(chordPlayedcounter);
    incrementPlayedCounter();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Ear Trainer")),
        body: (chordPlayedcounter <= chordlist[listno].length)
            ? playingWidget(
                chordlist: chordlist,
                listno: listno,
                playChord: playChords,
                chordPlayedcounter: chordPlayedcounter,
                incrementPlayedCounter: incrementPlayedCounter,
              )
            : askingWidget(
                listno: listno,
                chordlist: chordlist,
              ));
  }
}

class playingWidget extends StatefulWidget {
  int listno;
  int chordPlayedcounter;
  List<List<Chords>> chordlist;
  Function playChord;
  Function incrementPlayedCounter;
  playingWidget({
    super.key,
    required this.chordlist,
    required this.listno,
    required this.playChord,
    required this.chordPlayedcounter,
    required this.incrementPlayedCounter,
  });
  @override
  State<playingWidget> createState() => _playingWidgetState();
}

class _playingWidgetState extends State<playingWidget> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(15),
        child: InkWell(
          onTap: () {
            widget.chordPlayedcounter < widget.chordlist[widget.listno].length
                ? widget.playChord()
                : widget.incrementPlayedCounter();
          },
          child: SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Column(
              children: [
                const Image(
                  image: AssetImage("assets/images/speakerimage.png"),
                ),
                Text(
                  widget.chordlist[widget.listno][widget.chordPlayedcounter - 1]
                      .chordname,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class askingWidget extends StatefulWidget {
  List<List<Chords>> chordlist;
  int listno;

  askingWidget({
    super.key,
    required this.chordlist,
    required this.listno,
  });

  @override
  State<askingWidget> createState() => _askingWidgetState();
}

class _askingWidgetState extends State<askingWidget> {
  late AssetsAudioPlayer player = AssetsAudioPlayer();
  Random r = Random();
  int askingchordindex = 0;
  int score = 0;
  bool playchord = true;

  void play(int chordnumber) {
    player.open(Audio(widget.chordlist[widget.listno][chordnumber].chordlink),
        autoStart: true);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    askChords();
  }

  void askChords() {
    Future.delayed(
      const Duration(milliseconds: 100),
    );
    askingchordindex = r.nextInt(3);
    play(askingchordindex);
  }

  bool checkAnswer(String answer, optionButton button) {
    late bool ans;
    setState(() {
      if (answer ==
          widget.chordlist[widget.listno][askingchordindex].chordname) {
        score++;
        ans = true;
      } else {
        score < 1 ? score = 0 : score--;
        ans = false;
      }
    });
    return ans;
  }

  @override
  Widget build(BuildContext context) {
    Timer(Duration(seconds: 30), () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ScorePage(score: score)),
      );
    });
    return Column(
      children: [
        Expanded(
          child: Text(
            "Score $score)",
            style: TextStyle(fontSize: 40),
          ),
        ),
        Expanded(
          flex: 5,
          child: InkWell(
            onDoubleTap: () {},
            onTap: () => play(askingchordindex),
            child: const Image(
              image: AssetImage(
                "assets/images/speakerimage.png",
              ),
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
                optionButton(
                    ontap: checkAnswer,
                    chordname: widget.chordlist[widget.listno][0].chordname,
                    askChords: askChords),
                const SizedBox(width: 10),
                optionButton(
                    ontap: checkAnswer,
                    chordname: widget.chordlist[widget.listno][1].chordname,
                    askChords: askChords),
                const SizedBox(width: 10),
                optionButton(
                    ontap: checkAnswer,
                    chordname: widget.chordlist[widget.listno][2].chordname,
                    askChords: askChords),
                const SizedBox(width: 10),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class optionButton extends StatefulWidget {
  Function ontap;
  String chordname;
  Function askChords;
  optionButton(
      {super.key,
      required this.ontap,
      required this.chordname,
      required this.askChords});

  @override
  State<optionButton> createState() => _optionButtonState();
}

class _optionButtonState extends State<optionButton> {
  Color buttonColor = Colors.white;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TextButton(
        onPressed: () {
          bool ans = widget.ontap(widget.chordname, widget);
          if (ans) {
            setState(() {
              buttonColor = Colors.green;
            });
          } else {
            setState(() {
              buttonColor = Colors.red;
            });
          }
          Future.delayed(Duration(milliseconds: 500), () {
            setState(() {
              buttonColor = Colors.white;
            });
          });

          Future.delayed(Duration(milliseconds: 1000), () {
            widget.askChords();
          });
        },
        style: TextButton.styleFrom(
            backgroundColor: buttonColor,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20))),
        child: Text(
          widget.chordname,
          style: const TextStyle(
            fontSize: 25,
          ),
        ),
        //C
      ),
    );
  }
}

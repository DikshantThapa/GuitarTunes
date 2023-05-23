import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter_audio_capture/flutter_audio_capture.dart';
import 'package:pitch_detector_dart/pitch_detector.dart';
import 'package:pitchupdart/instrument_type.dart';
import 'package:pitchupdart/pitch_handler.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

final STANDARD_PITCH = [329, 246, 196, 146, 110, 82];

class GuitarTuningPage extends StatefulWidget {
  @override
  State<GuitarTuningPage> createState() => _GuitarTuningPageState();
}

class _GuitarTuningPageState extends State<GuitarTuningPage> {
  final _audioRecorder = FlutterAudioCapture();
  final pitchDetectorDart = PitchDetector(44100, 2000);
  final pitchupDart = PitchHandler(InstrumentType.guitar);

  var status = "Click on start";
  double pitch = 0;

  int selected = 0; // zero as none of them selected
  final player = AssetsAudioPlayer();
  List<String> stringSounds = [
    "assets/sounds/E4_330_new.wav",
    "assets/sounds/B_247_new.wav",
    "assets/sounds/G_196_new.wav",
    "assets/sounds/D_147_new.wav",
    "assets/sounds/A_110_new.wav",
    "assets/sounds/E2_82_new.wav"
  ];

  @override
  void initState() {
    super.initState();
    selected = 0;
  }

  Future<void> _startCapture() async {
    await _audioRecorder.start(listener, onError,
        sampleRate: 44100, bufferSize: 3000);

    setState(() {
      pitch = 0;
      status = "Play something";
    });
  }

  Future<void> _stopCapture() async {
    await _audioRecorder.stop();

    setState(() {
      pitch = 0;
      status = "Click on start";
    });
  }

  void listener(dynamic obj) {
    //Gets the audio sample
    var buffer = Float64List.fromList(obj.cast<double>());
    List<double> audioSample = buffer.toList();

    //Uses pitch_detector_dart library to detect a pitch from the audio sample
    final result = pitchDetectorDart.getPitch(audioSample);
    //If there is a pitch - evaluate it
    if (result.pitched) {
      final expectedPitch = STANDARD_PITCH[selected - 1];
      final pitchDiff = result.pitch - expectedPitch;
      String tuningStatus = "Click to start.";
      if (pitchDiff > -2.5 && pitchDiff < 2.5) {
        tuningStatus = "Tuned.";
      } else if (pitchDiff > 2.5) {
        tuningStatus = "High";
      } else {
        tuningStatus = "Low";
      }

      setState(() {
        pitch = pitchDiff;
        status = tuningStatus;
      });
    }
  }

  void onError(Object e) {
    print(e);
  }

  void playsound(int stringNumber) {
    player.open(
      Audio(stringSounds[stringNumber - 1]),
      autoStart: true,
    );
  }

  onSelected(int stringNumber) {
    if (selected == stringNumber) {
      // playsound(stringNumber);
      _stopCapture();
      setState(() {
        selected = 0;
      });
    } else {
      _startCapture();
      playsound(stringNumber);
      setState(() {
        selected = stringNumber;
      });
    }
    print("Selected String: ${selected.toString()} ");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        title: Text(
          'GuitarTunes',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
        Container(
            height: 250,
            child: SfRadialGauge(
              axes: <RadialAxis>[
                RadialAxis(
                    ranges: <GaugeRange>[
                      GaugeRange(
                        startValue: -10,
                        endValue: -7.5,
                        color: Colors.red,
                      ),
                      GaugeRange(
                        startValue: 7.5,
                        endValue: 10,
                        color: Colors.red,
                      ),
                      GaugeRange(
                        startValue: -7.5,
                        endValue: -5,
                        color: Colors.deepOrange,
                      ),
                      GaugeRange(
                        startValue: 5,
                        endValue: 7.5,
                        color: Colors.deepOrange,
                      ),
                      GaugeRange(
                        startValue: -5,
                        endValue: -2.5,
                        color: Colors.orange,
                      ),
                      GaugeRange(
                        startValue: 2.5,
                        endValue: 5,
                        color: Colors.orange,
                      ),
                      GaugeRange(
                        startValue: -2.5,
                        endValue: 0,
                        color: Colors.green,
                      ),
                      GaugeRange(
                        startValue: 0,
                        endValue: 2.5,
                        color: Colors.green,
                      )
                    ],
                    annotations: [
                      GaugeAnnotation(
                          positionFactor: 0.5,
                          angle: 90,
                          widget: Container(
                            child: Text(
                              status,
                              style: TextStyle(
                                  fontSize: 12, fontWeight: FontWeight.bold),
                            ),
                          ))
                    ],
                    minimum: -10,
                    maximum: 10,
                    pointers: <GaugePointer>[NeedlePointer(value: pitch)])
              ],
            )),
        Stack(
          children: [
            Positioned(
              child: Container(
                height: 400,
                decoration: BoxDecoration(
                    image: DecorationImage(
                  image: AssetImage("assets/images/guitar-head.png"),
                )),
              ),
            ),
            Container(
              height: 250,
              margin: EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        StringButton(
                            stringName: "D",
                            isSelected: selected == 4,
                            onSelected: onSelected),
                        StringButton(
                            stringName: "A",
                            isSelected: selected == 5,
                            onSelected: onSelected),
                        StringButton(
                            stringName: "EHigh",
                            isSelected: selected == 6,
                            onSelected: onSelected),
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        StringButton(
                            stringName: "G",
                            isSelected: selected == 3,
                            onSelected: onSelected),
                        StringButton(
                            stringName: "B",
                            isSelected: selected == 2,
                            onSelected: onSelected),
                        StringButton(
                            stringName: "ELow",
                            isSelected: selected == 1,
                            onSelected: onSelected),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        )
      ]),
    );
  }
}

class StringButton extends StatefulWidget {
  final String stringName;
  final Function onSelected;
  bool isSelected;

  StringButton(
      {Key? key,
      required this.stringName,
      required this.isSelected,
      required this.onSelected})
      : super(key: key);

  @override
  State<StringButton> createState() => _StringButtonState();
}

class _StringButtonState extends State<StringButton> {
  late bool isSelected;
  List<String> strings = ["ELow", "B", "G", "D", "A", "EHigh"];

  @override
  void initState() {
    super.initState();
    isSelected = widget.isSelected;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        // border: Border.all(
        //   color: Colors.blueGrey,
        //   width: 2.0,
        // ),
      ),
      child: ElevatedButton(
        onPressed: () {
          widget.onSelected(strings.indexOf(widget.stringName) + 1);
        },
        style: ElevatedButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor:
                widget.isSelected ? Colors.blue.shade400 : Colors.grey.shade700,
            enableFeedback: false,
            shape: CircleBorder(
                side: BorderSide(color: Colors.grey.shade800, width: 2))),
        child: Text(widget.stringName[0]),
      ),
    );
  }
}

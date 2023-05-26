import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'EarTrainer.dart';
import 'MetronomePage.dart';

class ToolsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
          elevation: 0,
          centerTitle: false,
          backgroundColor: Colors.transparent,
          title: Text("Tools",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ))),
      body: Column(children: [
        Container(
          padding: EdgeInsets.all(20),
          child: Column(children: [
            Text(
              "Metronome",
              textAlign: TextAlign.left,
              style: TextStyle(fontSize: 22),
            ),
            SizedBox(height: 10),
            InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MetronomePage()),
                  );
                },
                child: Container(
                  padding: EdgeInsets.all(10),
                  height: 150.0,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      image: DecorationImage(
                          image: AssetImage(
                              "assets/images/guitar_background-1.jpg"),
                          colorFilter:
                              ColorFilter.mode(Colors.black, BlendMode.overlay),
                          fit: BoxFit.cover)),
                  child: Container(
                      child: SvgPicture.asset(
                    "assets/images/metronome-icon.svg",
                    semanticsLabel: 'metronome logo',
                    colorFilter:
                        ColorFilter.mode(Colors.white, BlendMode.srcIn),
                  )),
                ))
          ]),
        ),
        Row(
          children: [
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(20),
                child: Column(children: [
                  const Text(
                    "Chord Diagram",
                    textAlign: TextAlign.left,
                    style: TextStyle(fontSize: 22),
                  ),
                  const SizedBox(height: 10),
                  InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => EarTrainer()),
                        );
                      },
                      child: Container(
                        padding: EdgeInsets.all(10),
                        height: 150.0,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            image: const DecorationImage(
                                image: AssetImage(
                                    "assets/images/guitar_background-1.jpg"),
                                colorFilter: ColorFilter.mode(
                                    Colors.black, BlendMode.overlay),
                                fit: BoxFit.cover)),
                        child: Container(
                            child: SvgPicture.asset(
                          "assets/images/metronome-icon.svg",
                          semanticsLabel: 'metronome logo',
                          colorFilter:
                              ColorFilter.mode(Colors.white, BlendMode.srcIn),
                        )),
                      ))
                ]),
              ),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.all(20),
                child: Column(children: [
                  Text(
                    "Ear Trainer",
                    textAlign: TextAlign.left,
                    style: TextStyle(fontSize: 22),
                  ),
                  SizedBox(height: 10),
                  InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => EarTrainer()),
                        );
                      },
                      child: Container(
                        padding: EdgeInsets.all(10),
                        height: 150.0,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            image: const DecorationImage(
                                image: AssetImage(
                                    "assets/images/guitar_background-1.jpg"),
                                colorFilter: ColorFilter.mode(
                                    Colors.black, BlendMode.overlay),
                                fit: BoxFit.cover)),
                        child: Container(
                            child: SvgPicture.asset(
                          "assets/images/metronome-icon.svg",
                          semanticsLabel: 'metronome logo',
                          colorFilter:
                              ColorFilter.mode(Colors.white, BlendMode.srcIn),
                        )),
                      ))
                ]),
              ),
            ),
          ],
        )
      ]),
    );
  }
}

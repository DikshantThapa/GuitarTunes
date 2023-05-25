import 'package:flutter/material.dart';
import 'package:guitar_tunes/pages/EarTrainingpage.dart';

class EarTrainer extends StatefulWidget {
  const EarTrainer({super.key});

  @override
  State<EarTrainer> createState() => _EarTrainerState();
}

class _EarTrainerState extends State<EarTrainer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 56,
        title: const Text(
          "Ear Trainer",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
        backgroundColor: Colors.transparent,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).maybePop();
          },
        ),
      ),
      body: ListView(
        children: [
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => EarTrainingPage(
                    listno: 0,
                  ),
                ),
              );
            },
            child: Container(
              color: Colors.blue,
              margin: EdgeInsets.only(
                top: 20,
              ),
              width: double.infinity,
              height: 100,
              child: Column(
                children: [
                  Expanded(
                      flex: 1,
                      child: Container(
                        child: Text("Three basic Chords"),
                      )),
                  Expanded(
                    flex: 4,
                    child: Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "A,",
                            style: TextStyle(fontSize: 50),
                          ),
                          Text(
                            "C,",
                            style: TextStyle(fontSize: 50),
                          ),
                          Text(
                            "D,",
                            style: TextStyle(fontSize: 50),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => EarTrainingPage(
                    listno: 1,
                  ),
                ),
              );
            },
            child: Container(
              color: Colors.blue,
              margin: EdgeInsets.only(
                top: 20,
              ),
              width: double.infinity,
              height: 100,
              child: Column(
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(
                      child: Text("Three basic Chords"),
                    ),
                  ),
                  Expanded(
                    flex: 4,
                    child: Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text(
                            "E,",
                            style: TextStyle(fontSize: 50),
                          ),
                          Text(
                            "F,",
                            style: TextStyle(fontSize: 50),
                          ),
                          Text(
                            "G,",
                            style: TextStyle(fontSize: 50),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

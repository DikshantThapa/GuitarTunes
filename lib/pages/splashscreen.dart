import 'dart:async';

import 'package:flutter/material.dart';
import 'package:guitar_tunes/main.dart';
import 'package:guitar_tunes/pages/GuitarTuningPage.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    Timer(Duration(seconds: 5), () { 
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
        return HomePage();
      },));
    });
    return MaterialApp(
      
      debugShowCheckedModeBanner: false,
      title: "Guitar Tunes",
      home: Scaffold(
        backgroundColor: Colors.black,
        body: InkWell(
          onTap: (){
            print("Please wait !");
          },
          child: Center(
            child: Text(
                "Guitar Tunes",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight:FontWeight.bold, 
                ),
            ),
          ),
        ),
      ),
    );
  }
}
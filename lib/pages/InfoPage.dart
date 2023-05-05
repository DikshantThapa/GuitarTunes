import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../components/GradientText.dart';

class InfoPage extends StatefulWidget {
  @override
  _InfoPageState createState() => _InfoPageState();
}

final Uri _url = Uri.parse('https://github.com/ItsAash/GuitarTunes');

class _InfoPageState extends State<InfoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        title: const Text(
          'Info',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset(
                  'assets/images/logo_blue.png',
                  // width: 150,
                  height: 200,
                ),
                const GradientText(
                  'Welcome to our app!',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                  gradient: LinearGradient(colors: [
                    Colors.lightBlueAccent,
                    Colors.tealAccent,
                    Colors.cyanAccent,
                  ]),
                ),
                const SizedBox(height: 20.0),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text(
                    'This app is designed to help you learn and practice your guitar skills. It includes features like real-time pitch detection, chord recognition, and interactive lessons.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 15.0,
                    ),
                  ),
                ),
                const SizedBox(height: 64.0),
                const Opacity(
                  opacity: 0.7,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text(
                      'Help us improve! Found a bug? Report it on our GitHub repository or contribute directly by creating a pull request.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 13.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 16.0),
                InkWell(
                  onTap: () => launchUrl(_url),
                  child: Image.asset(
                    'assets/images/github-mark-white.png',
                    height: 30.0,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

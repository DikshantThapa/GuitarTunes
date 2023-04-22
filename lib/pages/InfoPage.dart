import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

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
        title: Text('Info'),
      ),
      body: Stack(
        children: [
          Opacity(
            opacity: 1,
            child: Image.asset(
              'assets/images/background.png',
              fit: BoxFit.cover,
              height: double.infinity,
              width: double.infinity,
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset(
                  'assets/images/logo_blue.png',
                  // width: 150,
                  height: 200,
                ),
                Text(
                  'Welcome to our app!',
                  style: TextStyle(
                    fontSize: 30.0,
                    color: Colors.amber.shade700,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 16.0),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text(
                    'This app is designed to help you learn and practice your guitar skills. It includes features like real-time pitch detection, chord recognition, and interactive lessons.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 15.0,
                    ),
                  ),
                ),
                SizedBox(height: 32.0),
                Opacity(
                  opacity: 0.7,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text(
                      'If you have any questions or feedback, please feel free to contact us through our GitHub.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 13.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 16.0),
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

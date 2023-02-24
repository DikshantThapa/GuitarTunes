import 'package:flutter/material.dart';

import '../pages/ChordRecognitionPage.dart';
import '../pages/GuitarTuningPage.dart';
import '../pages/InfoPage.dart';
import '../pages/ToolsPage.dart';
import '../pages/SettingPage.dart';

class ButtomNav extends StatefulWidget {
  @override
  _ButtomNavState createState() => _ButtomNavState();
}

class _ButtomNavState extends State<ButtomNav> {
  int _selectedPageIndex = 2;

  final _pages = [
    SettingsPage(),
    ToolsPage(),
    GuitarTuningPage(),
    ChordRecognitionPage(),
    InfoPage()
  ];

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedPageIndex],
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        type: BottomNavigationBarType.fixed,
        showUnselectedLabels: false,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: "Setting"),
          BottomNavigationBarItem(
              icon: Icon(Icons.build_circle), label: "Tools"),
          BottomNavigationBarItem(icon: Icon(Icons.tune), label: "Tuning"),
          BottomNavigationBarItem(
              icon: Icon(Icons.library_music), label: "Chords"),
          BottomNavigationBarItem(icon: Icon(Icons.info), label: "Info")
        ],
        currentIndex: _selectedPageIndex,
        onTap: _selectPage,
      ),
    );
  }
}

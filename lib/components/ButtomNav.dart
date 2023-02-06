import 'package:flutter/material.dart';

import '../pages/ChordRecognitionPage.dart';
import '../pages/GuitarTuningPage.dart';
import '../pages/SettingPage.dart';

class ButtomNav extends StatefulWidget {
  @override
  _ButtomNavState createState() => _ButtomNavState();
}

class _ButtomNavState extends State<ButtomNav> {
  int _selectedPageIndex = 0;

  final _pages = [
    GuitarTuningPage(),
    ChordRecognitionPage(),
    SettingsPage(),
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
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.tune),
            label: "Tuning",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.library_music),
            label: "Chords",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: "Settings",
          ),
        ],
        currentIndex: _selectedPageIndex,
        onTap: _selectPage,
      ),
    );
  }
}

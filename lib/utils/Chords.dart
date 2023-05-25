class Chords {
  String chordname;
  String chordlink;

  Chords({required this.chordlink, required this.chordname});

  static Map<String, String> chords = {
    'A': "assets/sounds/Chords/chord-A.wav",
    'C': "assets/sounds/Chords/chord-C.wav",
    'D': "assets/sounds/Chords/chord-D.wav",
    'E': "assets/sounds/Chords/chord-E.wav",
    'Em': "assets/sounds/Chords/chord-Em.wav",
    'F': "assets/sounds/Chords/chord-F.wav",
    'G': "assets/sounds/Chords/chord-G.wav",
  };

  // static Map<int, String> chordnames = {
  //   0: 'A',
  //   1: 'C',
  //   2: 'E',
  //   3: 'Em',
  //   4: 'F',
  //   5: 'F',
  //   6: 'G',
  // };
}

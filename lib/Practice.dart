import 'package:guitar_tunes/utils/Chords.dart';

void main() {
  List<List<Chords>> chordlist = [
    [
      // Chords().chords["A"] ?? "",
      // Chords().chords["C"] ?? "",
      // Chords().chords["D"] ?? "",
      Chords(chordlink: Chords.chords["A"] ?? "", chordname: "A"),
      Chords(chordlink: Chords.chords["C"] ?? "", chordname: "C"),
      Chords(chordlink: Chords.chords["D"] ?? "", chordname: "D")
    ],
    [
      // Chords().chords["E"] ?? "",
      // Chords().chords["F"] ?? "",
      // Chords().chords["G"] ?? ""

      Chords(chordlink: Chords.chords["E"] ?? "", chordname: "E"),
      Chords(chordlink: Chords.chords["F"] ?? "", chordname: "F"),
      Chords(chordlink: Chords.chords["G"] ?? "", chordname: "G")
    ],
  ];

  print(chordlist[1].length);
}

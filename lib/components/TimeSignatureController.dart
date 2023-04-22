import 'package:flutter/material.dart';

List<List<int>> TIME_SIGNATURES = [
  [1, 4],
  [2, 4],
  [3, 4],
  [4, 4],
  [5, 4],
  [7, 4],
  [5, 8],
  [6, 8],
  [7, 8],
  [9, 8],
  [12, 8]
];

class TimeSignatureController extends StatefulWidget {
  List<int> timesignature = [2, 4];
  final ValueChanged<List<int>> onTimeSignatureChanged;

  TimeSignatureController(
      {Key? key,
      required this.timesignature,
      required this.onTimeSignatureChanged})
      : super(key: key);

  @override
  _TimeSignatureControllerState createState() =>
      _TimeSignatureControllerState();
}

class _TimeSignatureControllerState extends State<TimeSignatureController> {
  @override
  build(BuildContext context) {
    return PopupMenuButton(
      initialValue: 2,
      child: Text("${widget.timesignature[0]}/${widget.timesignature[0]}"),
      itemBuilder: (BuildContext context) {
        return TIME_SIGNATURES.map((e) {
          return PopupMenuItem(
            value: TIME_SIGNATURES.indexOf(e),
            child: Text("${e[0]} / ${e[1]}"),
          );
        }).toList();
      },
    );
  }
}

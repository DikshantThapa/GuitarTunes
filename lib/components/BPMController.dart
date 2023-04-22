import 'package:flutter/material.dart';

class BpmController extends StatefulWidget {
  final int bpm;
  final ValueChanged<int> onBpmChange;

  const BpmController({
    Key? key,
    required this.bpm,
    required this.onBpmChange,
  }) : super(key: key);

  @override
  _BpmControllerState createState() => _BpmControllerState();
}

class _BpmControllerState extends State<BpmController> {
  void _decrementBpm() {
    // limiting to 30
    if (widget.bpm > 30) {
      widget.onBpmChange(widget.bpm - 1);
    }
  }

  void _incrementBpm() {
    // limiting to 240
    if (widget.bpm < 240) {
      widget.onBpmChange(widget.bpm + 1);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            border: Border.all(color: Colors.grey),
          ),
          child: IconButton(
            highlightColor: Colors.greenAccent,
            icon: const Icon(Icons.remove),
            onPressed: _decrementBpm,
          ),
        ),
        const SizedBox(width: 20),
        Text(
          widget.bpm.toString(),
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(width: 20),
        Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              border: Border.all(color: Colors.grey),
            ),
            child: IconButton(
              highlightColor: Colors.greenAccent,
              icon: const Icon(Icons.add),
              onPressed: _incrementBpm,
            )),
      ],
    );
  }
}

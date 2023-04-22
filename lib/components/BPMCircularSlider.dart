import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class BPMCircularSlider extends StatefulWidget {
  final int bpm;
  final ValueChanged<ValueChangingArgs> onBpmChange;
  final Function onStart;
  final Function onStop;

  const BPMCircularSlider({
    Key? key,
    required this.bpm,
    required this.onBpmChange,
    required this.onStart,
    required this.onStop,
  }) : super(key: key);

  @override
  _BPMCircularSliderState createState() => _BPMCircularSliderState();
}

class _BPMCircularSliderState extends State<BPMCircularSlider> {
  bool _isPlaying = false;

  void _togglePlaying() {
    setState(() {
      _isPlaying = !_isPlaying;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 16),
        SfRadialGauge(
          axes: <RadialAxis>[
            RadialAxis(
              minimum: 30,
              maximum: 240,
              showLabels: true,
              showTicks: true,
              startAngle: 150,
              interval: 20,
              endAngle: 30,
              radiusFactor: 0.7,
              axisLineStyle: AxisLineStyle(
                thickness: 0.1,
                color: Colors.grey.shade700,
                thicknessUnit: GaugeSizeUnit.factor,
              ),
              pointers: <GaugePointer>[
                RangePointer(
                  value: widget.bpm.toDouble(),
                  cornerStyle: CornerStyle.bothFlat,
                  width: 0.1,
                  sizeUnit: GaugeSizeUnit.factor,
                  enableAnimation: true,
                  animationType: AnimationType.easeOutBack,
                  animationDuration: 1000,
                  color: Colors.grey.shade300,
                ),
                MarkerPointer(
                  value: widget.bpm.toDouble(),
                  enableDragging: true,
                  enableAnimation: true,
                  onValueChanging: widget.onBpmChange,
                  animationType: AnimationType.easeOutBack,
                  markerType: MarkerType.circle,
                  color: Colors.grey.shade100,
                  markerHeight: 20,
                  markerWidth: 20,
                )
              ],
              annotations: <GaugeAnnotation>[
                GaugeAnnotation(
                  widget: Container(
                      alignment: Alignment.center,
                      child: GestureDetector(
                          behavior: HitTestBehavior.translucent,
                          onTap: () {
                            _togglePlaying();
                            if (_isPlaying) {
                              widget.onStart();
                            } else {
                              widget.onStop();
                            }
                          },
                          child: Icon(
                            _isPlaying ? Icons.pause : Icons.play_arrow,
                            size: 48,
                          ))),
                  angle: 90,
                  positionFactor: 0,
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}

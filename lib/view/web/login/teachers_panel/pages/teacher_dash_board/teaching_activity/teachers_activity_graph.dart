// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class TeacherActivityGraph extends StatelessWidget {
  const TeacherActivityGraph({super.key});

  @override
  Widget build(BuildContext context) {
    return SfRadialGauge(axes: <RadialAxis>[
      RadialAxis(
          radiusFactor: 0.9,
          minimum: 0,
          maximum: 100,
          showLabels: false,
          showTicks: true,
          interval: 10,
          ticksPosition: ElementsPosition.inside,
          tickOffset: 5,
          majorTickStyle: const MajorTickStyle(color: Colors.red, length: 0.5),
          minorTickStyle: const MinorTickStyle(color: Colors.white),
          axisLineStyle: const AxisLineStyle(
            thickness: 0.2,
            cornerStyle: CornerStyle.bothFlat,
            color: Color.fromARGB(255, 137, 238, 140),
            thicknessUnit: GaugeSizeUnit.factor,
          ),
          pointers: const <GaugePointer>[
            RangePointer(
              color: Colors.blue,
              value: 50,
              cornerStyle: CornerStyle.endCurve,
              width: 0.2,
              sizeUnit: GaugeSizeUnit.factor,
            ),
          ],
          annotations: const <GaugeAnnotation>[
            GaugeAnnotation(
              axisValue: 50,
              positionFactor: 0.2,
              widget: Text(
                '50%',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
              ),
            ),
          ])
    ]);
  }
}

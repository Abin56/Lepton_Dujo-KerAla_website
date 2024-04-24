// ignore_for_file: sort_child_properties_last

// import 'package:dash_board/view/fonts/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'package:dujo_kerala_website/view/fonts/text_widget.dart';


/// Represents StudentAttendance class
class StudentAttendance extends StatefulWidget {
  /// Creates the instance of StudentAttendance
  const StudentAttendance({Key? key}) : super(key: key);

  @override
  MyHomePageState createState() => MyHomePageState();
}

class MyHomePageState extends State<StudentAttendance> {
  Widget _getGauge({bool isRadialGauge = true}) {
    if (isRadialGauge) {
      return _getRadialGauge();
    } else {
      return _getLinearGauge();
    }
  }

  Widget _getRadialGauge() {
    return SfRadialGauge(
        // title: GaugeTitle(
        //     text: 'Speedometer',
        //     textStyle:
        //         const TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold)),
        axes: <RadialAxis>[
          RadialAxis(
            startAngle: 180,
            endAngle: 360,
              // showTicks: false,
              showLabels: false,
            minimum: 0, maximum: 200, ranges: <GaugeRange>[
            GaugeRange(
             
                startValue: 0,
                endValue: 50,
                color: Colors.blue,
                startWidth: 04,
                endWidth: 04
                ),
            GaugeRange(
                startValue: 50,
                endValue: 100,
                color: Colors.green,
                startWidth: 04,
                endWidth: 04),
            GaugeRange(
                startValue: 100,
                endValue: 150,
                color: Colors.orange,
                startWidth: 04,
                endWidth: 04),
            GaugeRange(
                startValue: 150,
                endValue: 200,
                color: Colors.red,
                startWidth: 04,
                endWidth: 04)
          ], pointers: const <GaugePointer>[

            NeedlePointer(
              needleLength: 0.5,needleStartWidth: 0.5,needleEndWidth: 0.5,
              value: 90)
          ], annotations: <GaugeAnnotation>[
            GaugeAnnotation(
                widget: Container(
                    child:Column(mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(height: 20,),
                        TextFontWidget(text: "My Total Points", fontsize: 14),
                        TextFontWidget(text: "156", fontsize: 16,fontWeight: FontWeight.w700,),
                      ],
                    ),
                            ),
               angle: 90,
                positionFactor: 0.5)
          ])
        ]);
  }

  Widget _getLinearGauge() {
    return Container(
      //color: Colors.white,
      child: SfLinearGauge(
          minimum: 0.0,
          maximum: 100.0,
          orientation: LinearGaugeOrientation.horizontal,
          majorTickStyle: const LinearTickStyle(length: 20),
          axisLabelStyle: const TextStyle(fontSize: 12.0, color: Colors.black),
          axisTrackStyle: const LinearAxisTrackStyle(
              color: Colors.cyan,
              edgeStyle: LinearEdgeStyle.bothFlat,
              thickness: 15.0,
              borderColor: Colors.grey)),
      margin: const EdgeInsets.all(10),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(title: const Text('Syncfusion Flutter Gauge')),
        body: _getGauge());
  }
}
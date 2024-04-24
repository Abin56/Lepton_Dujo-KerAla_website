import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class TeacherClassAttendenceGraph extends StatefulWidget {
  const TeacherClassAttendenceGraph({super.key});

  @override
  State<TeacherClassAttendenceGraph> createState() =>
      _TeacherClassAttendenceGraphState();
}

class _TeacherClassAttendenceGraphState
    extends State<TeacherClassAttendenceGraph> {
  @override
  @override
  Widget build(BuildContext context) {
    final List<ChartData> chartData = <ChartData>[
      ChartData("I P", 40, 50),
      ChartData("II P", 45, 50),
      ChartData('III P', 36, 50),
      ChartData('IV P', 20, 50),
      ChartData('V P', 28, 50),
      ChartData("VI P", 39, 50),
      ChartData("VII P", 40, 50),
      ChartData("VIII P", 45, 50),
      ChartData('IX P', 36, 50),
      ChartData('X P', 20, 50),
    ];
    return SfCartesianChart(
      primaryXAxis: CategoryAxis(),
      primaryYAxis: NumericAxis(
        decimalPlaces: 4,
        // rangPadding: ChartRange adding.none
      ),
      series: <CartesianSeries<ChartData, dynamic>>[
        LineSeries<ChartData, dynamic>(
          dataLabelSettings: const DataLabelSettings(

              // Renders the data label
              isVisible: true),
          dataSource: chartData,
          markerSettings: const MarkerSettings(isVisible: true),
          xValueMapper: (ChartData data, _) => data.x,
          yValueMapper: (ChartData data, _) => data.y,
          color: const Color.fromARGB(255, 255, 170, 1),
        ),
        LineSeries<ChartData, dynamic>(
            dataLabelSettings: const DataLabelSettings(

                // Renders the data label
                isVisible: true),
            dataSource: chartData,
            markerSettings: const MarkerSettings(isVisible: true),
            xValueMapper: (ChartData data, _) => data.x,
            yValueMapper: (ChartData data, _) => data.y1,
            color: const Color.fromARGB(255, 48, 79, 254)),
      ],
    );
  }
}

class ChartData {
  ChartData(this.x, this.y, this.y1);
  final x;
  final double y;
  final double y1;
}

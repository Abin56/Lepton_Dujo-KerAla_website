import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class OthersAttendanceGraph extends StatelessWidget {
  const OthersAttendanceGraph({super.key});

  @override
  Widget build(BuildContext context) {
    final List<ChartData> chartData = <ChartData>[
      ChartData(
        'Teachers',
        100,
        70,
        30,
      ),
      ChartData(
        'Staffs',
        100,
        60,
        40,
      ),
    ];
    return SfCartesianChart(
        primaryXAxis: CategoryAxis(),
        primaryYAxis: NumericAxis(minimum: 0, maximum: 100, interval: 10),
        series: <CartesianSeries>[
          ColumnSeries<ChartData, String>(
            dataLabelSettings: const DataLabelSettings(

                // Renders the data label
                isVisible: true),
            dataSource: chartData,
            xValueMapper: (ChartData data, _) => data.x,
            yValueMapper: (ChartData data, _) => data.y,
            // pointColorMapper: (data, index) => data.color,
            // color: const Color.fromARGB(255, 255, 170, 1),
          ),
          ColumnSeries<ChartData, String>(
            dataLabelSettings: const DataLabelSettings(

                // Renders the data label
                isVisible: true),
            dataSource: chartData,
            xValueMapper: (ChartData data, _) => data.x,
            yValueMapper: (ChartData data, _) => data.y1,
            // pointColorMapper: (data, index) => data.color,
            // color: const Color.fromARGB(255, 65, 125, 252),
          ),
          ColumnSeries<ChartData, String>(
            dataLabelSettings: const DataLabelSettings(

                // Renders the data label
                isVisible: true),
            dataSource: chartData,
            xValueMapper: (ChartData data, _) => data.x,
            yValueMapper: (ChartData data, _) => data.y2,
            // pointColorMapper: (data, index) => data.color,
            // color: const Color.fromARGB(255, 251, 65, 65),
          )
        ]);
  }
}

class ChartData {
  ChartData(
    this.x,
    this.y,
    this.y1,
    this.y2,
  );
  final String x;
  final double? y;
  final double? y1;
  final double? y2;
  // final Color color;
}

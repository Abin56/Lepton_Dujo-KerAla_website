import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class TeacherClassExamDetailsGraph extends StatelessWidget {
  const TeacherClassExamDetailsGraph({super.key});

  @override
  Widget build(BuildContext context) {
    final List<ChartData> chartData = <ChartData>[
      ChartData(
        'First Exam',
        100,
        70,
      ),
      ChartData(
        'Second Exam',
        100,
        84,
      ),
      ChartData(
        'Third Exam',
        100,
        72,
      ),
      ChartData(
        'Fourth Exam',
        100,
        58,
      ),
      ChartData(
        'Fifth Exam',
        100,
        65,
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
            color: Colors.blue,
          ),
          ColumnSeries<ChartData, String>(
            dataLabelSettings: const DataLabelSettings(

                // Renders the data label
                isVisible: true),
            dataSource: chartData,
            xValueMapper: (ChartData data, _) => data.x,
            yValueMapper: (ChartData data, _) => data.y1,

            // pointColorMapper: (data, index) => data.color,
            color: Colors.greenAccent,
          ),
          // ColumnSeries<ChartData, String>(
          //   dataLabelSettings: const DataLabelSettings(

          //       // Renders the data label
          //       isVisible: true),
          //   dataSource: chartData,
          //   xValueMapper: (ChartData data, _) => data.x,
          //   // yValueMapper: (ChartData data, _) => data.y2,
          //   // pointColorMapper: (data, index) => data.color,
          //   // color: const Color.fromARGB(255, 251, 65, 65),
          // )
        ]);
  }
}

class ChartData {
  ChartData(
    this.x,
    this.y,
    this.y1,
  );
  final String x;
  final double? y;
  final double? y1;

  // final Color color;
}

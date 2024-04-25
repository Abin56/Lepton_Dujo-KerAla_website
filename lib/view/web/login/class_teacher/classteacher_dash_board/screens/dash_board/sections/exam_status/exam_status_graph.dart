import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ExamStatusGraph extends StatefulWidget {
  const ExamStatusGraph({super.key});

  @override
  State<ExamStatusGraph> createState() => _ExamStatusGraphState();
}

class _ExamStatusGraphState extends State<ExamStatusGraph> {
  @override
  @override
  Widget build(BuildContext context) {
    final List<ChartData> chartData = <ChartData>[
      ChartData("First Term", 3000, 4500),
      ChartData("Onam Exam", 3400, 4500),
      ChartData('Second', 3000, 4500),
      ChartData('X mas Exam', 4000, 4500),
      ChartData('Third Term', 3400, 4500),
      ChartData("Final Exam", 4450, 4500),
    ];
    return SfCartesianChart(
      primaryXAxis: CategoryAxis(),
      primaryYAxis: NumericAxis(
        decimalPlaces: 4,
        // rangPadding: ChartRangePadding.none
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

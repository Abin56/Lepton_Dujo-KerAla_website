import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class StudentsAttendenceCircleGraph extends StatefulWidget {
  const StudentsAttendenceCircleGraph({super.key});

  @override
  State<StudentsAttendenceCircleGraph> createState() =>
      _StudentsAttendenceCircleGraphState();
}

class _StudentsAttendenceCircleGraphState
    extends State<StudentsAttendenceCircleGraph> {
  @override
  Widget build(BuildContext context) {
    final List<ChartData> chartData = [
      ChartData('Present', 62, const Color.fromARGB(255, 65, 125, 252)),
      ChartData('Absent', 38, const Color.fromARGB(255, 255, 0, 0))

      // ChartData('Jack', 34, const Color.fromRGBO(228, 0, 124, 1)),
      // ChartData('Others', 52, const Color.fromRGBO(255, 189, 57, 1))
    ];
    return SfCircularChart(
      annotations: <CircularChartAnnotation>[
        CircularChartAnnotation(
            height:
                '80%', // Setting height and width for the circular chart annotation
            width: '80%',
            widget: PhysicalModel(
                shape: BoxShape.circle,
                elevation: 10,
                shadowColor: Colors.black,
                color: const Color.fromRGBO(230, 230, 230, 1),
                child: Container())),
        CircularChartAnnotation(
            widget: const Text('62%',
                style: TextStyle(color: Colors.black, fontSize: 25)))
      ],
      series: <DoughnutSeries<ChartData, String>>[
        DoughnutSeries<ChartData, String>(
          innerRadius: '70%',
          dataSource: chartData,
          animationDuration: 1,
          dataLabelSettings: const DataLabelSettings(isVisible: true),
          xValueMapper: (ChartData data, _) => data.x,
          yValueMapper: (ChartData data, _) => data.y,
          pointColorMapper: (data, index) => data.color,
        )
      ],
    );
  }
}

class ChartData {
  ChartData(this.x, this.y, this.color);
  final String x;
  final double y;
  final Color color;
}

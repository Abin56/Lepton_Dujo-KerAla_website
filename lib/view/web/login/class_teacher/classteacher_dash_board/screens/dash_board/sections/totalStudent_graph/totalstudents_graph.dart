import 'package:dujo_kerala_website/view/colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class TotalStudentCircleGraph extends StatefulWidget {
  const TotalStudentCircleGraph({super.key});

  @override
  State<TotalStudentCircleGraph> createState() => _TotalStudentCircleGraphState();
}

class _TotalStudentCircleGraphState extends State<TotalStudentCircleGraph> {
  late List<_ChartData> data;
  late TooltipBehavior _tooltip;
  @override
  void initState() {
    data = [
      _ChartData('Male', 200, const Color.fromARGB(255, 255, 166, 1)),
      _ChartData('Female', 70, const Color.fromARGB(255, 15, 51, 255)),
    ];
    _tooltip = TooltipBehavior(enable: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SfCircularChart(tooltipBehavior: _tooltip, series: [
      DoughnutSeries<_ChartData, String>(
          innerRadius: '70%',
          strokeColor: cWhite,
          strokeWidth: 2,
          dataLabelSettings: const DataLabelSettings(

              // Renders the data label
              isVisible: true),
          dataSource: data,
          xValueMapper: (_ChartData data, _) => data.x,
          yValueMapper: (_ChartData data, _) => data.y,
          pointColorMapper: (data, index) => data.color,
          name: 'Students')
    ]);
  }
}

class _ChartData {
  _ChartData(this.x, this.y, this.color);
  final Color color;
  final String x;
  final double y;
}

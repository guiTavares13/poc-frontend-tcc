import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../data/data.dart';

class MyLineChart extends StatelessWidget {
  final List<ChartData> chartData;

  MyLineChart(this.chartData);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: LineChart(
        LineChartData(
          lineBarsData: [
            LineChartBarData(
              barWidth: 5,
              color: Colors.white,
              spots: chartData
                  .map((point) => FlSpot(point.date, point.resultPredicao))
                  .toList(),
              dotData: FlDotData(show: true),
            ),
          ],
        ),
      ),
    );
  }
}

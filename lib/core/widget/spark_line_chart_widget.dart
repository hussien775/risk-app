// file: lib/widgets/sparkline_chart.dart
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'dart:math';

import 'package:risk/core/widget/back_button_widget.dart';

class SparklineChart extends StatelessWidget {
  final Color color;

  const SparklineChart({
    super.key,
    required this.color,
  });

  List<FlSpot> _generateStaticDummyData() {
    // بيانات ثابته لأجل شكل جمالي محدد
    return [
      FlSpot(0, 3),
      FlSpot(1, 4),
      FlSpot(2, 1),
      FlSpot(3, 5),
      FlSpot(4, 2),
      FlSpot(5, 6),
      FlSpot(6, 3),
      FlSpot(7, 4),
      FlSpot(8, 2),
      FlSpot(9, 5),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 20.h,
      width: 100,
      child: LineChart(
        LineChartData(
          lineBarsData: [
            LineChartBarData(
              spots: _generateStaticDummyData(),
              isCurved: true,
              barWidth: 2,
              color: color.withOpacity(0.8),
              isStrokeCapRound: true,
              dotData: FlDotData(show: false),
              belowBarData: BarAreaData(
                show: true,
                color: color.withOpacity(0.3),
              ),
            ),
          ],
          titlesData: FlTitlesData(show: false),
          gridData: FlGridData(show: false),
          borderData: FlBorderData(show: false),
          lineTouchData: LineTouchData(enabled: false),
        ),
      ),
    );
  }
}

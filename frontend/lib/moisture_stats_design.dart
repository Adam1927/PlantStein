import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class MoistureStatsDesign extends StatefulWidget {
  const MoistureStatsDesign({super.key});

  @override
  State<MoistureStatsDesign> createState() => _MoistureStatsDesignState();
}

class _MoistureStatsDesignState extends State<MoistureStatsDesign> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      child: BarChart(
        BarChartData(),
      ),
    );
  }
}

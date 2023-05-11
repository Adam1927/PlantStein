import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:google_fonts/google_fonts.dart';

class TemperatureChart extends StatefulWidget {
  const TemperatureChart({super.key});

  @override
  State<TemperatureChart> createState() => _TemperatureChartState();
}

class _TemperatureChartState extends State<TemperatureChart> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 30.0, top: 10.0),
      height: 160,
      child: LineChart(
        LineChartData(
          minX: 0,
          maxX: 8,
          minY: 0,
          maxY: 10,
          lineBarsData: [
            LineChartBarData(
              spots: [
                const FlSpot(1, 8.3),
                const FlSpot(2, 6),
                const FlSpot(3, 5.5),
                const FlSpot(4, 8),
                const FlSpot(5, 9),
                const FlSpot(6, 5),
                const FlSpot(7, 2),
              ],
              isCurved: true,
              barWidth: 2,
              color: const Color(0xFFCE9E8E),
              dotData: FlDotData(
                show: false,
              ),
            )
          ],
          borderData: FlBorderData(
            border: const Border(
              bottom: BorderSide(),
            ),
          ),
          gridData: FlGridData(
            show: false,
          ),
          titlesData: FlTitlesData(
            leftTitles: AxisTitles(
              sideTitles: SideTitles(showTitles: false),
            ),
            rightTitles: AxisTitles(
              sideTitles: SideTitles(showTitles: false),
            ),
            topTitles: AxisTitles(
              sideTitles: SideTitles(showTitles: false),
            ),
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                getTitlesWidget: (value, meta) {
                  String text = '';
                  switch (value.toInt()) {
                    case 1:
                      text = "M";
                      break;
                    case 2:
                      text = "T";
                      break;
                    case 3:
                      text = "W";
                      break;
                    case 4:
                      text = "T";
                      break;
                    case 5:
                      text = "F";
                      break;
                    case 6:
                      text = "S";
                      break;
                    case 7:
                      text = "S";
                      break;
                    default:
                      return Container();
                  }
                  return Text(
                    text,
                    style: GoogleFonts.playfairDisplay(
                      color: const Color(0xFF474847),
                      fontSize: 15,
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}

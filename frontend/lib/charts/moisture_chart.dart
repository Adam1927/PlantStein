import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:google_fonts/google_fonts.dart';
import 'data.dart';

class MoistureChart extends StatefulWidget {
  const MoistureChart({super.key});

  @override
  State<MoistureChart> createState() => _MoistureChartState();
}

class _MoistureChartState extends State<MoistureChart> {
  @override
  Widget build(BuildContext context) {
    List<Data> barData = const [
      Data(
        //name: 'M',
        id: 0,
        y: 15,
      ),
      Data(
        //name: 'T',
        id: 1,
        y: 12,
      ),
      Data(
        //name: 'W',
        id: 2,
        y: 11,
      ),
      Data(
        //name: 'T',
        id: 3,
        y: 10,
      ),
      Data(
        //name: 'F',
        id: 4,
        y: 5,
      ),
      Data(
        //name: 'S',
        id: 5,
        y: 17,
      ),
      Data(
        //name: 'S',
        id: 6,
        y: 5,
      ),
    ];
    return Container(
      margin: const EdgeInsets.only(bottom: 30.0, top: 10.0),
      height: 160,
      child: BarChart(
        BarChartData(
          alignment: BarChartAlignment.center,
          maxY: 20,
          minY: 1,
          groupsSpace: 26,
          barTouchData: BarTouchData(
            enabled: true,
          ),
          barGroups: barData
              .map(
                (data) => BarChartGroupData(
                  x: data.id,
                  barRods: [
                    BarChartRodData(
                      toY: data.y,
                      width: 20.0,
                      color: const Color(0xFF93B8CD),
                      borderRadius: const BorderRadius.all(Radius.circular(0)),
                    ),
                  ],
                ),
              )
              .toList(),
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
                    case 0:
                      text = "M";
                      break;
                    case 1:
                      text = "T";
                      break;
                    case 2:
                      text = "W";
                      break;
                    case 3:
                      text = "T";
                      break;
                    case 4:
                      text = "F";
                      break;
                    case 5:
                      text = "S";
                      break;
                    case 6:
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

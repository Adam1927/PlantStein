import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:plant_stein/moisture_stats_design.dart';
import 'package:plant_stein/temperature_stats_design.dart';

class Statistics extends StatefulWidget {
  const Statistics({super.key});

  @override
  State<Statistics> createState() => _StatisticsState();
}

class _StatisticsState extends State<Statistics> {
  @override
  Widget build(BuildContext context) {
    debugPrint("loading statistics for pot ");
    return SingleChildScrollView(
      child: Column(
        children: [
          AppBar(
            title: Text(
              'Statistics',
              textAlign: TextAlign.center,
              style: GoogleFonts.playfairDisplay(
                  color: Colors.black,
                  fontSize: 30,
                  fontWeight: FontWeight.bold),
            ),
            centerTitle: true,
            elevation: 0.0,
            backgroundColor: const Color(0xFFEBEDEB),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              children: [
                Text(
                  'Pot #',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.playfairDisplay(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                const Text('Soil Moisture'),
                const MoistureStatsDesign(),
                const Text('Room Temperature'),
                const TemperatureStatsDesign(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

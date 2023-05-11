import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
<<<<<<< HEAD
import 'package:plant_stein/moisture_stats_design.dart';
import 'package:plant_stein/temperature_stats_design.dart';
=======
import 'package:plant_stein/charts/humidity_chart.dart';
import 'package:plant_stein/charts/light_chart.dart';
import 'package:plant_stein/charts/moisture_chart.dart';
import 'package:plant_stein/charts/temperature_chart.dart';
>>>>>>> ef44a50 (implement statistics screen #21)

class Statistics extends StatefulWidget {
  const Statistics({super.key});

  @override
  State<Statistics> createState() => _StatisticsState();
}

class _StatisticsState extends State<Statistics> {
  @override
  Widget build(BuildContext context) {
<<<<<<< HEAD
    debugPrint("loading statistics for pot ");
=======
    debugPrint("loading statistics for plant ");
>>>>>>> ef44a50 (implement statistics screen #21)
    return SingleChildScrollView(
      child: Column(
        children: [
          AppBar(
            title: Text(
              'Statistics',
              textAlign: TextAlign.center,
              style: GoogleFonts.playfairDisplay(
<<<<<<< HEAD
                  color: Colors.black,
=======
                  color: const Color(0xFF474847),
>>>>>>> ef44a50 (implement statistics screen #21)
                  fontSize: 30,
                  fontWeight: FontWeight.bold),
            ),
            centerTitle: true,
            elevation: 0.0,
            backgroundColor: const Color(0xFFEBEDEB),
          ),
          Container(
<<<<<<< HEAD
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
=======
            padding: const EdgeInsets.symmetric(horizontal: 40.0),
            child: Column(
              children: [
                const SizedBox(
                  height: 20.0,
                ),
                Text('Last 7 days'.toUpperCase(),
                    style: GoogleFonts.playfairDisplay(
                      color: const Color(0xFFCE9E8E),
                      fontSize: 20,
                    )),
                const SizedBox(
                  height: 20.0,
                ),
                Text(
                  'Pot #',
                  style: GoogleFonts.playfairDisplay(
                      color: const Color(0xFF474847),
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Text(
                  'Soil Moisture',
                  style: GoogleFonts.playfairDisplay(
                    color: const Color(0xFF474847),
                    fontSize: 20,
                  ),
                ),
                const MoistureChart(),
                Text(
                  'Room Temperature',
                  style: GoogleFonts.playfairDisplay(
                    color: const Color(0xFF474847),
                    fontSize: 20,
                  ),
                ),
                const TemperatureChart(),
                Text(
                  'Room Humidity',
                  style: GoogleFonts.playfairDisplay(
                    color: const Color(0xFF474847),
                    fontSize: 20,
                  ),
                ),
                const HumidityChart(),
                Text(
                  'Lighting',
                  style: GoogleFonts.playfairDisplay(
                    color: const Color(0xFF474847),
                    fontSize: 20,
                  ),
                ),
                const LightChart(),
>>>>>>> ef44a50 (implement statistics screen #21)
              ],
            ),
          ),
        ],
      ),
    );
  }
}

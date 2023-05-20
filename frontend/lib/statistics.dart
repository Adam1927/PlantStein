import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:plant_stein/charts/humidity_chart.dart';
import 'package:plant_stein/charts/light_chart.dart';
import 'package:plant_stein/charts/moisture_chart.dart';
import 'package:plant_stein/charts/temperature_chart.dart';

class Statistics extends StatefulWidget {
  const Statistics({super.key});

  @override
  State<Statistics> createState() => _StatisticsState();
}

class _StatisticsState extends State<Statistics> {
  @override
  Widget build(BuildContext context) {
    debugPrint("loading statistics for plant ");
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        title: Text(
          'Statistics',
          textAlign: TextAlign.center,
          style: GoogleFonts.playfairDisplay(
              color: Colors.black, fontSize: 30, fontWeight: FontWeight.bold),
        ),
        iconTheme: const IconThemeData(color: Color(0xFF5F725F)),
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: const Color(0xFFEBEDEB),
      ),
      body: SingleChildScrollView(
        child: Container(
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
            ],
          ),
        ),
      ),
    );
  }
}

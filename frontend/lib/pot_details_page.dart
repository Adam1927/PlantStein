import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PotDetails extends StatefulWidget {
  final int potId;
  const PotDetails(this.potId, {super.key});

  @override
  State<PotDetails> createState() => _PotDetailsState();
}

class _PotDetailsState extends State<PotDetails> {
  @override
  Widget build(BuildContext context) {
    debugPrint("loading pot details for pot ");
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            AppBar(
              title: Text(
                'Pot #',
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
            Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 20.0),
                  child: const Text('Soil Moisture'),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 10.0, bottom: 20.0),
                  height: 95.0,
                  width: 300.0,
                  padding: const EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    color: const Color(0xFF5F725F),
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.shade600,
                        spreadRadius: -1,
                        blurRadius: 5,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        '#\nCurrent',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.0,
                        ),
                      ),
                      SizedBox(
                        width: 40.0,
                      ),
                      Text(
                        '#\nPreferred',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.0,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 20.0),
                  child: const Text('Room Temperature'),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 10.0, bottom: 20.0),
                  height: 95.0,
                  width: 300.0,
                  padding: const EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    color: const Color(0xFF5F725F),
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.shade600,
                        spreadRadius: -1,
                        blurRadius: 5,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        '#\nCurrent',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.0,
                        ),
                      ),
                      SizedBox(
                        width: 40.0,
                      ),
                      Text(
                        '#\nPreferred',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.0,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 20.0),
                  child: const Text('Room Humidity'),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 10.0, bottom: 20.0),
                  height: 95.0,
                  width: 300.0,
                  padding: const EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    color: const Color(0xFF5F725F),
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.shade600,
                        spreadRadius: -1,
                        blurRadius: 5,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        '#\nCurrent',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.0,
                        ),
                      ),
                      SizedBox(
                        width: 40.0,
                      ),
                      Text(
                        '#\nPreferred',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.0,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 20.0),
                  child: const Text('Light'),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 10.0, bottom: 20.0),
                  height: 95.0,
                  width: 300.0,
                  padding: const EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    color: const Color(0xFF5F725F),
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.shade600,
                        spreadRadius: -1,
                        blurRadius: 5,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        '#\nCurrent',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.0,
                        ),
                      ),
                      SizedBox(
                        width: 40.0,
                      ),
                      Text(
                        '#\nPreferred',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.0,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

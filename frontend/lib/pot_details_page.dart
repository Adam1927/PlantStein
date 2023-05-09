import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_fonts/google_fonts.dart';
import 'plant_details.dart';
import 'package:http/http.dart' as http;

class PotDetails extends StatefulWidget {
  final int potId;
  const PotDetails(this.potId, {super.key});

  State<PotDetails> createState() => _PotDetailsState();
}

class _PotDetailsState extends State<PotDetails> {
  Future<PlantDetails> plantDetails = Future<PlantDetails>.value(
    const PlantDetails(
      plantNickname: 'Loading...',
      moisture: 'Loading...',
      brightness: 0,
      temperature: 0,
      humidity: 0,
    ),
  );

  @override
  void initState() {
    super.initState();
    plantDetails = getPlantDetails();

    Timer.periodic(Duration(seconds: 5), (timer) {
      setState(() {
        plantDetails = getPlantDetails();
      });
    });
  }

  Future<PlantDetails> getPlantDetails() async {
    var url =
        Uri.http(dotenv.env["SERVER"]!, 'plant/condition/${widget.potId}');
    final response = await http.get(url);
    debugPrint(response.body);
    return PlantDetails.fromJson(jsonDecode(response.body));
  }

  @override
  Widget build(BuildContext context) {
    debugPrint("loading pot details for pot ");
    return Scaffold(
      body: FutureBuilder<PlantDetails>(
          future: plantDetails,
          builder: (context, snapshot) {
            if (!snapshot.hasData) return Container();

            debugPrint(snapshot.data.toString());
            PlantDetails plantDetails = snapshot.data!;

            return SingleChildScrollView(
              child: Column(
                children: [
                  AppBar(
                    title: Text(
                      plantDetails.plantNickname,
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
                          children: [
                            Text(
                              "${plantDetails.moisture}",
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
                          children: [
                            Text(
                              '${plantDetails.temperature}\nCurrent',
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
                          children: [
                            Text(
                              '${plantDetails.humidity}\nCurrent',
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
                          children: [
                            Text(
                              '${plantDetails.brightness}\nCurrent',
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
            );
          }),
    );
  }
}
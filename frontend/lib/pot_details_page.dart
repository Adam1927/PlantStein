// ignore_for_file: use_build_context_synchronously
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
        floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton.extended(
              onPressed: () async {
                final result = await openEditPlantName(context, widget.potId);
              },
              backgroundColor: const Color(0xFFA0AFA1),
              label: const Text("Edit Name"),
              icon: const Icon(Icons.edit),
            ),
            const SizedBox(
              height: 10,
            ),
            FloatingActionButton.extended(
              onPressed: () async {
                final result = await openEditPlantRoom(context, widget.potId);
              },
              backgroundColor: const Color(0xFFA0AFA1),
              label: const Text("Change Room"),
              icon: const Icon(Icons.meeting_room),
            )
          ],
        ));
  }

  Future openEditPlantName(BuildContext context, int potId) async {
    final TextEditingController newNameController = TextEditingController();
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: const Color(0XFF5F725F),
        title: Text(
          'Rename plant',
          textAlign: TextAlign.center,
          style: GoogleFonts.playfairDisplay(color: Colors.white),
        ),
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            TextField(
              controller: newNameController,
              autofocus: true,
              decoration: const InputDecoration(
                  hintText: 'Enter new pot name',
                  fillColor: Colors.white,
                  filled: true,
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white))),
            ),
          ],
        ),
        actions: [
          TextButton(
            style: const ButtonStyle(
                backgroundColor:
                    MaterialStatePropertyAll<Color>(Color(0xFFA85032))),
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text(
              'CANCEL',
              textAlign: TextAlign.center,
              style: GoogleFonts.playfairDisplay(color: Colors.white),
            ),
          ),
          TextButton(
            style: const ButtonStyle(
                backgroundColor: MaterialStatePropertyAll<Color>(Colors.white)),
            onPressed: () async {
              http.Response response = await editPlantName(
                  potId, newNameController.text); // load pots again
              debugPrint(response.statusCode.toString());
              Navigator.of(context).pop();
            },
            child: Text(
              'SAVE',
              textAlign: TextAlign.center,
              style: GoogleFonts.playfairDisplay(color: Colors.black),
            ),
          ),
        ],
      ),
    );
  }

  Future<http.Response> editPlantName(int plant, String newName) {
    var url = Uri.http(dotenv.env["SERVER"]!, 'plant/rename/$plant/$newName');
    return http.put(
      url,
      headers: {
        'clientId': dotenv.env["CLIENT"]!,
        "Accept": "application/json",
        "content-type": "application/json"
      },
    );
  }

  Future openEditPlantRoom(BuildContext context, int potId) async {
    final TextEditingController newRoomController = TextEditingController();
    final List<Room> roomEntries = await getRooms();
    Room? selectedRoom;
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: const Color(0XFF5F725F),
        title: Text(
          "Change plant's room",
          textAlign: TextAlign.center,
          style: GoogleFonts.playfairDisplay(color: Colors.white),
        ),
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            DropdownMenu<Room>(
              inputDecorationTheme: const InputDecorationTheme(
                  filled: true, fillColor: Colors.white),
              width: 232,
              controller: newRoomController,
              enableFilter: true,
              hintText: 'Choose room',
              dropdownMenuEntries: roomEntries.map((Room room) {
                return DropdownMenuEntry<Room>(
                  value: room,
                  label: room.name,
                );
              }).toList(),
              onSelected: (Room? newRoom) {
                selectedRoom = newRoom;
              },
            ),
          ],
        ),
        actions: [
          TextButton(
            style: const ButtonStyle(
                backgroundColor:
                    MaterialStatePropertyAll<Color>(Color(0xFFA85032))),
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text(
              'CANCEL',
              textAlign: TextAlign.center,
              style: GoogleFonts.playfairDisplay(color: Colors.white),
            ),
          ),
          TextButton(
            style: const ButtonStyle(
                backgroundColor: MaterialStatePropertyAll<Color>(Colors.white)),
            onPressed: () async {
              http.Response response = await editPlantRoom(
                  potId, selectedRoom?.id); // load pots again
              debugPrint(response.statusCode.toString());
              Navigator.of(context).pop();
            },
            child: Text(
              'SAVE',
              textAlign: TextAlign.center,
              style: GoogleFonts.playfairDisplay(color: Colors.black),
            ),
          ),
        ],
      ),
    );
  }

  Future<http.Response> editPlantRoom(int plant, int? newRoom) {
    var url =
        Uri.http(dotenv.env["SERVER"]!, 'plant/change-room/$plant/$newRoom');
    return http.put(
      url,
      headers: {
        'clientId': dotenv.env["CLIENT"]!,
        "Accept": "application/json",
        "content-type": "application/json"
      },
    );
  }

  Future<List<Room>> getRooms() async {
    var url = Uri.http(dotenv.env["SERVER"]!, 'room/all');
    final response =
        await http.get(url, headers: {'clientId': dotenv.env["CLIENT"]!});
    final jsonData = json.decode(response.body);
    return List<Room>.from(
        jsonData.map((item) => Room(item["id"], item["name"])));
  }
}

class Room {
  int id;
  String name;
  Room(this.id, this.name);
}

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:plant_stein/room_details.dart';
import 'package:http/http.dart' as http;
import 'package:plant_stein/utils.dart';
import 'package:google_fonts/google_fonts.dart';

enum EditOptions { editRoomName, deleteRoom }

class RoomPage extends StatefulWidget {
  const RoomPage({super.key});

  @override
  State<RoomPage> createState() => _RoomPageState();
}

class _RoomPageState extends State<RoomPage> {
  List<Map<String, dynamic>> rooms = [];

  @override
  void initState() {
    super.initState();
    debugPrint("initState");
    // load rooms only once (when widget is created)
    loadRooms();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [const SizedBox(height: 30), ...getRoomRows()],
        ),
      ),
    );
  }

  Widget getRoomButton(int roomId, String roomName) {
    return InkWell(
      child: Card(
        color: const Color(0xFFA0AFA1),
        child: Stack(
          alignment: Alignment.topRight,
          children: [
            PopupMenuButton(
              onSelected: (EditOptions item) {
                if (item == EditOptions.editRoomName) {
                } else if (item == EditOptions.deleteRoom) {}
              },
              itemBuilder: (BuildContext context) =>
                  <PopupMenuEntry<EditOptions>>[
                const PopupMenuItem<EditOptions>(
                  value: EditOptions.editRoomName,
                  child: Text('Edit name'),
                ),
                const PopupMenuItem<EditOptions>(
                  value: EditOptions.deleteRoom,
                  child: Text('Delete room'),
                ),
              ],
            ),
            SizedBox(
              width: 150,
              height: 100,
              child: Center(
                child: Text(
                  roomName,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.playfairDisplay(
                    color: Colors.black,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      onTap: () {
        Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => RoomDetails(roomId, roomName)))
            .then((value) => loadRooms());
      },
    );
  }

  void loadRooms() async {
    debugPrint("loadRooms");
    var url = Uri.http(dotenv.env["SERVER"]!, 'room/all');
    final response =
        await http.get(url, headers: {'clientId': dotenv.env["CLIENT"]!});
    setState(() {
      rooms = (json.decode(response.body) as List)
          .map((e) => e as Map<String, dynamic>)
          .toList();
    });
  }

  List<Widget> getRoomRows() {
    debugPrint("getRoomRows");
    List<Widget> result = [];

    for (List<Map<String, dynamic>> twoRooms in splitIntoBatches(rooms, 2)) {
      List<Widget> row = [
        Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: twoRooms
              .map<Widget>((room) => getRoomButton(room["id"], room["name"]))
              .toList(),
        ),
        const SizedBox(
          height: 20,
        ),
      ];

      result.addAll(row);

      twoRooms = rooms.take(2).toList();
    }

    return result;
  }
}

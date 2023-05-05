import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:plant_stein/utils.dart';
import 'bottom_navigation.dart';
import 'pot_details.dart';
import 'package:http/http.dart' as http;

class RoomDetails extends StatefulWidget {
  final String room;
  const RoomDetails(this.room, {super.key});

  @override
  State<RoomDetails> createState() => _RoomDetailsState();
}

class _RoomDetailsState extends State<RoomDetails> {
  List<String> pots = [];

  @override
  void initState() {
    super.initState();
    debugPrint("initState");
    // load pots only once (when widget is created)
    loadPots(widget.room);
  }

  @override
  Widget build(BuildContext context) {
    debugPrint("build");

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        title: Image.asset(
          'images/logo.png',
          fit: BoxFit.contain,
          height: 70,
        ),
        iconTheme: const IconThemeData(color: Color(0xFF5F725F)),
        centerTitle: true,
        backgroundColor: const Color(0xFFEBEDEB),
      ),
      bottomNavigationBar: const BottomNavigation(),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 30),
            Text(
              widget.room,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: GoogleFonts.playfairDisplay(
                  color: Colors.black,
                  fontSize: 30,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 30),
            ...getUIRows()
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        backgroundColor: const Color(0xFF5F725F),
        label: const Text("Add Pot"),
        icon: const Icon(Icons.add),
      ),
    );
  }

  Widget getPotButton(String potName) {
    return IconButton(
      onPressed: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => PotDetails(potName)));
      },
      icon: Image.asset(
        'images/pot.png',
      ),
      iconSize: 120,
      padding: EdgeInsets.zero,
    );
  }

  Widget getPotTitle(String potName) {
    return Expanded(
      child: Text(
        potName,
        overflow: TextOverflow.ellipsis,
        textAlign: TextAlign.center,
        style: GoogleFonts.playfairDisplay(color: Colors.black),
      ),
    );
  }

  void loadPots(String room) async {
    debugPrint("loadPots");
    var url = Uri.http('192.168.50.238:8080', 'room/$room/plants');
    final response = await http
        .get(url, headers: {'clientId': 'TEST_DEVICE', 'roomName': room});
    final jsonData = json.decode(response.body);
    setState(() {
      pots = List<String>.from(jsonData.map((item) => item["nickname"]));
    });
  }

  List<Widget> getUIRows() {
    debugPrint("getUIRows");
    List<Widget> result = [];

    debugPrint(splitIntoBatches(pots, 3).toString());

    for (List<String> threePots in splitIntoBatches(pots, 3)) {
      List<Widget> row = [
        Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: threePots
              .map<Widget>((potName) => getPotButton(potName))
              .toList(),
        ),
        Image.asset('images/shelf.png'),
        Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children:
              threePots.map<Widget>((potName) => getPotTitle(potName)).toList(),
        ),
        const SizedBox(
          height: 20,
        ),
      ];

      result.addAll(row);

      threePots = pots.take(3).toList();
    }

    return result;
  }
}

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
  Widget build(BuildContext context) {
    getPots(widget.room);
    int potNumber = pots.length;
    pots.addAll(List.filled(9 - potNumber, ''));
    List<bool> visiblePots = List.filled(9, false);

    for (int i = 0; i < potNumber; i++) {
      visiblePots[i] = true;
    }

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
      body: Column(
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
                color: Colors.black, fontSize: 30, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 30),
          Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              potButton(pots[0], visiblePots[0]),
              potButton(pots[1], visiblePots[1]),
              potButton(pots[2], visiblePots[2]),
            ],
          ),
          Image.asset('images/shelf.png'),
          Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                width: 60,
              ),
              potTitle(pots[0], visiblePots[0]),
              const SizedBox(
                width: 60,
              ),
              potTitle(pots[1], visiblePots[1]),
              const SizedBox(
                width: 60,
              ),
              potTitle(pots[2], visiblePots[2]),
              const SizedBox(
                width: 60,
              )
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              potButton(pots[3], visiblePots[3]),
              potButton(pots[4], visiblePots[4]),
              potButton(pots[5], visiblePots[5]),
            ],
          ),
          Image.asset('images/shelf.png'),
          Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                width: 60,
              ),
              potTitle(pots[3], visiblePots[3]),
              const SizedBox(
                width: 60,
              ),
              potTitle(pots[4], visiblePots[4]),
              const SizedBox(
                width: 60,
              ),
              potTitle(pots[5], visiblePots[5]),
              const SizedBox(
                width: 60,
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              potButton(pots[6], visiblePots[6]),
              potButton(pots[7], visiblePots[7]),
              potButton(pots[8], visiblePots[8]),
            ],
          ),
          Image.asset('images/shelf.png'),
          Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                width: 60,
              ),
              potTitle(pots[6], visiblePots[6]),
              const SizedBox(
                width: 60,
              ),
              potTitle(pots[7], visiblePots[7]),
              const SizedBox(
                width: 60,
              ),
              potTitle(pots[8], visiblePots[8]),
              const SizedBox(
                width: 60,
              ),
            ],
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        backgroundColor: const Color(0xFF5F725F),
        label: const Text("Add Pot"),
        icon: const Icon(Icons.add),
      ),
    );
  }

  Visibility potButton(String potName, bool isVisible) {
    return Visibility(
        visible: isVisible,
        maintainState: true,
        maintainAnimation: true,
        maintainSize: true,
        child: IconButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => PotDetails(potName)));
          },
          icon: Image.asset(
            'images/pot.png',
          ),
          iconSize: 120,
          padding: EdgeInsets.zero,
        ));
  }

  Expanded potTitle(String potName, bool isVisible) {
    return Expanded(
        child: Visibility(
      visible: isVisible,
      maintainState: true,
      maintainAnimation: true,
      maintainSize: true,
      child: Text(
        potName,
        overflow: TextOverflow.ellipsis,
        textAlign: TextAlign.center,
        style: GoogleFonts.playfairDisplay(color: Colors.black),
      ),
    ));
  }

  void getPots(String room) async {
    var url = Uri.http('10.0.20.214:8080', 'room/{roomName}/plants');
    final response = await http
        .get(url, headers: {'clientId': 'TEST_DEVICE', 'roomName': room});
    final jsonData = json.decode(response.body);
    setState(() {
      pots = List<String>.from(jsonData.map((item) => item["nickname"]));
    });
  }
}

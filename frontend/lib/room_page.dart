import 'package:flutter/material.dart';
import 'package:plant_stein/room_details.dart';

class RoomPage extends StatelessWidget {
  const RoomPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: ElevatedButton(
          child: const Text('room1'),
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const RoomDetails("test room")));
          },
        ),
      ),
    );
  }
}

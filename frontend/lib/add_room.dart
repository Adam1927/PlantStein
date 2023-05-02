import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AddRoomPage extends StatelessWidget {
  const AddRoomPage({super.key});

  @override
  Widget build(BuildContext context) {
    addPlant() async {
      // localhost doesnt work on android,
      // as there localhost refers to the emulator
      var url = Uri.http('192.168.50.238:8080', 'room/add');
      var response = await http.post(url,
          headers: {'clientId': 'TEST_DEVICE'}, body: 'Kitchen');

      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');

      print(await http.read(Uri.http('192.168.50.238:8080', 'room/all'),
          headers: {'clientId': 'TEST_DEVICE'}));
    }

    return Container(
      child: MaterialButton(
        onPressed: addPlant,
        child: const Text("Add room"),
      ),
    );
  }
}

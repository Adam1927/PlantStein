import 'dart:convert';
import 'dart:math';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart';

List<String> rooms = const ["Kitchen", "Living Room", "Bedroom", "Bathroom"];
List<String> plantNames = const [
  "Planty",
  "Greenie",
  "Leafy",
  "Flower",
  "Ferny"
];

extension RandomListItem<T> on List<T> {
  T randomItem() {
    return this[Random().nextInt(length)];
  }
}

Future<bool> isDbEmpty() async {
  var url = Uri.http(dotenv.env["SERVER"]!, 'room/all');
  final response = await http.get(url, headers: {'clientId': 'TEST_DEVICE'});
  final jsonData = json.decode(response.body);
  return jsonData.length == 0;
}

getSpecies() async {
  var url = Uri.http(dotenv.env["SERVER"]!, 'species/all');
  final response = await http.get(url, headers: {'clientId': 'TEST_DEVICE'});
  final jsonData = json.decode(response.body);
  return List<String>.from(jsonData.map((item) => item["name"]));
}

void insertTestData() async {
  if (!await isDbEmpty()) return;

  List<String> species = await getSpecies();

  Random random = Random();

  for (String room in rooms) {
    await insertRoom(room);
  }

  for (String room in rooms) {
    for (int i = 0; i < random.nextInt(10) + 3; i++) {
      await insertPlant(plantNames.randomItem(), species.randomItem(),
          random.nextInt(rooms.length) + 1);
    }
  }
}

Future<Response> insertRoom(String roomName) {
  var url = Uri.http(dotenv.env["SERVER"]!, 'room/add');
  return http.post(url,
      headers: {
        'clientId': 'TEST_DEVICE',
        "Accept": "application/json",
        "content-type": "application/text"
      },
      body: roomName);
}

Future<Response> insertPlant(String name, String species, int room) {
  var url = Uri.http(dotenv.env["SERVER"]!, 'plant/add');
  return http.post(url,
      headers: {
        'clientId': 'TEST_DEVICE',
        "Accept": "application/json",
        "content-type": "application/json"
      },
      body: jsonEncode({"nickname": name, "species": species, "roomId": room}));
}

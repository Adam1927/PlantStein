import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:plant_stein/plant_catalogue.dart';
import 'package:plant_stein/settings.dart';
import 'insert_test_data.dart';
import 'room_page.dart';
import 'bottom_navigation.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    () async {
      await dotenv.load(fileName: ".env");

      if (kDebugMode) {
        insertTestData();
      }
    }();

    // If in debug mode then insert test data

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.green),
      home: const RootPage(),
    );
  }
}

class RootPage extends StatefulWidget {
  const RootPage({super.key});

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  int currentPage = 0;
  final screens = [
    Settings(),
    PlantCatalogue(),
    RoomPage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        toolbarHeight: 150,
        title: Image.asset(
          'images/logo.png',
          fit: BoxFit.contain,
          height: 70,
        ),
        centerTitle: true,
        backgroundColor: const Color(0xFFEBEDEB),
      ),
      body: PlantCatalogue(),
      backgroundColor: const Color(0xFFEBEDEB),
      bottomNavigationBar: const BottomNavigation(),
    );
  }
}

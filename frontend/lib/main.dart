import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'room_page.dart';
import 'bottom_navigation.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    loadDotEnv();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.green),
      home: const RootPage(),
    );
  }

  void loadDotEnv() async {
    await dotenv.load(fileName: ".env");
  }
}

class RootPage extends StatefulWidget {
  const RootPage({super.key});

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  int currentPage = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        title: Image.asset(
          'images/logo.png',
          fit: BoxFit.contain,
          height: 70,
        ),
        centerTitle: true,
        backgroundColor: const Color(0xFFEBEDEB),
      ),
      body: const RoomPage(),
      backgroundColor: const Color(0xFFEBEDEB),
      bottomNavigationBar: const BottomNavigation(),
    );
  }
}

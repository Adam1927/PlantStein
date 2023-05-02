import 'package:flutter/material.dart';
import 'package:plant_stein/add_room.dart';
import 'room_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
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
      body: const AddRoomPage(),
      backgroundColor: const Color(0xFFEBEDEB),
      bottomNavigationBar: NavigationBar(
        destinations: const [
          NavigationDestination(icon: Icon(Icons.settings), label: ''),
          NavigationDestination(icon: Icon(Icons.list), label: ''),
          NavigationDestination(icon: Icon(Icons.home), label: ''),
        ],
        onDestinationSelected: (int index) {
          setState(() {
            currentPage = index;
          });
        },
        selectedIndex: currentPage,
      ),
    );
  }
}

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:onboarding/onboarding.dart';
import 'package:plant_stein/plant_catalogue.dart';
import 'package:plant_stein/pot_details_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'insert_test_data.dart';
import 'onboarding.dart';
import 'room_page.dart';

int? initScreen;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  initScreen = await prefs.getInt("initScreen");
  await prefs.setInt("initScreen", 1);
  print('initScreen ${initScreen}');
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.green),
      initialRoute: initScreen == 0 || initScreen == null ? "first" : "/",
      routes: {
        '/': (context) => RootPage(
            ),
        "first": (context) => OnboardingPage(),
      },
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
    RoomPage(),
    PlantCatalogue(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          toolbarHeight: 100,
          title: Image.asset(
            'images/logo.png',
            fit: BoxFit.contain,
            height: 70,
          ),
          centerTitle: true,
          backgroundColor: const Color(0xFFEBEDEB),
        ),
        // body: const PotDetails(1)
        body: screens[currentPage],
        backgroundColor: const Color(0xFFEBEDEB),
        bottomNavigationBar: BottomNavigationBar(
          // currentIndex: currentPage,
          onTap: (index) => {
            setState(() {
              currentPage = index;
            })
          },

          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: ImageIcon(AssetImage('images/home.png'),
                  color: Color(0xFF5F725F)),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(AssetImage('images/catalogue.png'),
                  color: Color(0xFF5F725F)),
              label: '',
            ),
          ],
        ));
  ;}
}

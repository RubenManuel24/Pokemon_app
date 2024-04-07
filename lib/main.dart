import 'package:flutter/material.dart';
import 'package:pokemon_app/screens/main_frames_page.dart';

void main() => runApp(
      const MyApp(),
    );

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Pokemon Go",
      theme: ThemeData(
          fontFamily: "Montserrat",
          scaffoldBackgroundColor: Colors.white,
          iconTheme: const IconThemeData(color: Colors.white),
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.red,
            iconTheme: IconThemeData(color: Colors.white),
          ),
          bottomNavigationBarTheme: const BottomNavigationBarThemeData(
            backgroundColor: Colors.red,
            selectedItemColor: Colors.white,
            unselectedItemColor: Colors.black,
          )),
      home: const MainFramesPage(),
    );
  }
}
















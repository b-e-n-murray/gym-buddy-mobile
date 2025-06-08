import 'package:flutter/material.dart';
import 'package:gym_buddy_mobile/pages/home_page.dart';
import 'package:gym_buddy_mobile/main_scaffold.dart';
import 'package:gym_buddy_mobile/pages/new_workout_page.dart';
import 'package:gym_buddy_mobile/pages/workouts_page.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        appBarTheme: AppBarTheme(
          backgroundColor: Color.fromARGB(255, 17, 41, 61),
        ),
        textTheme: GoogleFonts.abelTextTheme(),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: const Color.fromARGB(255, 17, 41, 61),
          selectedItemColor: const Color.fromARGB(255, 77, 134, 231),
          selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
          unselectedItemColor: Colors.white,
          selectedIconTheme: IconThemeData(
              color: const Color.fromARGB(255, 75, 160, 230), size: 33),
          unselectedIconTheme: IconThemeData(color: Colors.white, size: 30),
        ),
        inputDecorationTheme: InputDecorationTheme(
            border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(8)))),
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: const Color.fromARGB(255, 77, 134, 231),
          iconSize: 30,
        ),
      ),
      home: MainScaffold(),
      routes: {
        '/workouts': (context) => WorkoutsPage(),
        '/new-indirect': (context) => MainScaffold(pageIndex: 2),
        '/new': (context) => NewWorkoutPage(),
        '/settings': (context) => HomePage(),
      },
    );
  }
}

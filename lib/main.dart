import 'package:flutter/material.dart';
import 'package:gym_buddy_mobile/pages/home_page.dart';
import 'package:gym_buddy_mobile/main_scaffold.dart';
import 'package:gym_buddy_mobile/pages/workouts_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Gym Buddy',
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: MainScaffold(),
      routes: {
        '/workouts': (context) => WorkoutsPage(),
        '/settings': (context) => HomePage()
      },
    );
  }
}

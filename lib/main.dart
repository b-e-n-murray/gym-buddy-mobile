import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gym_buddy_mobile/pages/home_page.dart';
import 'package:gym_buddy_mobile/main_scaffold.dart';
import 'package:gym_buddy_mobile/pages/new_workout_page.dart';
import 'package:gym_buddy_mobile/pages/workouts_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // Define a shared color palette for consistency
  static const Color _primaryDark = Color(0xFF11293D);
  static const Color _accentBlue = Color(0xFF4D86E7);
  static const Color _textOnDark = Colors.white;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: Color(0xFFF9FAFB),
        colorScheme: ColorScheme.fromSeed(
          seedColor: _accentBlue,
          primary: _accentBlue,
          secondary: _accentBlue.withValues(alpha: 0.85),
          surface: Colors.white,
          onPrimary: Colors.white,
          onSecondary: Colors.white,
          onSurface: Colors.black87,
        ),
        textTheme: GoogleFonts.abelTextTheme().copyWith(
          headlineLarge: GoogleFonts.anton(
            fontSize: 32,
            fontWeight: FontWeight.bold,
            color: _primaryDark,
            letterSpacing: 1.2,
          ),
          headlineMedium: GoogleFonts.abel(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: _primaryDark,
          ),
          bodyMedium: GoogleFonts.abel(
            fontSize: 16,
            color: Colors.black87,
          ),
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: _primaryDark,
          elevation: 0,
          iconTheme: IconThemeData(color: _textOnDark),
          titleTextStyle: TextStyle(
            color: _textOnDark,
            fontSize: 22,
            fontWeight: FontWeight.w700,
          ),
        ),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: _primaryDark,
          selectedItemColor: Color.fromARGB(255, 105, 178, 221),
          unselectedItemColor: Colors.white70,
          selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
          selectedIconTheme:
              IconThemeData(color: Color.fromARGB(255, 94, 185, 238), size: 30),
          unselectedIconTheme: IconThemeData(color: Colors.white70, size: 28),
          showUnselectedLabels: true,
        ),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: _accentBlue,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(14)),
          ),
          elevation: 4,
          iconSize: 30,
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: Colors.white,
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: _accentBlue, width: 1),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.grey.shade300, width: 1),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: _accentBlue, width: 1.8),
          ),
          labelStyle: const TextStyle(color: Colors.black54),
        ),
        cardTheme: CardTheme(
          elevation: 3,
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          shadowColor: Colors.black.withValues(alpha: 0.1),
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

import 'package:flutter/material.dart';
import 'package:gym_buddy_mobile/pages/home_page.dart';
import 'package:gym_buddy_mobile/pages/settings_page.dart';
import 'package:gym_buddy_mobile/pages/workouts_page.dart';

class MainScaffold extends StatefulWidget {
  @override
  State<MainScaffold> createState() => _MainScaffoldState();
}

class _MainScaffoldState extends State<MainScaffold> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    HomePage(),
    WorkoutsPage(),
    SettingsPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'Gym Buddy',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ),
      body: IndexedStack(
        index: _selectedIndex,
        children: _pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: _onItemTapped,
        currentIndex: _selectedIndex,
        items: [
          BottomNavigationBarItem(
              key: Key('home'),
              icon: Icon(
                Icons.home,
              ),
              label: "Home"),
          BottomNavigationBarItem(
              key: Key('workouts'),
              icon: Icon(
                Icons.sports_gymnastics_rounded,
              ),
              label: "Workouts"),
          BottomNavigationBarItem(
              key: Key('settings'),
              icon: Icon(
                Icons.settings,
              ),
              label: "Settings"),
        ],
      ),
    );
  }
}

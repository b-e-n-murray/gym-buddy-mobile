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
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 17, 41, 61),
                Color.fromARGB(255, 43, 104, 153)
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        title: Center(
          child: Text(
            'Gym Buddy',
            style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontFamily: ''),
          ),
        ),
        // actions: [
        //   Padding(
        //     padding: const EdgeInsets.only(right: 16.0),
        //     child: ElevatedButton(
        //       onPressed: () {},
        //       style: ElevatedButton.styleFrom(
        //         backgroundColor: Colors.white,
        //         foregroundColor: Colors.blueGrey,
        //         shape: RoundedRectangleBorder(
        //           borderRadius: BorderRadius.circular(20),
        //         ),
        //       ),
        //       child: Text('Login'),
        //     ),
        //   )
        // ],
      ),
      body: IndexedStack(
        index: _selectedIndex,
        children: _pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: _onItemTapped,
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blueAccent,
        backgroundColor: const Color.fromARGB(255, 17, 41, 61),
        unselectedItemColor: Colors.white,
        items: [
          BottomNavigationBarItem(
              key: Key('home'),
              activeIcon: Icon(
                Icons.home,
                size: 33,
                color: const Color.fromARGB(255, 74, 180, 233),
              ),
              icon: Icon(
                Icons.home,
                size: 30,
                color: Colors.blueGrey,
              ),
              label: "Home"),
          BottomNavigationBarItem(
              key: Key('workouts'),
              activeIcon: Icon(
                Icons.sports_gymnastics_rounded,
                size: 35,
                color: const Color.fromARGB(255, 74, 180, 233),
              ),
              icon: Icon(
                Icons.sports_gymnastics_rounded,
                size: 30,
                color: Colors.blueGrey,
              ),
              label: "Workouts"),
          BottomNavigationBarItem(
              key: Key('settings'),
              activeIcon: Icon(
                Icons.settings,
                size: 35,
                color: const Color.fromARGB(255, 74, 180, 233),
              ),
              icon: Icon(
                Icons.settings,
                size: 30,
                color: Colors.blueGrey,
              ),
              label: "Settings"),
        ],
      ),
    );
  }
}

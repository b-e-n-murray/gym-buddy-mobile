import 'package:flutter/material.dart';
import 'package:gym_buddy_mobile/pages/home_page.dart';
import 'package:gym_buddy_mobile/pages/new_workout_page.dart';
import 'package:gym_buddy_mobile/pages/settings_page.dart';
import 'package:gym_buddy_mobile/pages/workouts_page.dart';

class MainScaffold extends StatefulWidget {
  MainScaffold({this.pageIndex = 0});
  final int pageIndex;

  @override
  State<MainScaffold> createState() => _MainScaffoldState();
}

class _MainScaffoldState extends State<MainScaffold> {
  late int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.pageIndex;
  }

  final List<Widget> _pages = [
    HomePage(),
    WorkoutsPage(),
    NewWorkoutPage(),
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
          child: SizedBox(
              height: 180,
              width: 230,
              child: Image.asset('assets/app_title.png')),
        ),
      ),
      body: IndexedStack(
        index: _selectedIndex,
        children: _pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
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
                Icons.fitness_center_sharp,
              ),
              label: "Workouts"),
          BottomNavigationBarItem(
              key: Key('new'),
              icon: Icon(
                Icons.add,
              ),
              label: "New"),
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

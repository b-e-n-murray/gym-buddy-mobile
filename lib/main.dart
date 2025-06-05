import 'package:flutter/material.dart';
import 'package:gym_buddy_mobile/workout_tile.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MaterialApp(
    home: MyHomePage(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MyAppState(),
      child: MaterialApp(
        title: 'Gym Buddy',
        theme: ThemeData(
          useMaterial3: true,
        ),
        home: MyHomePage(),
      ),
    );
  }
}

class MyAppState extends ChangeNotifier {}

class MyHomePage extends StatelessWidget {
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
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Icon(Icons.fitness_center,
              size: 30, color: const Color.fromARGB(218, 255, 255, 255)),
        ),
        title: Text(
          'Gym Buddy',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: Colors.blueGrey,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: Text('Login'),
            ),
          )
        ],
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Welcome back, Ben',
              style: TextStyle(
                  fontFamily: 'Calibri',
                  fontSize: 30,
                  fontWeight: FontWeight.bold),
            ),
          ),
          // Loop over workouts:
          WorkoutTile(
            workoutName: 'Push Day',
            previewExercises: ['Bench Press', 'Tricep dips'],
            targetMuscles: ['Chest', 'Shoulders', 'Triceps'],
            imageLink:
                'https://cdn.shopify.com/s/files/1/1127/3530/files/bench-mistakes-01.png?v=1492845884',
            isFavourite: true,
          ),
          WorkoutTile(
            workoutName: 'Leg Day',
            previewExercises: ['Leg Press', 'Barbell squat'],
            targetMuscles: ['Quads', 'Hamstrings', 'Calves'],
            isFavourite: false,
            imageLink:
                'https://th.bing.com/th/id/R.327180e0cc8f55f4ddbacc67fa88092f?rik=Lqu17KIV%2fGrKaw&riu=http%3a%2f%2fwww.dmoose.com%2fcdn%2fshop%2farticles%2fbarbell_squat.jpg%3fv%3d1653488200&ehk=%2f8GyzR85OjUd%2fBOcCHTFQJJ%2bAO%2bsQb%2bAhzFVIGKI1rI%3d&risl=&pid=ImgRaw&r=0',
          )
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        selectedItemColor: Colors.blueAccent,
        backgroundColor: const Color.fromARGB(255, 17, 41, 61),
        unselectedItemColor: Colors.white,
        elevation: 100,
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                size: 30,
                color: Colors.blueGrey,
              ),
              label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.sports_gymnastics_rounded,
                size: 30,
                color: Colors.blueGrey,
              ),
              label: "Workouts"),
          BottomNavigationBarItem(
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

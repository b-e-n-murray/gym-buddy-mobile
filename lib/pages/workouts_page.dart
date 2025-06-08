import 'package:flutter/material.dart';
import 'package:gym_buddy_mobile/workout_tile.dart';

class Workout {
  final String name;
  final List<String> previewExercises;
  final List<String> targetMuscles;
  final String? imageLink;
  bool isFavourite;
  bool isSelected;

  Workout(
    this.name,
    this.previewExercises,
    this.targetMuscles,
    this.imageLink,
    this.isFavourite,
    this.isSelected,
  );
}

class WorkoutsPage extends StatefulWidget {
  const WorkoutsPage({
    super.key,
  });

  @override
  State<WorkoutsPage> createState() => _WorkoutsPageState();
}

class _WorkoutsPageState extends State<WorkoutsPage> {
  String selectedWorkout =
      ''; // Will eventually need to persist this between page loads.

  final List<Workout> tempWorkouts = [
    Workout(
        'Push Day',
        ['Bench Press', 'Tricep dips'],
        ['Chest', 'Shoulders', 'Triceps'],
        'https://cdn.shopify.com/s/files/1/1127/3530/files/bench-mistakes-01.png?v=1492845884',
        true,
        false),
    Workout(
      'Leg Day',
      ['Leg Press', 'Barbell squat'],
      ['Quads', 'Hamstrings', 'Calves'],
      'https://th.bing.com/th/id/R.327180e0cc8f55f4ddbacc67fa88092f?rik=Lqu17KIV%2fGrKaw&riu=http%3a%2f%2fwww.dmoose.com%2fcdn%2fshop%2farticles%2fbarbell_squat.jpg%3fv%3d1653488200&ehk=%2f8GyzR85OjUd%2fBOcCHTFQJJ%2bAO%2bsQb%2bAhzFVIGKI1rI%3d&risl=&pid=ImgRaw&r=0',
      true,
      false,
    )
  ];

  void _openWorkoutOverview(Workout workout) {
    if (workout.isSelected) {
      // Exception('')
      print(
          'WARNING: Unexpected request: ${workout.name} is already selected - aborting');
      return;
    }
    print('opening workout overview for ${workout.name}...');

    if (workout.name == selectedWorkout) {
      // Exception('');
      print(
          'WARNING: Attempted to select workout when one is already selected - aborting');
      return;
    }

    setState(() {
      workout.isSelected = true;
      selectedWorkout = workout.name;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            Container(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Your Workouts',
                style: TextStyle(
                    fontFamily: 'Calibri',
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
              ),
            ),
            for (var workout in tempWorkouts)
              GestureDetector(
                onTap: () => _openWorkoutOverview(workout),
                child: WorkoutTile(
                  workoutName: workout.name,
                  previewExercises: workout.previewExercises,
                  targetMuscles: workout.targetMuscles,
                  imageLink: workout.imageLink,
                  isFavourite: workout.isFavourite,
                ),
              ),
          ],
        ),
        Positioned(
          bottom: 25,
          right: 25,
          child: FloatingActionButton(
            onPressed: () =>
                {Navigator.pushReplacementNamed(context, '/new-indirect')},
            child: Icon(
              Icons.add,
              color: Colors.white,
            ),
          ),
        )
      ],
    );
  }
}

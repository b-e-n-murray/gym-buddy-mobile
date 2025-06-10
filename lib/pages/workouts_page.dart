import 'package:flutter/material.dart';
import 'package:gym_buddy_mobile/expanded_workout_tile.dart';
import 'package:gym_buddy_mobile/types/workout.dart';
import 'package:gym_buddy_mobile/workout_tile.dart';

class WorkoutsPage extends StatefulWidget {
  const WorkoutsPage({
    super.key,
  });

  @override
  State<WorkoutsPage> createState() => _WorkoutsPageState();
}

class _WorkoutsPageState extends State<WorkoutsPage> {
  // Will eventually need to persist this between page loads.
  Workout? selectedWorkout;

  final List<Workout> tempWorkouts = [
    Workout(
      'Push Day',
      ['Bench Press', 'Tricep dips'],
      ['Chest', 'Shoulders', 'Triceps'],
      'https://cdn.shopify.com/s/files/1/1127/3530/files/bench-mistakes-01.png?v=1492845884',
      true,
    ),
    Workout(
      'Leg Day',
      ['Leg Press', 'Barbell squat'],
      ['Quads', 'Hamstrings', 'Calves'],
      'https://th.bing.com/th/id/R.327180e0cc8f55f4ddbacc67fa88092f?rik=Lqu17KIV%2fGrKaw&riu=http%3a%2f%2fwww.dmoose.com%2fcdn%2fshop%2farticles%2fbarbell_squat.jpg%3fv%3d1653488200&ehk=%2f8GyzR85OjUd%2fBOcCHTFQJJ%2bAO%2bsQb%2bAhzFVIGKI1rI%3d&risl=&pid=ImgRaw&r=0',
      true,
    )
  ];

  void _openWorkoutOverview(Workout workout) {
    if (selectedWorkout != null) {
      // Exception('');
      print(
          'WARNING: Attempted to select workout when one is already selected - aborting');
      return;
    }

    if (selectedWorkout == workout) {
      // Exception('')
      print(
          'WARNING: Unexpected request: ${workout.name} is already selected - aborting');
      return;
    }
    print('opening workout overview for ${workout.name}...');

    setState(() {
      selectedWorkout = workout;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (selectedWorkout == null) {
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
                    workout: Workout(
                      workout.name,
                      workout.previewExercises,
                      workout.targetMuscles,
                      workout.imageLink,
                      workout.isFavourite,
                    ),
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
    } else {
      return Stack(
        children: [
          ExpandedWorkoutTile(workout: selectedWorkout!),
          Positioned(
              top: 10,
              left: 10,
              child: ElevatedButton(
                  // TODO: Enable haptic feedback
                  onPressed: () => {
                        setState(() {
                          selectedWorkout = null;
                        })
                      },
                  child: Icon(Icons.arrow_back))),
        ],
      );
    }
  }
}

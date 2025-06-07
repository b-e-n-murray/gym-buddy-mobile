import 'package:flutter/material.dart';
import 'package:gym_buddy_mobile/workout_tile.dart';

class WorkoutsPage extends StatelessWidget {
  const WorkoutsPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
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
    );
  }
}

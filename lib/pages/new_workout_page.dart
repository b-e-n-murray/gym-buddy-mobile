import 'package:flutter/material.dart';
import 'package:gym_buddy_mobile/types/workout.dart';

class NewWorkoutPage extends StatefulWidget {
  const NewWorkoutPage({super.key});

  @override
  State<NewWorkoutPage> createState() => _NewWorkoutPageState();
}

class _NewWorkoutPageState extends State<NewWorkoutPage> {
  final List<Workout> suggestedWorkouts = [];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Row(children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'New Workout',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
            ),
            FloatingActionButton(
              onPressed: () => {},
              child: Icon(Icons.add),
            ),
          ]),
        ),

        // 1. Exercise selection should redirect to Exercise Catalog.
        // This will be a separate tab that can be viewed outside of workout creator, but when
        // navigated to via exercise selection button, an argument will be passed that will open the same view but in 'creatorMode'.
        // When this mode is active, exercises will be selectable, and a counter displayed on-screen. Exerise ids will be collected
        // which will inform the exercise creation form of which exercises have been selected. This will be used to display selected
        // exercises back to the user prior to form submission, and then ultimately passed to backend for persistence.

        // Exercise catalog will make use of getAllExercises request - this will need to be cleaned in backend before accessing here,
        // only keeping relevant client-side data.

        // 2. Further form fields will include an image upload that represents the workout. Default will need to be used if no photo submitted.

        // 3. Comments that will be displayed in workout summary view.

        // Eventually, this will be improved with the implementation of a workout creation journey, where users will step through
        // a processed creation, instead of filling out a form.

        // Later implementation will feature workout generator, which will ask for target muscles, equipment etc.
        // Gathered info will filter through all exercises on backend, only returning those that meet criteria.
        // Users will then be asked to choose exercises from the filtered list.
      ],
    );
  }
}

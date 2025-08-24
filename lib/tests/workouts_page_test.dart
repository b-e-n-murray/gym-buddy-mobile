import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gym_buddy_mobile/expanded_workout_tile.dart';

import 'package:gym_buddy_mobile/main.dart';
import 'package:gym_buddy_mobile/main_scaffold.dart';
import 'package:gym_buddy_mobile/pages/workouts_page.dart';
import 'package:gym_buddy_mobile/workout_tile.dart';

// TODO: Test completes listed steps but fails due to overflow - next task needs to be conditional rendering.
void main() {
  testWidgets('Workout tile expands when tapped', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    await tester.tap(find.byIcon(Icons.fitness_center_sharp));
    await tester.pumpAndSettle();

    expect(find.widgetWithText(WorkoutTile, 'Push Day'), findsOne);
    // expect(
    //     find.byWidget(WorkoutTile(
    //         workout: Workout(
    //       'Push Day',
    //       ['Bench Press', 'Tricep dips'],
    //       ['Chest', 'Shoulders', 'Triceps'],
    //       'https://cdn.shopify.com/s/files/1/1127/3530/files/bench-mistakes-01.png?v=1492845884',
    //       true,
    //     ))),
    //     findsOne);

    await tester.tap(find.widgetWithText(WorkoutTile, 'Push Day'));
    await tester.pumpAndSettle();

    expect(find.widgetWithText(WorkoutTile, 'Push Day'), findsNothing);
    expect(find.widgetWithText(ExpandedWorkoutTile, 'Push Day'), findsOne);
  });
}

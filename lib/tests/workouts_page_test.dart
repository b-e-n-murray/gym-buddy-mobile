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

    await tester.tap(find.byIcon(Icons.fitness_center_rounded));
    await tester.pumpAndSettle();

    final Finder pushTileFinder = find.widgetWithText(WorkoutTile, 'Push Day');
    expect(pushTileFinder, findsOne);
    await tester.tap(pushTileFinder);
    await tester.pumpAndSettle();

    expect(pushTileFinder, findsNothing);
    expect(find.widgetWithText(ExpandedWorkoutTile, 'Push Day'), findsOne);
  });
}

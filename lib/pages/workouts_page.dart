import 'package:flutter/material.dart';
import 'package:gym_buddy_mobile/expanded_workout_tile.dart';
import 'package:gym_buddy_mobile/types/workout.dart';
import 'package:gym_buddy_mobile/workout_tile.dart';

class WorkoutsPage extends StatefulWidget {
  const WorkoutsPage({super.key});

  @override
  State<WorkoutsPage> createState() => _WorkoutsPageState();
}

class _WorkoutsPageState extends State<WorkoutsPage> {
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
      '',
      true,
    )
  ];

  void _openWorkoutOverview(Workout workout) {
    if (selectedWorkout != null) return;

    setState(() {
      selectedWorkout = workout;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (selectedWorkout != null) {
      return Stack(
        children: [
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            child: ExpandedWorkoutTile(workout: selectedWorkout!),
          ),
          Positioned(
            top: 40,
            left: 16,
            child: FloatingActionButton.small(
              backgroundColor: Colors.white,
              foregroundColor: Colors.black87,
              elevation: 4,
              shape: const CircleBorder(),
              onPressed: () {
                setState(() {
                  selectedWorkout = null;
                });
              },
              child: const Icon(Icons.arrow_back),
            ),
          ),
        ],
      );
    }

    return Scaffold(
      backgroundColor: const Color(0xFFF8F8FB),
      floatingActionButton: FloatingActionButton(
        onPressed: () =>
            Navigator.pushReplacementNamed(context, '/new-indirect'),
        elevation: 6,
        backgroundColor: Colors.blueAccent,
        shape: const CircleBorder(),
        child: const Icon(Icons.add, color: Colors.white, size: 28),
      ),
      body: CustomScrollView(
        slivers: [
          // Header
          SliverAppBar(
            pinned: true,
            expandedHeight: 100,
            backgroundColor: Colors.white,
            elevation: 0.5,
            flexibleSpace: FlexibleSpaceBar(
              titlePadding: const EdgeInsets.only(left: 20, bottom: 14),
              title: const Text(
                'Your Workouts',
                style: TextStyle(
                  color: Colors.black87,
                  fontSize: 26,
                  fontWeight: FontWeight.w700,
                  letterSpacing: -0.5,
                ),
              ),
            ),
          ),

          // Workouts List
          SliverPadding(
            padding: const EdgeInsets.only(bottom: 100),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  final workout = tempWorkouts[index];
                  return GestureDetector(
                    onTap: () => _openWorkoutOverview(workout),
                    child: AnimatedPadding(
                      duration: const Duration(milliseconds: 150),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 8),
                      child: Hero(
                        tag: workout.name,
                        child: WorkoutTile(workout: workout),
                      ),
                    ),
                  );
                },
                childCount: tempWorkouts.length,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:gym_buddy_mobile/types/exercise.dart';
import 'package:http/http.dart' as http;

class GetAllExercisesResponse {
  final Map<String, dynamic> data;

  GetAllExercisesResponse({required this.data});
}

class ExerciseCatalog extends StatefulWidget {
  const ExerciseCatalog({super.key});

  @override
  State<ExerciseCatalog> createState() => _ExerciseCatalogState();

  Future<Exercises> getAllExercises() async {
    final http.Response response = await http
        .get(Uri.parse('https://exercisedb-api.vercel.app/api/v1/exercises'));

    if (response.statusCode == 200) {
      final GetAllExercisesResponse body = GetAllExercisesResponse(
          data: jsonDecode(response.body) as Map<String, dynamic>);
      return Exercises.fromJson(body.data['data'] as List<dynamic>);
    } else {
      throw Exception('Failed to load exercises');
    }
  }
}

class _ExerciseCatalogState extends State<ExerciseCatalog> {
  late Future<Exercises> _exercisesFuture;
  @override
  void initState() {
    super.initState();
    _exercisesFuture = widget.getAllExercises();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Exercises>(
      future: _exercisesFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (snapshot.hasData) {
          final exercises = snapshot.data!;
          return ListView.builder(
            itemCount: exercises.exercises.length,
            itemBuilder: (context, index) {
              final exercise = exercises.exercises[index];
              return ListTile(
                title: Text(exercise.name),
                subtitle: Text('${exercise.name} - ${exercise.instructions}'),
              );
            },
          );
        } else {
          return const Center(child: Text('No exercises found.'));
        }
      },
    );
  }
}

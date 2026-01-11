class Exercise {
  final String exerciseId;
  final String name;
  final String gifUrl;
  final List<String> instructions;
  final List<String> targetMuscles;
  final List<String> equipments;
  bool favourite;

  Exercise(
    this.exerciseId,
    this.name,
    this.gifUrl,
    this.instructions,
    this.targetMuscles,
    this.equipments,
    this.favourite,
  );

  factory Exercise.fromJson(Map<String, dynamic> json) {
    return Exercise(
      json['exerciseId'] as String,
      json['name'] as String,
      json['gifUrl'] as String,
      List<String>.from(json['instructions'] as List<dynamic>),
      List<String>.from(json['targetMuscles'] as List<dynamic>),
      List<String>.from(json['equipments'] as List<dynamic>),
      false,
    );
  }
}

class Exercises {
  final List<Exercise> exercises;

  Exercises(this.exercises);

  factory Exercises.fromJson(List<dynamic> json) {
    return Exercises(
      json.map((e) => Exercise.fromJson(e as Map<String, dynamic>)).toList(),
    );
  }
}

class Workout {
  final String name;
  final List<String> previewExercises;
  final List<String> targetMuscles;
  final String? imageLink;
  bool isFavourite;

  Workout(
    this.name,
    this.previewExercises,
    this.targetMuscles,
    this.imageLink,
    this.isFavourite,
  );
}

class LogItem {
  final int categoryId;
  final String categoryName;
  final int workoutId;
  final String workoutName;
  double weight;
  int reps;
  String description;
  final DateTime date;
  String customWorkoutName;
  bool isCustomWorkout;

  LogItem(
      {this.categoryId,
      this.categoryName,
      this.workoutId,
      this.workoutName,
      this.weight,
      this.reps,
      this.description,
      this.date,
      this.customWorkoutName,
      this.isCustomWorkout});
}

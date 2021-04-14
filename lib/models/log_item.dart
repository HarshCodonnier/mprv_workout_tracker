class LogItem {
  final String categoryId;
  final String categoryName;
  final String workoutId;
  final String workoutName;
  final double weight;
  final int reps;
  final String description;
  final DateTime date;

  LogItem(
      {this.categoryId,
      this.categoryName,
      this.workoutId,
      this.workoutName,
      this.weight,
      this.reps,
      this.description,
      this.date});
}

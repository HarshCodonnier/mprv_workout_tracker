class WorkoutItem {
  final Map<int, List<Workout>> workout;

  const WorkoutItem({this.workout});
}

class Workout {
  final int workoutId;
  final String workoutName;

  const Workout({this.workoutId, this.workoutName});
}

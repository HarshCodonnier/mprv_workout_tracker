import 'package:mprv_workout_tracker/model/workout_item.dart';

List<WorkoutItem> DUMMY_WORKOUT = [
  WorkoutItem(
      categoryId: "c1",
      categoryName: "Chest",
      workoutId: "w1",
      workoutName: "Dumbbell bench press",
      weight: 10,
      reps: 3,
      description:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam blandit leo at justo iaculis, eget pretium orci sollicitudin. Phasellus non dolor nec ligula gravida vestibulum. Phasellus varius dolor in purus pellentesque tempor. Integer massa libero, vestibulum non eleifend ut, egestas at ligula. Donec tempus mauris eget est scelerisque condimentum.",
      date: DateTime.now()),
  WorkoutItem(
      categoryId: "c2",
      categoryName: "Chest",
      workoutId: "w2",
      workoutName: "Dumbbell flys",
      weight: 5,
      reps: 5,
      description:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam blandit leo at justo iaculis, eget pretium orci sollicitudin. Phasellus non dolor nec ligula gravida vestibulum. Phasellus varius dolor in purus pellentesque tempor. Integer massa libero, vestibulum non eleifend ut, egestas at ligula. Donec tempus mauris eget est scelerisque condimentum.",
      date: DateTime.now()),
  WorkoutItem(
      categoryId: "c3",
      categoryName: "Chest",
      workoutId: "w3",
      workoutName: "Push Ups",
      weight: 0.0,
      reps: 0,
      description: "",
      date: DateTime.now()),
  WorkoutItem(
      categoryId: "c4",
      categoryName: "Arms",
      workoutId: "w4",
      workoutName: "Dumbbell bicep curl",
      weight: 10,
      reps: 5,
      description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
      date: DateTime.now()),
  WorkoutItem(
      categoryId: "c5",
      categoryName: "Arms",
      workoutId: "w5",
      workoutName: "Hammer curl",
      weight: 2.5,
      reps: 5,
      description:
          "Phasellus non dolor nec ligula gravida vestibulum. Phasellus varius dolor in purus pellentesque tempor. Integer massa libero, vestibulum non eleifend ut, egestas at ligula. Donec tempus mauris eget est scelerisque condimentum.",
      date: DateTime.now()),
];

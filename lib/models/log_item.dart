// class LogItem {
//   int id;
//   final int categoryId;
//   String categoryName;
//   final int workoutId;
//   String workoutName;
//   double weight;
//   int reps;
//   String description;
//   DateTime date;
//   String customWorkoutName;
//   bool isCustomWorkout;
//
//   LogItem(
//       {this.id,
//       this.categoryId,
//       this.categoryName,
//       this.workoutId,
//       this.workoutName,
//       this.weight,
//       this.reps,
//       this.description,
//       this.date,
//       this.customWorkoutName,
//       this.isCustomWorkout});
//
//   LogItem.addEditLog(this.categoryId, this.workoutId, this.weight, this.reps,
//       this.description, this.customWorkoutName, this.isCustomWorkout);
// }

// To parse this JSON data, do
//
//     final logItem = logItemFromJson(jsonString);

import 'dart:convert';

LogItem logItemFromJson(String str) => LogItem.fromJson(json.decode(str));

String logItemToJson(LogItem data) => json.encode(data.toJson());

class LogItem {
  LogItem({
    this.addWorkoutId,
    this.userToken,
    this.categoryId,
    this.workoutId,
    this.weight,
    this.reps,
    this.workoutDesc,
    this.isCustom,
    this.customWorkoutName,
    this.categoryName,
    this.workoutName,
    this.workoutDate,
  });

  LogItem.addEditLog(this.categoryId, this.workoutId, this.weight, this.reps,
      this.workoutDesc, this.customWorkoutName, this.isCustom);

  int addWorkoutId;
  String userToken;
  int categoryId;
  int workoutId;
  double weight;
  int reps;
  String workoutDesc;
  int isCustom;
  String customWorkoutName;
  String categoryName;
  String workoutName;
  DateTime workoutDate;

  factory LogItem.fromJson(Map<String, dynamic> json) => LogItem(
        addWorkoutId: json["add_workout_id"],
        userToken: json["user_token"],
        categoryId: json["category_id"],
        workoutId: json["workout_id"],
        weight: double.parse(json["weight"].toString()),
        reps: json["reps"],
        workoutDesc: json["workout_desc"],
        isCustom: json["is_custom"],
        customWorkoutName: json["custom_workout_name"],
        categoryName:
            json["category_name"] == null ? "" : json["category_name"],
        workoutName: json["workout_name"] == null ? "" : json["workout_name"],
        workoutDate: DateTime.parse(json["workout_date"]),
      );

  Map<String, dynamic> toJson() => {
        "add_workout_id": addWorkoutId,
        "user_token": userToken,
        "category_id": categoryId,
        "workout_id": workoutId,
        "weight": weight,
        "reps": reps,
        "workout_desc": workoutDesc,
        "is_custom": isCustom,
        "custom_workout_name": customWorkoutName,
        "category_name": categoryName,
        "workout_name": workoutName,
        "workout_date": workoutDate.toIso8601String(),
      };
}

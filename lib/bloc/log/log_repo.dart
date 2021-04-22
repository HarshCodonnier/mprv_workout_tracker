import 'dart:async';

import '../../extras/extras.dart';
import '../../models/models.dart';

class LogRepo {
  Future<Map<String, dynamic>> addEditLog(
      List<LogItem> logs, bool isEdit) async {
    List<Map<String, dynamic>> logRequest = [];
    for (int i = 0; i < logs.length; i++) {
      LogItem item = logs[i];
      var log = {
        if (isEdit) "add_workout_id": item.addWorkoutId,
        "category_id": item.categoryId.toString(),
        "workout_id": item.workoutId.toString(),
        "weight": item.weight.toString(),
        "reps": item.reps.toString(),
        "is_custom": item.isCustom == 1 ? 1.toString() : 0.toString(),
        "workout_desc": item.workoutDesc,
        "custom_workout_name": item.customWorkoutName
      };
      logRequest.add(log);
    }
    ;
    final Map<String, dynamic> requestData = {"workout_details": logRequest};

    var queryParameters = {
      RequestParam.service:
          isEdit ? MethodNames.editExercise : MethodNames.addExerciseLogs,
    };
    String queryString = Uri(queryParameters: queryParameters).query;
    String requestUrl = AppUrls.BASE_URL + queryString;

    return await BaseApiHelper.postRequest(requestUrl, requestData);
  }

  Future<Map<String, dynamic>> deleteLog(int logId) async {
    final Map<String, dynamic> requestData = {"add_workout_id": logId};

    var queryParameters = {
      RequestParam.service: MethodNames.deleteExercise,
    };
    String queryString = Uri(queryParameters: queryParameters).query;
    String requestUrl = AppUrls.BASE_URL + queryString;

    return await BaseApiHelper.postRequest(requestUrl, requestData);
  }

  Future<Map<String, dynamic>> getAllLogs() async {
    final Map<String, dynamic> requestData = {"page": 1, "limit": 50};

    var queryParameters = {
      RequestParam.service: MethodNames.getAllExerciseList,
    };
    String queryString = Uri(queryParameters: queryParameters).query;
    String requestUrl = AppUrls.BASE_URL + queryString;

    return await BaseApiHelper.postRequest(requestUrl, requestData);
  }
}

import 'dart:async';
import 'dart:convert';

import '../../extras/extras.dart';

class StartupRepo {
  Future<Map<String, dynamic>> userRegister(
      String firstName, String lastName, String email, String password) async {
    final Map<String, dynamic> requestData = {
      "first_name": firstName,
      "last_name": lastName,
      "email": email,
      "password": password
    };

    var queryParameters = {
      RequestParam.service: MethodNames.userRegistration,
    };
    String queryString = Uri(queryParameters: queryParameters).query;
    String requestUrl = AppUrls.BASE_URL + queryString;

    return await BaseApiHelper.postRequest(requestUrl, requestData,
        passAuthToken: false);
  }

  Future<Map<String, dynamic>> userLogin(String email, String password) async {
    final Map<String, dynamic> requestData = {
      "email": email,
      "password": password
    };

    var queryParameters = {RequestParam.service: MethodNames.userLogin};
    String queryString = Uri(queryParameters: queryParameters).query;
    String requestUrl = AppUrls.BASE_URL + queryString;

    return await BaseApiHelper.postRequest(requestUrl, requestData);
  }

  Future<Map<String, dynamic>> forgotPassword(String email) async {
    final Map<String, dynamic> requestData = {"email": email};

    var queryParameters = {RequestParam.service: MethodNames.forgotPassword};
    String queryString = Uri(queryParameters: queryParameters).query;
    String requestUrl = AppUrls.BASE_URL + queryString;

    return await BaseApiHelper.postRequest(requestUrl, requestData,
        passAuthToken: false);
  }

  Map<String, dynamic> parseResponse(String response) {
    final jsonDecode = json.decode(response);
    return {"data": "done"};
  }
}

import 'dart:io';

import 'package:http/http.dart';
import 'package:http_parser/http_parser.dart';
import 'package:mime/mime.dart';

import '../../extras/extras.dart';

class ProfileRepo {
  Future<Map<String, dynamic>> uploadImage(
      String firstName, String lastName, String email, File file) async {
    final Map<String, String> requestData = {
      "first_name": firstName,
      "last_name": lastName,
      "email": email,
    };
    var multipartFile;
    if (file != null) {
      var mimeType = lookupMimeType(file.path).split("/");
      multipartFile = MultipartFile(
        "profile_image",
        file.readAsBytes().asStream(),
        file.lengthSync(),
        filename: file.path.split("/").last,
        contentType: MediaType(mimeType[0], mimeType[1]),
      );
    }

    var queryParameters = {
      RequestParam.service: MethodNames.updateUserDetails,
      RequestParam.showError: "true"
    };
    String queryString = Uri(queryParameters: queryParameters).query;
    String requestUrl = AppUrls.BASE_URL + queryString;
    return await BaseApiHelper.uploadFile(
        requestUrl, multipartFile, requestData);
  }

  Future<Map<String, dynamic>> changePassword(
      String oldPassword, String newPassword) async {
    final Map<String, dynamic> requestData = {
      "old_password": oldPassword,
      "new_password": newPassword
    };

    var queryParameters = {
      RequestParam.service: MethodNames.changePassword,
    };
    String queryString = Uri(queryParameters: queryParameters).query;
    String requestUrl = AppUrls.BASE_URL + queryString;

    return await BaseApiHelper.postRequest(requestUrl, requestData);
  }
}

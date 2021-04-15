// class UserItem {
//   final int userId;
//   final String firstName;
//   final String lastName;
//   final String userEmail;
//
//   UserItem({this.userId, this.firstName, this.lastName, this.userEmail});
// }

import 'dart:convert';

UserItem userItemFromJson(String str) => UserItem.fromJson(json.decode(str));

String userItemToJson(UserItem data) => json.encode(data.toJson());

class UserItem {
  UserItem({
    this.userId,
    this.userToken,
    this.firstName,
    this.lastName,
    this.email,
    this.profileImage,
    this.socialId,
    this.deviceType,
    this.verifyForgotCode,
    this.authToken,
    this.devicePushToken,
    this.isLoggedOut,
    this.badge,
  });

  int userId;
  String userName;
  String userToken;
  String firstName;
  String lastName;
  String email;
  String profileImage;
  String socialId;
  String deviceType;
  String verifyForgotCode;
  String authToken;
  String devicePushToken;
  int isLoggedOut;
  int badge;

  factory UserItem.fromJson(Map<String, dynamic> json) => UserItem(
        userId: json["user_id"],
        userToken: json["user_token"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        email: json["email"],
        profileImage: json["profile_image"],
        socialId: json["social_id"],
        deviceType: json["device_type"],
        verifyForgotCode: json["verify_forgot_code"],
        authToken: json["auth_token"],
        devicePushToken: json["device_push_token"],
        isLoggedOut: json["is_logged_out"],
        badge: json["badge"],
      );

  Map<String, dynamic> toJson() => {
        "user_id": userId,
        "user_token": userToken,
        "first_name": firstName,
        "last_name": lastName,
        "email": email,
        "profile_image": profileImage,
        "social_id": socialId,
        "device_type": deviceType,
        "verify_forgot_code": verifyForgotCode,
        "auth_token": authToken,
        "device_push_token": devicePushToken,
        "is_logged_out": isLoggedOut,
        "badge": badge,
      };
}

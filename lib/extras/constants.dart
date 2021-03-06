import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

var appColor = MaterialColor(0XFF141414, const <int, Color>{
  50: const Color(0XFF141414),
  100: const Color(0XFF141414),
  200: const Color(0XFF141414),
  300: const Color(0XFF141414),
  400: const Color(0XFF141414),
  500: const Color(0XFF141414),
  600: const Color(0XFF141414),
  700: const Color(0XFF141414),
  800: const Color(0XFF141414),
  900: const Color(0XFF141414),
});
var lightAppColor = const Color(0XFFB2B2B2);
var lineColor = const Color(0xFFE5E5E5);

var appName = "MPRV Workout Tracker";
var appTitle = "MPRV";
var appSubTitle = "Workout Tracker";

double spaceH = 0.0;
double spaceW = 0.0;
double spaceTop = 0.0;

class Routes {
  static const STARTUP = "/startup";
  static const FORGOT_PASSWORD = "/forgot_password";
  static const HOME = "/home";
  static const ADD_EDIT_LOG = "/add_edit_log";
  static const CHANGE_PASSWORD = "/change_password";
  static const VERIFY_PASSWORD = "/verify_password";
  static const EDIT_PROFILE = "/edit_profile";
}

class ImageAssets {
  static const fabDone = "assets/images/ic_done.png";
  static const passwordVisibility = "assets/images/ic_visibility.png";
  static const passwordVisibilityOff = "assets/images/ic_visibility_off.png";
  static const changePassword = "assets/images/ic_lock.png";
  static const logout = "assets/images/ic_logout.png";
  static const userProfile = "assets/images/ic_user.png";
  static const add = "assets/images/ic_add.png";
  static const more = "assets/images/ic_more.png";
  static const back = "assets/images/ic_back.png";
  static const check = "assets/images/ic_check.png";
  static const camera = "assets/images/ic_camera.png";
  static const delete = "assets/images/ic_delete.png";
  static const deleteSelected = "assets/images/ic_delete_selected.png";
  static const placeholder = "assets/images/ic_placeholder.png";
}

double mediaQueryWidth(BuildContext context) {
  return MediaQuery.of(context).size.width;
}

double mediaQueryHeight(BuildContext context) {
  return MediaQuery.of(context).size.height;
}

double marginTop(BuildContext context) {
  return (mediaQueryHeight(context) * 0.02);
}

double marginH(BuildContext context) {
  return (mediaQueryHeight(context) * 0.03);
}

double marginW(BuildContext context) {
  return (mediaQueryWidth(context) * 0.03);
}

EdgeInsetsGeometry startupScreenMargin() {
  return const EdgeInsets.symmetric(vertical: 30, horizontal: 30);
}

//region TextStyle
/// w600 == SemiBold
TextStyle textFieldLabelStyle() {
  return GoogleFonts.sourceSansPro(
      color: lightAppColor, fontSize: 16, fontWeight: FontWeight.w400);
}

TextStyle textFieldTextStyle() {
  return GoogleFonts.sourceSansPro(
      color: appColor, fontSize: 16, fontWeight: FontWeight.w400);
}

TextStyle appColorTextStyle() {
  return GoogleFonts.sourceSansPro(
      color: appColor, fontSize: 14, fontWeight: FontWeight.w600);
}

TextStyle lightColorTextStyle() {
  return GoogleFonts.sourceSansPro(
      color: lightAppColor, fontSize: 15, fontWeight: FontWeight.w400);
}
//endregion

UnderlineInputBorder startupTextFieldBorder() {
  return UnderlineInputBorder(borderSide: BorderSide(color: lineColor));
}

OutlineInputBorder mprvTextFieldBorder() {
  return OutlineInputBorder(
      borderSide: BorderSide(color: lineColor, width: 2),
      borderRadius: BorderRadius.circular(10));
}

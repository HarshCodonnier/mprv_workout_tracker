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

class Routes {
  static const STARTUP = "/";
  static const FORGOT_PASSWORD = "/forgot_password";
  static const HOME = "/home";
}

class ImageAssets {
  static const fabDone = "assets/images/ic_done.png";
  static const passwordVisibility = "assets/images/ic_visibility.png";
  static const passwordVisibilityOff = "assets/images/ic_visibility_off.png";
  static const changePassword = "assets/images/ic_lock.png";
  static const logout = "assets/images/ic_logout.png";
  static const userProfile = "assets/images/ic_user.png";
  static const add = "assets/images/ic_add.png";
}

double mediaQueryWidth(BuildContext context) {
  return MediaQuery.of(context).size.width;
}

double mediaQueryHeight(BuildContext context) {
  return MediaQuery.of(context).size.height;
}

EdgeInsetsGeometry startupScreenMargin() {
  return const EdgeInsets.symmetric(vertical: 30, horizontal: 30);
}

//region TextStyle
/// w600 == SemiBold
TextStyle textFieldLabelStyle() {
  return GoogleFonts.sourceSansPro(color: lightAppColor, fontSize: 16);
}

TextStyle textFieldTextStyle() {
  return GoogleFonts.sourceSansPro(color: appColor, fontSize: 16);
}

TextStyle appColorTextStyle() {
  return GoogleFonts.sourceSansPro(
      color: appColor, fontSize: 14, fontWeight: FontWeight.w600);
}

TextStyle lightColorTextStyle() {
  return GoogleFonts.sourceSansPro(color: lightAppColor, fontSize: 14);
}

TextStyle underlineTextStyle() {
  return GoogleFonts.sourceSansPro(
      color: appColor,
      fontSize: 14,
      fontWeight: FontWeight.w600,
      decoration: TextDecoration.underline);
}
//endregion

UnderlineInputBorder textFieldBorder() {
  return UnderlineInputBorder(borderSide: BorderSide(color: lineColor));
}

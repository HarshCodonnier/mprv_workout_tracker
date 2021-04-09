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
var textFieldColor = const Color(0XFFB2B2B2);

var appName = "MPRV Workout Tracker";
var appTitle = "MPRV";
var appSubTitle = "Workout Tracker";

class Routes {
  static const LOGIN_ROUTE = "login";
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

TextStyle textFieldLabelStyle() {
  return GoogleFonts.sourceSansPro(color: textFieldColor, fontSize: 16);
}

TextStyle textFieldTextStyle() {
  return GoogleFonts.sourceSansPro(color: appColor, fontSize: 16);
}

UnderlineInputBorder textFieldBorder() {
  return UnderlineInputBorder(
      borderSide: BorderSide(color: const Color(0xFFE5E5E5)));
}

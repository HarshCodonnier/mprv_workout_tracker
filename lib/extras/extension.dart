import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../extras/extras.dart';

/// FontWeight.w600 == SemiBold
extension text on String {
  startupTitle() {
    return Text(
      this,
      style: GoogleFonts.sourceSansPro(
        color: appColor,
        fontSize: 35.0,
        fontWeight: FontWeight.w600, // -> SemiBold
      ),
    );
  }

  startupSubTitle() {
    return Text(this,
        style: GoogleFonts.sourceSansPro(
            color: appColor, fontWeight: FontWeight.w400));
  }

  startupBottomText() {
    return Text(this,
        style: GoogleFonts.sourceSansPro(
            color: lightAppColor, fontSize: 14, fontWeight: FontWeight.w400));
  }

  startupBottomClickableText() {
    return Text(this,
        style: GoogleFonts.sourceSansPro(
            color: appColor, fontSize: 14, fontWeight: FontWeight.w600));
  }

  drawerHeaderText() {
    return Text(
      this,
      style: GoogleFonts.sourceSansPro(
          color: Colors.white, fontSize: 16, fontWeight: FontWeight.w400),
    );
  }

  drawerSubHeaderText() {
    return Text(
      this,
      style: GoogleFonts.sourceSansPro(
          color: Colors.white, fontSize: 14, fontWeight: FontWeight.w400),
    );
  }

  drawerItemText() {
    return Text(
      this,
      style: GoogleFonts.sourceSansPro(
          color: appColor, fontSize: 16, fontWeight: FontWeight.w400),
    );
  }

  screenTitleText() {
    return Text(
      this,
      style: GoogleFonts.sourceSansPro(
          color: appColor, fontSize: 20, fontWeight: FontWeight.w900),
    );
  }

  //region Log Item
  logItemTitleText() {
    return Text(
      this,
      style: GoogleFonts.sourceSansPro(
          color: Colors.white, fontSize: 27, fontWeight: FontWeight.w700),
      overflow: TextOverflow.ellipsis,
      maxLines: 1,
    );
  }

  logItemSubTitleText() {
    return Text(
      this,
      style: GoogleFonts.sourceSansPro(
          color: Colors.white, fontSize: 18, fontWeight: FontWeight.w600),
      overflow: TextOverflow.ellipsis,
      maxLines: 1,
    );
  }

  logItemWeightRepsText() {
    return Text(
      this,
      style: GoogleFonts.sourceSansPro(
          color: Colors.white, fontWeight: FontWeight.w300),
    );
  }

  logItemDescriptionText() {
    return Text(
      this,
      style: GoogleFonts.sourceSansPro(
        color: Colors.white,
        fontSize: 15,
        fontWeight: FontWeight.w400,
      ),
      overflow: TextOverflow.ellipsis,
      maxLines: 3,
    );
  }

  logItemDateText() {
    return Text(
      this,
      style: GoogleFonts.sourceSansPro(
          color: Colors.white, fontSize: 10, fontWeight: FontWeight.w300),
    );
  }

  logItemMenuText() {
    return Text(
      this,
      style: GoogleFonts.sourceSansPro(
        color: appColor,
        fontSize: 15,
        fontWeight: FontWeight.w400,
      ),
    );
  }

//endregion

  //region Workout Item
  workoutItemTitleText(Color textColor) {
    return Text(
      this,
      style: GoogleFonts.sourceSansPro(
          color: textColor, fontSize: 18, fontWeight: FontWeight.w700),
      overflow: TextOverflow.ellipsis,
      maxLines: 1,
    );
  }

  workoutItemSubTitleText(Color textColor) {
    return Text(
      this,
      style: GoogleFonts.sourceSansPro(
          color: textColor, fontSize: 14, fontWeight: FontWeight.w300),
      overflow: TextOverflow.ellipsis,
      maxLines: 1,
    );
  }

  workoutItemWeightRepsText(Color textColor) {
    return Text(
      this,
      style: GoogleFonts.sourceSansPro(
          color: textColor, fontSize: 10, fontWeight: FontWeight.w300),
    );
  }

  //endregion

  addLogText() {
    return Text(
      this,
      style: GoogleFonts.sourceSansPro(
          color: lightAppColor, fontSize: 15, fontWeight: FontWeight.w400),
    );
  }

  buttonText(Color textColor, double fontSize, FontWeight fontWeight) {
    return Text(
      this,
      style: GoogleFonts.sourceSansPro(
          color: textColor, fontSize: fontSize, fontWeight: fontWeight),
    );
  }

  isValidEmail() {
    return RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(this);
  }
}

extension space on double {
  addHSpace() {
    return SizedBox(
      height: this,
    );
  }

  addWSpace() {
    return SizedBox(
      width: this,
    );
  }
}

extension divider on double {
  dividerSpace({double startSpace = 0, double endSpace = 0}) {
    return Divider(
        indent: startSpace,
        endIndent: endSpace,
        color: lineColor,
        height: this);
  }
}

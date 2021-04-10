import 'package:flutter/cupertino.dart';
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
    return Text(this, style: GoogleFonts.sourceSansPro(color: appColor));
  }

  startupBottomText() {
    return Text(this,
        style: GoogleFonts.sourceSansPro(color: lightAppColor, fontSize: 14));
  }

  startupBottomClickableText() {
    return Text(this,
        style: GoogleFonts.sourceSansPro(
            color: appColor, fontSize: 14, fontWeight: FontWeight.w600));
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

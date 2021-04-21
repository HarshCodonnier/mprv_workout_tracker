import 'package:flutter/material.dart';

import '../extras/extras.dart';

class MPRVAddWorkoutButton extends StatelessWidget {
  final String text;
  final Function onClick;

  MPRVAddWorkoutButton(this.text, this.onClick);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: mediaQueryWidth(context) * 0.5,
      height: 50,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.white),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              side: BorderSide(color: appColor, width: 1),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
        onPressed: onClick,
        child: text.buttonText(appColor, 16, FontWeight.w600),
      ),
    );
  }
}

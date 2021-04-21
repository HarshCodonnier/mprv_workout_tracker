import 'package:flutter/material.dart';

import '../extras/extras.dart';

class MPRVSaveButton extends StatelessWidget {
  final String text;
  final Function onClick;

  MPRVSaveButton(this.text, this.onClick);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: mediaQueryWidth(context) * 0.89,
      height: 50,
      child: ElevatedButton(
        style: ButtonStyle(
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10)))),
        onPressed: onClick,
        child: text.buttonText(Colors.white, 20, FontWeight.w700),
      ),
    );
  }
}

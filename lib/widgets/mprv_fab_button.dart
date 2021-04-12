import 'package:flutter/material.dart';

class MPRVFabButton extends StatelessWidget {
  final String imageFile;
  final Color color;
  final Function onClick;

  MPRVFabButton({this.imageFile, this.color = Colors.white, this.onClick});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: color,
      onPressed: onClick,
      child: Image.asset(imageFile, width: 26, height: 24),
    );
  }
}

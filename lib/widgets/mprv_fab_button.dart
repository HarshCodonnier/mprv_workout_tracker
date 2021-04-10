import 'package:flutter/material.dart';

class MPRVFabButton extends StatelessWidget {
  final String imageFile;

  MPRVFabButton(this.imageFile);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {},
      child: Image.asset(imageFile, width: 26, height: 24),
    );
  }
}

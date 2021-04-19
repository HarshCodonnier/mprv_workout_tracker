import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MPRVProfileImage extends StatelessWidget {
  final double width;
  final double height;
  final double radius;
  final String imageUrl;
  final Color borderColor;

  MPRVProfileImage(
      {this.width = 150,
      this.height = 150,
      this.radius = 75,
      @required this.imageUrl,
      this.borderColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        border: Border.all(color: borderColor, width: 2),
      ),
      padding: EdgeInsets.all(borderColor == null ? 0 : 2),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(radius),
        child: Image.network(
          "https://images.unsplash.com/photo-1577812360848-4ecf5308ad83?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=400&q=80",
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

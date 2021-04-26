import 'dart:io';

import 'package:flutter/material.dart';

import '../extras/extras.dart';

class MPRVProfileImage extends StatelessWidget {
  final double width;
  final double height;
  final double radius;
  final String imageUrl;
  final Color borderColor;
  final File imageFile;

  MPRVProfileImage(
      {this.width = 150,
      this.height = 150,
      this.radius = 75,
      @required this.imageUrl,
      this.borderColor,
      this.imageFile});

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
        child: imageFile != null
            ? Image.file(
                imageFile,
                fit: BoxFit.cover,
              )
            : FadeInImage.assetNetwork(
                fit: BoxFit.cover,
                placeholder: ImageAssets.placeholder,
                image: AppUrls.IMAGE_URL + imageUrl),
      ),
    );
  }
}

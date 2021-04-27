import 'package:flutter/material.dart';

import '../extras/extras.dart';

class MPRVProgressView extends StatelessWidget {
  final bool isRoundedCorners;
  final bool showProgress;

  MPRVProgressView({this.isRoundedCorners = false, this.showProgress});

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: showProgress,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: isRoundedCorners
              ? BorderRadius.only(
                  topLeft: Radius.circular(15.0),
                  topRight: Radius.circular(15.0),
                )
              : null,
          color: Colors.white24,
        ),
        child: Center(
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation(appColor),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

import '../extras/constants.dart';

class MediumToolbar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 25),
      child: Column(
        children: [
          Text(
            appTitle,
            style: TextStyle(
              color: Colors.white,
              fontSize: 30,
              fontFamily: 'Akira',
            ),
          ),
          Text(
            appSubTitle,
            style: TextStyle(
              fontSize: 8.5,
              color: Colors.white,
              fontFamily: 'Akira',
            ),
          ),
        ],
      ),
    );
  }
}

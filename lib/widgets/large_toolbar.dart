import 'package:flutter/material.dart';

import '../extras/extras.dart';

class LargeToolbar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 30),
      child: Column(
        children: [
          Text(
            appTitle,
            style: TextStyle(
              color: Colors.white,
              fontSize: 40,
              fontFamily: 'Akira',
            ),
          ),
          Text(
            appSubTitle,
            style: TextStyle(
              fontSize: 11.5,
              color: Colors.white,
              fontFamily: 'Akira',
            ),
          ),
        ],
      ),
    );
  }
}

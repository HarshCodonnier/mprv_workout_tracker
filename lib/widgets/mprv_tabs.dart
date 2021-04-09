import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../extras/extras.dart';

class MPRVTabs extends StatelessWidget {
  final String tabOne;
  final String tabTwo;
  final TabController controller;
  final horizontalPadding = 59.0;
  final bottomPadding = 6.0;

  MPRVTabs({this.tabOne, this.tabTwo, this.controller});

  Decoration indicatorWidth() {
    return UnderlineTabIndicator(
      insets: EdgeInsets.fromLTRB(
          horizontalPadding, 0.0, horizontalPadding, bottomPadding),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: mediaQueryWidth(context) * 0.5,
          padding: const EdgeInsets.fromLTRB(0, 0, 0, 5),
          child: DefaultTabController(
            length: 2,
            child: TabBar(
              controller: controller,
              indicatorWeight: 2,
              indicator: indicatorWidth(),
              labelStyle: GoogleFonts.sourceSansPro(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16.0),
              unselectedLabelStyle: GoogleFonts.sourceSansPro(
                  color: Colors.white, fontSize: 16.0),
              tabs: [
                Tab(child: Text(tabOne)),
                Tab(child: Text(tabTwo)),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

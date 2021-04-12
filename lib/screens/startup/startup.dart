import 'package:flutter/material.dart';
import 'package:mprv_workout_tracker/screens/screens.dart';

import '../../extras/extras.dart';
import '../../widgets/widgets.dart';

class Startup extends StatefulWidget {
  @override
  _StartupState createState() => _StartupState();
}

class _StartupState extends State<Startup> with SingleTickerProviderStateMixin {
  TabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = new TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SafeArea(child: LargeToolbar()),
          (mediaQueryHeight(context) * 0.02).addHSpace(),
          MPRVTabs(
              tabOne: "Sign In", tabTwo: "Sign Up", controller: _controller),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15.0),
                  topRight: Radius.circular(15.0),
                ),
                color: Colors.white,
              ),
              child: TabBarView(
                controller: _controller,
                children: [
                  SignIn(_controller),
                  SignUp(_controller),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

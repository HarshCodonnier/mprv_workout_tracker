import 'package:flutter/material.dart';
import 'package:mprv_workout_tracker/screens/screens.dart';

import '../extras/extras.dart';
import '../widgets/widgets.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> with SingleTickerProviderStateMixin {
  TabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = new TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          body: Container(
            color: appColor,
            child: Column(
              children: [
                SafeArea(child: LargeToolbar()),
                MPRVTabs(
                    tabOne: "Sign In",
                    tabTwo: "Sign Up",
                    controller: _controller),
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
                        SignIn(),
                        Text("Sign up", style: TextStyle(color: appColor))
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}

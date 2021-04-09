import 'package:flutter/material.dart';

import '../extras/extras.dart';
import '../widgets/widgets.dart';

class SignIn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        margin: startupScreenMargin(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            "Welcome Back".startupTitle(),
            "Hello there, sign in to continue".startupSubTitle(),
            32.0.addHSpace(),
            StartupTextField(
              label: "Email Address",
              type: TextInputType.emailAddress,
              isPassword: false,
            ),
            32.0.addHSpace(),
            StartupTextField(
              label: "Password",
              type: TextInputType.text,
              isPassword: true,
            ),
            60.0.addHSpace(),
            Row(
              children: [
                Expanded(child: "Forgot Password?".startupSubTitle()),
                FloatingActionButton(
                  onPressed: () {},
                  child: Icon(
                    Icons.arrow_forward,
                    color: Colors.white,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

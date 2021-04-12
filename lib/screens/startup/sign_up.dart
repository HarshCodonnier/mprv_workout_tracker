import 'package:flutter/material.dart';

import '../../extras/extras.dart';
import '../../widgets/widgets.dart';

class SignUp extends StatefulWidget {
  final TabController controller;

  SignUp(this.controller);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  void _onSignUpClick() {
    Navigator.of(context).pushReplacementNamed(Routes.HOME);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        margin: startupScreenMargin(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            "Lets Start".startupTitle(),
            "Hello there, sign up to continue".startupSubTitle(),
            (mediaQueryHeight(context) * 0.03).addHSpace(),
            Row(
              children: [
                Expanded(
                  child: StartupTextField(
                    label: "First Name",
                    type: TextInputType.text,
                    isPassword: false,
                  ),
                ),
                32.0.addWSpace(),
                Expanded(
                  child: StartupTextField(
                    label: "Last Name",
                    type: TextInputType.text,
                    isPassword: false,
                  ),
                ),
              ],
            ),
            (mediaQueryHeight(context) * 0.03).addHSpace(),
            StartupTextField(
              label: "Email Address",
              type: TextInputType.emailAddress,
              isPassword: false,
            ),
            (mediaQueryHeight(context) * 0.03).addHSpace(),
            StartupTextField(
              label: "Password",
              type: TextInputType.text,
              isPassword: true,
            ),
            (mediaQueryHeight(context) * 0.03).addHSpace(),
            StartupTextField(
              label: "Re-enter Password",
              type: TextInputType.text,
              isPassword: true,
              isHidden: true,
            ),
            (mediaQueryHeight(context) * 0.04).addHSpace(),
            Row(
              children: [
                Expanded(
                  child: Container(),
                ),
                MPRVFabButton(
                  imageFile: ImageAssets.fabDone,
                  color: appColor,
                  onClick: _onSignUpClick,
                )
              ],
            ),
            (mediaQueryHeight(context) * 0.05).addHSpace(),
            Container(
              alignment: Alignment.bottomCenter,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  "If you have an account? ".startupBottomText(),
                  Container(
                    padding: EdgeInsets.only(
                      bottom: 5, // Space between underline and text
                    ),
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: appColor,
                          width: 2,
                        ),
                      ),
                    ),
                    child: InkWell(
                      onTap: () {
                        widget.controller.animateTo(0);
                      },
                      child: Text(
                        "Sign In",
                        style: appColorTextStyle(),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

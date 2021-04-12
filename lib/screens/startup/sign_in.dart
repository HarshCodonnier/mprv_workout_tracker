import 'package:flutter/material.dart';

import '../../extras/extras.dart';
import '../../widgets/widgets.dart';

class SignIn extends StatefulWidget {
  final TabController controller;

  SignIn(this.controller);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  void _onSignInClick() {
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
            "Welcome Back".startupTitle(),
            "Hello there, sign in to continue".startupSubTitle(),
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
            (mediaQueryHeight(context) * 0.1).addHSpace(),
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: InkWell(
                      child: "Forgot Password?".startupSubTitle(),
                      onTap: () => Navigator.of(context)
                          .pushNamed(Routes.FORGOT_PASSWORD),
                    ),
                  ),
                ),
                MPRVFabButton(
                  imageFile: ImageAssets.fabDone,
                  color: appColor,
                  onClick: _onSignInClick,
                )
              ],
            ),
            (mediaQueryHeight(context) * 0.165).addHSpace(),
            /*Container(
          margin: EdgeInsets.only(top: 100),
          child: Align(
            // child: RichText(
            //   text: TextSpan(
            //     style: lightColorTextStyle(),
            //     children: [
            //       TextSpan(text: "If you don’t have an account? "),
            //       TextSpan(text: "Sign Up", style: appColorTextStyle()),
            //     ],
            //   ),
            // ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                "If you don’t have an account? ".startupBottomText(),
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
                      controller.animateTo(1);
                    },
                    child: Text(
                      "Sign Up",
                      style: appColorTextStyle(),
                    ),
                  ),
                )
              ],
            ),
            alignment: Alignment.bottomCenter,
          ),
        )*/
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  "If you don’t have an account? ".startupBottomText(),
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
                        widget.controller.animateTo(1);
                      },
                      child: Text(
                        "Sign Up",
                        style: appColorTextStyle(),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

import '../../extras/extras.dart';
import '../../widgets/widgets.dart';

class ForgotPassword extends StatefulWidget {
  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  void _onForgotPasswordClick() {
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SafeArea(child: LargeToolbar()),
          (mediaQueryHeight(context) * 0.02).addHSpace(),
          53.0.addHSpace(),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15.0),
                  topRight: Radius.circular(15.0),
                ),
                color: Colors.white,
              ),
              child: SingleChildScrollView(
                child: Container(
                  margin: startupScreenMargin(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      "Forgot Password".startupTitle(),
                      "Don't worry, we got it".startupSubTitle(),
                      (mediaQueryHeight(context) * 0.03).addHSpace(),
                      StartupTextField(
                        label: "Email Address",
                        type: TextInputType.emailAddress,
                        isPassword: false,
                      ),
                      (mediaQueryHeight(context) * 0.1).addHSpace(),
                      Row(
                        children: [
                          Expanded(
                            child: Container(),
                          ),
                          MPRVFabButton(
                            imageFile: ImageAssets.fabDone,
                            color: appColor,
                            onClick: _onForgotPasswordClick,
                          )
                        ],
                      ),
                      (mediaQueryHeight(context) * 0.28).addHSpace(),
                      Container(
                        child: Align(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              "Still remember the password "
                                  .startupBottomText(),
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
                                  child: Text(
                                    "Sign In",
                                    style: appColorTextStyle(),
                                  ),
                                  onTap: () {
                                    Navigator.of(context).pop();
                                  },
                                ),
                              )
                            ],
                          ),
                          alignment: Alignment.bottomCenter,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

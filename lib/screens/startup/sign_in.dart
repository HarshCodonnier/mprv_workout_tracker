import 'package:flutter/material.dart';

import '../../extras/extras.dart';
import '../../models/models.dart';
import '../../widgets/widgets.dart';

class SignIn extends StatefulWidget {
  final TabController controller;

  SignIn(this.controller);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  void _onSignInClick() {
    if (_formKey.currentState.validate()) {
      Navigator.of(context).pushReplacementNamed(
        Routes.HOME,
        arguments: UserItem(
            userId: 1,
            userEmail: _emailController.text.toString(),
            firstName: "First",
            lastName: "LastName"),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        margin: startupScreenMargin(),
        child: Form(
          autovalidateMode: AutovalidateMode.disabled,
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              "Welcome Back".startupTitle(),
              "Hello there, sign in to continue".startupSubTitle(),
              (mediaQueryHeight(context) * 0.03).addHSpace(),
              StartupTextField(
                controller: _emailController,
                label: "Email Address",
                type: TextInputType.emailAddress,
                isPassword: false,
                validator: (value) {
                  if (value.isEmpty) {
                    return "Please enter email.";
                  } else {
                    if (!value.isValidEmail()) {
                      return "Please enter valid email.";
                    }
                  }
                  return null;
                },
              ),
              (mediaQueryHeight(context) * 0.03).addHSpace(),
              StartupTextField(
                controller: _passwordController,
                label: "Password",
                type: TextInputType.text,
                isPassword: true,
                validator: (String value) {
                  if (value.isEmpty) {
                    return "Please enter password.";
                  } else {
                    if (value.length < 7) {
                      return "Please enter at least 7 character password.";
                    }
                  }
                  return null;
                },
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
      ),
    );
  }
}

import 'package:flutter/material.dart';

import '../../extras/extras.dart';
import '../../widgets/widgets.dart';

class ChangePassword extends StatefulWidget {
  @override
  _ChangePasswordState createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  final _oldPasswordController = TextEditingController();
  final _newPasswordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  void _onBackClick() {
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        _onBackClick();
        return false;
      },
      child: Scaffold(
        body: Stack(
          children: <Widget>[
            Positioned(
              left: 10,
              top: 50,
              child: IconButton(
                icon: Image.asset(ImageAssets.back, width: 24, height: 24),
                onPressed: _onBackClick,
              ),
            ),
            Column(
              children: [
                SafeArea(child: MediumToolbar()),
                (mediaQueryHeight(context) * 0.02).addHSpace(),
                Expanded(
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15.0),
                        topRight: Radius.circular(15.0),
                      ),
                      color: Colors.white,
                    ),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          20.0.addHSpace(),
                          "CHANGE PASSWORD".screenTitleText(),
                          Expanded(
                            child: SingleChildScrollView(
                              child: Container(
                                margin: const EdgeInsets.only(
                                    top: 30, right: 20, left: 20),
                                child: Column(
                                  children: [
                                    StartupTextField(
                                      controller: _oldPasswordController,
                                      label: "Old Password",
                                      type: TextInputType.text,
                                      isPassword: true,
                                      validator: (String value) {
                                        if (value.isEmpty) {
                                          return "Please enter old password.";
                                        } else {
                                          if (value.length < 7) {
                                            return "Please enter at least 7 character password.";
                                          }
                                        }
                                        return null;
                                      },
                                    ),
                                    20.0.addHSpace(),
                                    StartupTextField(
                                      controller: _newPasswordController,
                                      label: "New Password",
                                      type: TextInputType.text,
                                      isPassword: true,
                                      validator: (String value) {
                                        if (value.isEmpty) {
                                          return "Please enter new password.";
                                        } else {
                                          if (value.length < 7) {
                                            return "Please enter at least 7 character password.";
                                          }
                                        }
                                        return null;
                                      },
                                    ),
                                    20.0.addHSpace(),
                                    StartupTextField(
                                      label: "Re-enter Password",
                                      type: TextInputType.text,
                                      isPassword: true,
                                      isHidden: true,
                                      validator: (value) {
                                        if (value.isEmpty) {
                                          return "Please enter password.";
                                        } else {
                                          if (value !=
                                              _newPasswordController.text
                                                  .toString()) {
                                            return "Re-enter password does'nt match.";
                                          }
                                        }
                                        return null;
                                      },
                                    ),
                                    (mediaQueryHeight(context) * 0.265)
                                        .addHSpace(),
                                    Container(
                                      width: mediaQueryWidth(context) * 0.89,
                                      height: 50,
                                      child: ElevatedButton(
                                        style: ButtonStyle(
                                            shape: MaterialStateProperty.all(
                                                RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10)))),
                                        onPressed: () {
                                          _formKey.currentState.validate();
                                        },
                                        child: "SAVE".saveButtonText(),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

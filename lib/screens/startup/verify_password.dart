import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/startup/startup_bloc.dart';
import '../../extras/extras.dart';
import '../../widgets/widgets.dart';

class VerifyPassword extends StatefulWidget {
  VerifyPassword({Key key}) : super(key: key);

  @override
  _VerifyPasswordState createState() => _VerifyPasswordState();
}

class _VerifyPasswordState extends State<VerifyPassword> {
  var _email = "";
  final _formKey = GlobalKey<FormState>();

  TextEditingController _verificationCodeController = TextEditingController();
  TextEditingController _newPasswordController = TextEditingController();
  StartupBloc _startupBloc;
  bool _showProgress = false;

  void _onForgotPasswordClick() {
    if (_formKey.currentState.validate()) {
      setState(() {
        _showProgress = true;
      });
      _startupBloc.add(VerifyPasswordEvent(
          _email.trim(),
          _verificationCodeController.text.toString().trim(),
          _newPasswordController.text.toString()));
    }
  }

  @override
  Widget build(BuildContext context) {
    _startupBloc = BlocProvider.of<StartupBloc>(context);
    _email = ModalRoute.of(context).settings.arguments as String;
    return Scaffold(
      body: Column(
        children: [
          SafeArea(child: LargeToolbar()),
          spaceTop.addHSpace(),
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
              child: Stack(
                children: [
                  SingleChildScrollView(
                    child: Container(
                      margin: startupScreenMargin(),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            "Verify Password".startupTitle(),
                            spaceH.addHSpace(),
                            StartupTextField(
                              controller: _verificationCodeController,
                              label: "Verification Code",
                              type: TextInputType.text,
                              isPassword: false,
                              validator: (String value) {
                                if (value.isEmpty) {
                                  return "Please enter verification code.";
                                } else {
                                  if (value.length < 6) {
                                    return "Please enter valid verification code.";
                                  }
                                }
                                return null;
                              },
                            ),
                            spaceH.addHSpace(),
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
                            spaceH.addHSpace(),
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
                                      _newPasswordController.text.toString()) {
                                    return "Re-enter password does'nt match.";
                                  }
                                }
                                return null;
                              },
                            ),
                            (mediaQueryHeight(context) * 0.1).addHSpace(),
                            Row(
                              children: [
                                Spacer(),
                                MPRVFabButton(
                                  imageFile: ImageAssets.fabDone,
                                  color: appColor,
                                  onClick: _onForgotPasswordClick,
                                ),
                              ],
                            ),
                            (mediaQueryHeight(context) * 0.1).addHSpace(),
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
                                        bottom:
                                            5, // Space between underline and text
                                      ),
                                      decoration: BoxDecoration(
                                        border: Border(
                                          bottom: BorderSide(
                                            color: appColor,
                                            width: 2,
                                          ),
                                        ),
                                      ),
                                      child: Material(
                                        clipBehavior: Clip.antiAlias,
                                        borderRadius: BorderRadius.circular(5),
                                        color: Colors.transparent,
                                        child: InkWell(
                                          child: Text(
                                            "Sign In",
                                            style: appColorTextStyle(),
                                          ),
                                          onTap: () {
                                            Navigator.of(context).pop();
                                          },
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                alignment: Alignment.bottomCenter,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  BlocConsumer<StartupBloc, StartupState>(
                    builder: (context, state) {
                      if (state is StartupLoading) {
                        _showProgress = true;
                      } else if (state is StartupDone) {
                        _showProgress = false;
                      }
                      return MPRVProgressView(
                          isRoundedCorners: true, showProgress: _showProgress);
                    },
                    listener: (context, state) {
                      if (state is StartupDone) {
                        setState(() {
                          _showProgress = false;
                        });
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text(state.data["message"]),
                        ));
                        if (state.data["status"]) {
                          Navigator.of(context).pop();
                        }
                      }
                    },
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

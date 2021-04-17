import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/startup/startup_bloc.dart';
import '../../extras/extras.dart';
import '../../widgets/widgets.dart';

class ForgotPassword extends StatefulWidget {
  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _emailController = TextEditingController();
  StartupBloc _startupBloc;
  bool _showProgress = false;

  void _onForgotPasswordClick() {
    if (_formKey.currentState.validate()) {
      setState(() {
        _showProgress = true;
      });
      _startupBloc.add(ForgotPasswordEvent(_emailController.text.toString()));
    }
  }

  @override
  Widget build(BuildContext context) {
    _startupBloc = BlocProvider.of<StartupBloc>(context);
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
                            "Forgot Password".startupTitle(),
                            "Don't worry, we got it".startupSubTitle(),
                            spaceH.addHSpace(),
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
                            (mediaQueryHeight(context) * 0.1).addHSpace(),
                            Row(
                              children: [
                                Expanded(
                                  child: Container(),
                                ),
                                BlocConsumer<StartupBloc, StartupState>(
                                  builder: (BuildContext context, state) {
                                    if (state is NotLoggedInState)
                                      return MPRVFabButton(
                                        imageFile: ImageAssets.fabDone,
                                        color: appColor,
                                        onClick: _onForgotPasswordClick,
                                      );
                                    else if (state is StartupLoading) {
                                      return MPRVFabButton(
                                        imageFile: ImageAssets.fabDone,
                                        color: appColor,
                                      );
                                    } else {
                                      return MPRVFabButton(
                                        imageFile: ImageAssets.fabDone,
                                        color: appColor,
                                        onClick: _onForgotPasswordClick,
                                      );
                                    }
                                  },
                                  listener: (context, state) {
                                    if (state is StartupDone) {
                                      setState(() {
                                        _showProgress = false;
                                      });
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(SnackBar(
                                        content: Text(state.data["message"]),
                                      ));
                                      if (state.data["status"]) {
                                        Navigator.of(context).pop();
                                      }
                                    }
                                  },
                                ),
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
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Visibility(
                    visible: _showProgress,
                    child: Container(
                      color: Colors.white24,
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mprv_workout_tracker/bloc/profile/profile_bloc.dart';

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
  bool _showProgress = false;
  ProfileBloc _profileBloc;

  void _onBackClick() {
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    _profileBloc = BlocProvider.of<ProfileBloc>(context);
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
                spaceTop.addHSpace(),
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
                          spaceTop.addHSpace(),
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
                                    MPRVSaveButton("SAVE", () {
                                      if (_formKey.currentState.validate()) {
                                        _profileBloc.add(ChangePasswordEvent(
                                            _oldPasswordController.text.trim(),
                                            _newPasswordController.text
                                                .trim()));
                                      }
                                    }),
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
            BlocConsumer<ProfileBloc, ProfileState>(
              builder: (context, state) {
                return Visibility(
                  visible: _showProgress,
                  child: Container(
                    color: Colors.white24,
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  ),
                );
              },
              listener: (context, state) {
                if (state is PasswordLoading) {
                  _showProgress = true;
                } else if (state is PasswordChangesDone) {
                  _showProgress = false;
                  if (state.data["status"]) {
                    preferences.clearUserItem();
                    Navigator.of(context).pop();
                    Navigator.of(context).pushReplacementNamed(Routes.STARTUP);
                  } else {
                    if (state.data["data"]["force_logout"] == 1) {
                      preferences.clearUserItem();
                      Navigator.of(context).pop();
                      Navigator.of(context)
                          .pushReplacementNamed(Routes.STARTUP);
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text(state.data["message"]),
                      ));
                    }
                  }
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/startup/startup_bloc.dart';
import '../../extras/extras.dart';
import '../../models/models.dart';
import '../../widgets/widgets.dart';

class SignUp extends StatefulWidget {
  final TabController controller;

  SignUp(this.controller);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _firstNameController = TextEditingController();
  TextEditingController _lastNameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  StartupBloc _startupBloc;
  bool _showProgress = false;
  UserItem _userItem;

  void _onSignUpClick() {
    if (_formKey.currentState.validate()) {
      setState(() {
        _showProgress = true;
      });
      _startupBloc.add(
        RegistrationEvent(
            _firstNameController.text.toString().trim(),
            _lastNameController.text.toString().trim(),
            _emailController.text.toString().trim(),
            _passwordController.text.toString()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    _startupBloc = BlocProvider.of<StartupBloc>(context);
    return Stack(
      children: [
        SingleChildScrollView(
          child: Container(
            margin: startupScreenMargin(),
            child: Form(
              autovalidateMode: AutovalidateMode.disabled,
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  "Lets Start".startupTitle(),
                  "Hello there, sign up to continue".startupSubTitle(),
                  spaceH.addHSpace(),
                  Row(
                    children: [
                      Expanded(
                        child: StartupTextField(
                          controller: _firstNameController,
                          label: "First Name",
                          type: TextInputType.name,
                          isPassword: false,
                          validator: (value) {
                            if (value.isEmpty) {
                              return "Please enter first name.";
                            }
                            return null;
                          },
                        ),
                      ),
                      32.0.addWSpace(),
                      Expanded(
                        child: StartupTextField(
                          controller: _lastNameController,
                          label: "Last Name",
                          type: TextInputType.name,
                          isPassword: false,
                          validator: (value) {
                            if (value.isEmpty) {
                              return "Please enter last name.";
                            }
                            return null;
                          },
                        ),
                      ),
                    ],
                  ),
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
                  spaceH.addHSpace(),
                  StartupTextField(
                    controller: _passwordController,
                    label: "Password",
                    type: TextInputType.text,
                    isPassword: true,
                    validator: (value) {
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
                        if (value != _passwordController.text.toString()) {
                          return "Re-enter password does'nt match.";
                        }
                      }
                      return null;
                    },
                  ),
                  (mediaQueryHeight(context) * 0.04).addHSpace(),
                  Row(
                    children: [
                      Spacer(),
                      MPRVFabButton(
                        imageFile: ImageAssets.fabDone,
                        color: appColor,
                        onClick: _onSignUpClick,
                      ),
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
                          child: Material(
                            clipBehavior: Clip.antiAlias,
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.transparent,
                            child: InkWell(
                              onTap: () {
                                widget.controller.animateTo(0);
                              },
                              child: Text(
                                "Sign In",
                                style: appColorTextStyle(),
                              ),
                            ),
                          ),
                        )
                      ],
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
            return Visibility(
              visible: _showProgress,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15.0),
                    topRight: Radius.circular(15.0),
                  ),
                  color: Colors.white24,
                ),
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              ),
            );
          },
          listener: (context, state) {
            if (state is StartupDone) {
              if (state.data["status"]) {
                _userItem = UserItem.fromJson(state.data["data"]);
                preferences.putString(
                    SharedPreference.AUTH_TOKEN, _userItem.authToken);
                preferences.saveUser(_userItem);
                Navigator.of(context).pushReplacementNamed(Routes.HOME);
              } else {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text(state.data["message"]),
                ));
              }
            }
          },
        )
      ],
    );
  }
}

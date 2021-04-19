import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/startup/startup_bloc.dart';
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
  StartupBloc _startupBloc;
  bool _showProgress = false;
  UserItem _userItem;

  void _onSignInClick() {
    if (_formKey.currentState.validate()) {
      setState(() {
        _showProgress = true;
      });
      _startupBloc.add(
        LoginEvent(_emailController.text.toString().trim(),
            _passwordController.text.toString()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    _startupBloc = BlocProvider.of<StartupBloc>(context);
    return BlocConsumer<StartupBloc, StartupState>(
      builder: (context, state) {
        if (state is StartupLoading) {
          _showProgress = true;
        } else if (state is StartupDone) {
          _showProgress = false;
        }
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
                      "Welcome Back".startupTitle(),
                      "Hello there, sign in to continue".startupSubTitle(),
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
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8),
                            child: Material(
                              clipBehavior: Clip.antiAlias,
                              borderRadius: BorderRadius.circular(5),
                              color: Colors.transparent,
                              child: InkWell(
                                child: "Forgot Password?".startupSubTitle(),
                                onTap: () => Navigator.of(context)
                                    .pushNamed(Routes.FORGOT_PASSWORD),
                              ),
                            ),
                          ),
                          Spacer(),
                          MPRVFabButton(
                            imageFile: ImageAssets.fabDone,
                            color: appColor,
                            onClick: _onSignInClick,
                          ),
                        ],
                      ),
                      (mediaQueryHeight(context) * 0.165).addHSpace(),
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            "If you don’t have an account? "
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
                              child: Material(
                                clipBehavior: Clip.antiAlias,
                                borderRadius: BorderRadius.circular(5),
                                color: Colors.transparent,
                                child: InkWell(
                                  onTap: () {
                                    widget.controller.animateTo(1);
                                  },
                                  child: Text(
                                    "Sign Up",
                                    style: appColorTextStyle(),
                                  ),
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
    );
  }
}

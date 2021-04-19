import 'package:flutter/material.dart';

import '../../extras/extras.dart';
import '../../widgets/widgets.dart';

class EditProfile extends StatefulWidget {
  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController _firstNameController = TextEditingController();
  TextEditingController _lastNameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();

  void _onBackClick() {
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: <Widget>[
        Positioned(
          left: 10,
          top: 50,
          child: IconButton(
            icon: Image.asset(ImageAssets.back, width: 24, height: 24),
            onPressed: _onBackClick,
          ),
        ),
        Column(children: [
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
                child: Column(children: [
                  spaceTop.addHSpace(),
                  "EDIT PROFILE".screenTitleText(),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Container(
                        margin:
                            const EdgeInsets.only(top: 30, right: 20, left: 20),
                        child: Column(children: [
                          Stack(
                            children: [
                              MPRVProfileImage(
                                  borderColor: appColor,
                                  imageUrl:
                                      "https://images.unsplash.com/photo-1577812360848-4ecf5308ad83?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=400&q=80"),
                              Positioned(
                                right: 10,
                                bottom: 8,
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: appColor,
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Material(
                                    clipBehavior: Clip.antiAlias,
                                    borderRadius: BorderRadius.circular(20),
                                    child: InkWell(
                                      onTap: () {},
                                      child: Container(
                                        padding: const EdgeInsets.all(7),
                                        width: 28,
                                        height: 28,
                                        child: Image.asset(ImageAssets.camera),
                                      ),
                                    ),
                                    color: Colors.transparent,
                                  ),
                                ),
                              ),
                            ],
                            clipBehavior: Clip.none,
                          ),
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
                          (mediaQueryHeight(context) * 0.151).addHSpace(),
                          MPRVSaveButton("SAVE", () {
                            _formKey.currentState.validate();
                          }),
                        ]),
                      ),
                    ),
                  ),
                ]),
              ),
            ),
          ),
        ]),
      ]),
    );
  }
}

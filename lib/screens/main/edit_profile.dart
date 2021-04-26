import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mprv_workout_tracker/bloc/profile/profile_bloc.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../extras/extras.dart';
import '../../models/models.dart';
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
  File _image;
  ProfileBloc _profileBloc;
  bool _showProgress = false;

  void _onBackClick() {
    Navigator.of(context).pop();
  }

  void _openImageChooser() {
    Platform.isIOS
        ? showModalBottomSheet(
            context: context,
            builder: (context) {
              return SafeArea(
                child: Container(
                  child: Wrap(
                    children: [
                      ListTile(
                        title: Text("Gallery"),
                        leading: Icon(Icons.photo_library),
                        onTap: () {
                          _imageFormGallery();
                          Navigator.pop(context);
                        },
                      ),
                      ListTile(
                        title: Text("Camera"),
                        leading: Icon(Icons.photo_camera),
                        onTap: () {
                          _imageFromCamera();
                          Navigator.pop(context);
                        },
                      ),
                    ],
                  ),
                ),
              );
            },
          )
        : showDialog(
            context: context,
            builder: (context) {
              return SimpleDialog(
                title: Text("Select Image"),
                children: [
                  ListTile(
                    title: Text("Photo Library"),
                    leading: Icon(Icons.photo_library),
                    onTap: () {
                      _imageFormGallery();
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    title: Text("Camera"),
                    leading: Icon(Icons.photo_camera),
                    onTap: () {
                      _imageFromCamera();
                      Navigator.pop(context);
                    },
                  ),
                ],
              );
            },
          );
  }

  void _imageFormGallery() async {
    var status = await Permission.storage.request();
    if (status.isGranted) {
      final pickedFile = await ImagePicker()
          .getImage(source: ImageSource.gallery, imageQuality: 100);
      if (pickedFile != null) {
        setState(() {
          _image = File(pickedFile.path);
        });
        print(pickedFile.path);
      }
      return;
    } else if (status.isDenied) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
              "Without this permission app can not change profile picture."),
          action: Platform.isIOS
              ? SnackBarAction(
                  label: "Settings",
                  textColor: Theme.of(context).accentColor,
                  onPressed: openAppSettings,
                )
              : null,
        ),
      );
      return;
    } else if (status.isPermanentlyDenied) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
              "To access this feature please grant permission from settings."),
          action: SnackBarAction(
            label: "Settings",
            textColor: Theme.of(context).accentColor,
            onPressed: openAppSettings,
          ),
        ),
      );
      return;
    }
  }

  void _imageFromCamera() async {
    var status = await Permission.camera.request();
    if (status.isGranted) {
      final pickedFile = await ImagePicker()
          .getImage(source: ImageSource.camera, imageQuality: 100);
      if (pickedFile != null) {
        setState(() {
          _image = File(pickedFile.path);
        });
        print(pickedFile.path);
      }
    } else if (status.isDenied) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
              "Without this permission app can not change profile picture."),
          action: Platform.isIOS
              ? SnackBarAction(
                  label: "Settings",
                  textColor: Theme.of(context).accentColor,
                  onPressed: openAppSettings,
                )
              : null,
        ),
      );
      return;
    } else if (status.isPermanentlyDenied) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
              "To access this feature please grant permission from settings."),
          action: SnackBarAction(
            label: "Settings",
            textColor: Theme.of(context).accentColor,
            onPressed: openAppSettings,
          ),
        ),
      );
      return;
    }
  }

  @override
  void initState() {
    Future.delayed(Duration.zero).then((value) {
      setState(() {
        var userItem = preferences.getUserItem();
        _firstNameController.text = userItem.firstName;
        _lastNameController.text = userItem.lastName;
        _emailController.text = userItem.email;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _profileBloc = BlocProvider.of<ProfileBloc>(context);
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
                                imageUrl: preferences
                                    .getString(SharedPreference.PROFILE_IMAGE),
                                imageFile: _image,
                              ),
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
                                      onTap: _openImageChooser,
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
                            if (_formKey.currentState.validate()) {
                              _profileBloc.add(ChangeProfileEvent(
                                  _firstNameController.text.trim(),
                                  _lastNameController.text.trim(),
                                  _emailController.text.trim(),
                                  _image));
                            }
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
            if (state is ProfileLoading) {
              _showProgress = true;
            } else if (state is ProfileChangesDone) {
              _showProgress = false;
              if (state.data["status"]) {
                var _userItem = UserItem.fromJson(state.data["data"]);
                preferences.saveUser(_userItem);
                Navigator.of(context).pop();
              } else {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text(state.data["message"]),
                ));
              }
            }
          },
        ),
      ]),
    );
  }
}

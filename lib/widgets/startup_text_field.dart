import 'package:flutter/material.dart';

import '../extras/extras.dart';

class StartupTextField extends StatefulWidget {
  final String label;
  final TextInputType type;
  final bool isPassword;
  final bool isHidden;

  StartupTextField(
      {this.label, this.type, this.isPassword, this.isHidden = false});

  @override
  _StartupTextFieldState createState() => _StartupTextFieldState();
}

class _StartupTextFieldState extends State<StartupTextField> {
  bool _showPassword = false;

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        labelText: widget.label,
        labelStyle: textFieldLabelStyle(),
        border: textFieldBorder(),
        focusedBorder: textFieldBorder(),
        enabledBorder: textFieldBorder(),
        suffixIcon: widget.isPassword && !widget.isHidden
            ? IconButton(
                icon: Image.asset(
                  _showPassword
                      ? ImageAssets.passwordVisibilityOff
                      : ImageAssets.passwordVisibility,
                  width: 24,
                  height: 24,
                ),
                onPressed: () {
                  setState(() {
                    _showPassword = !_showPassword;
                  });
                },
              )
            : null,
      ),
      style: textFieldTextStyle(),
      cursorColor: appColor,
      keyboardType: widget.type,
      obscureText: !_showPassword,
    );
  }
}

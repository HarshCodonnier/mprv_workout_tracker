import 'package:flutter/material.dart';

import '../extras/extras.dart';

class StartupTextField extends StatefulWidget {
  final String label;
  final TextInputType type;
  final bool isPassword;

  StartupTextField({this.label, this.type, this.isPassword});

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
        /*suffixIcon: widget.isPassword
            ? IconButton(
                icon: Icon(
                    _showPassword ? Icons.visibility_off : Icons.visibility),
                onPressed: () {
                  setState(() {
                    _showPassword = !_showPassword;
                  });
                },
              )
            : Container(),*/
      ),
      style: textFieldTextStyle(),
      cursorColor: appColor,
      keyboardType: widget.type,
      obscureText: !_showPassword,
    );
  }
}

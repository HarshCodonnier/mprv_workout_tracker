import 'package:flutter/material.dart';

import '../extras/extras.dart';

class MPRVTextField extends StatefulWidget {
  final TextEditingController controller;
  final String label;
  final TextInputType type;
  final FormFieldValidator<String> validator;
  final int maxLines;

  MPRVTextField(
      {this.controller, this.label, this.type, this.validator, this.maxLines});

  @override
  _MPRVTextFieldState createState() => _MPRVTextFieldState();
}

class _MPRVTextFieldState extends State<MPRVTextField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      decoration: InputDecoration(
        contentPadding:
            const EdgeInsets.symmetric(vertical: 14, horizontal: 12),
        isDense: true,
        labelText: widget.label,
        labelStyle: textFieldLabelStyle(),
        border: mprvTextFieldBorder(),
        focusedBorder: mprvTextFieldBorder(),
        enabledBorder: mprvTextFieldBorder(),
        alignLabelWithHint: true,
      ),
      textAlignVertical: TextAlignVertical.top,
      style: textFieldTextStyle(),
      cursorColor: appColor,
      keyboardType: widget.type,
      validator: widget.validator,
      maxLines: widget.maxLines,
    );
  }
}

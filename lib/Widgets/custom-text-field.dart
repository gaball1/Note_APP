import 'dart:math';

import 'package:flutter/material.dart';
import 'package:noteapp/Widgets/constants.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {super.key,
      required this.Hint,
      this.maxlines = 1,
      this.onsaved,
      this.onchanged});
  final String Hint;
  final int maxlines;

  final void Function(String?)? onsaved;
  final void Function(String)? onchanged;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
        onChanged: onchanged,
        onSaved: onsaved,
        validator: (value) {
          if (value?.isEmpty ?? true) {
            return 'Field is required';
          } else {
            return null;
          }
        },
        cursorColor: kprimarycolor,
        maxLines: maxlines,
        decoration: InputDecoration(
            hintText: Hint,
            border: buildBorder(),
            enabledBorder: buildBorder(),
            focusedBorder: buildBorder(kprimarycolor)));
  }

  OutlineInputBorder buildBorder([color]) {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(
          color: color ?? Colors.white,
        ));
  }
}

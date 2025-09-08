import 'package:flutter/material.dart';
import 'package:notes_app/constants.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.hintText,
    this.maxLine = 1,
    this.onSaved, this.onChanged,this.initialValue,
  });
  final String? initialValue;
  final String hintText;
  final int maxLine;
  final Function(String?)? onSaved;
  final Function(String?)? onChanged;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value?.isEmpty ?? true) {
          return 'Field is requierd';
        } else {
          return null;
        }
      },
      initialValue: initialValue,
      onChanged: onChanged,
      onSaved: onSaved,
      maxLines: maxLine,
      cursorColor: kPrimaryColor,
      decoration: InputDecoration(
        hintText: hintText,

        hintStyle: TextStyle(color: kPrimaryColor),
        border: buildBorder(),
        enabledBorder: buildBorder(),
        focusedBorder: buildBorder(kPrimaryColor),
      ),
    );
  }

  OutlineInputBorder buildBorder([color]) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: BorderSide(color: color ?? Colors.white),
    );
  }
}

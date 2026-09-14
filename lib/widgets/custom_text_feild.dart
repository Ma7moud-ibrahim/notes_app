import 'package:flutter/material.dart';
import 'package:notes_app/constants.dart';

class CustomTextFeild extends StatelessWidget {
  const CustomTextFeild({
    super.key,
    required this.hint,
    this.maxline = 1,
    this.onSaved,
    this.onChange,
    required this.controller,
  });

  final String hint;
  final int maxline;
  final void Function(String?)? onSaved;
  final Function(String)? onChange;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChange,
      onSaved: onSaved,
      controller: controller,
      validator: (value) {
        if (value?.isEmpty ?? true) {
          return 'Feild is required';
        } else {
          return null;
        }
      },
      cursorColor: kPrimaryColor,
      maxLines: maxline,
      decoration: InputDecoration(
        hint: Text(hint, style: TextStyle(color: kPrimaryColor)),
        border: outlinedInputBorder(),
        enabledBorder: outlinedInputBorder(),
        focusedBorder: outlinedInputBorder(kPrimaryColor),
      ),
    );
  }

  OutlineInputBorder outlinedInputBorder([color]) => OutlineInputBorder(
    borderRadius: BorderRadius.circular(16),
    borderSide: BorderSide(color: color ?? Colors.white),
  );
}

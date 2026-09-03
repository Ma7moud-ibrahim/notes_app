import 'package:flutter/material.dart';
import 'package:notes_app/widgets/constants.dart';

class AddNoteButtonSheet extends StatelessWidget {
  const AddNoteButtonSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          SizedBox(height: 32),
          CustomTextFeild(hint: 'Title'),
          SizedBox(height: 16),
          CustomTextFeild(hint: 'Contant', maxline: 5),
        ],
      ),
    );
  }
}

class CustomTextFeild extends StatelessWidget {
  const CustomTextFeild({super.key, required this.hint, this.maxline = 1});
  final String hint;
  final int maxline;
  @override
  Widget build(BuildContext context) {
    return TextField(
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

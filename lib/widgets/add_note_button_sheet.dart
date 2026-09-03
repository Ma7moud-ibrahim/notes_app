import 'package:flutter/material.dart';
import 'package:notes_app/widgets/constants.dart';

class AddNoteButtonSheet extends StatelessWidget {
  const AddNoteButtonSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(children: [SizedBox(height: 32), CustomTextFeild()]),
    );
  }
}

class CustomTextFeild extends StatelessWidget {
  const CustomTextFeild({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      cursorColor: kPrimaryColor,
      decoration: InputDecoration(
        hint: Text("Title", style: TextStyle(color: kPrimaryColor)),
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

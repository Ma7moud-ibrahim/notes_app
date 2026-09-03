import 'package:flutter/material.dart';
import 'package:notes_app/widgets/custom_buttom.dart';
import 'package:notes_app/widgets/custom_text_feild.dart';

class AddNoteButtonSheet extends StatelessWidget {
  const AddNoteButtonSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 32),
            CustomTextFeild(hint: 'Title'),
            SizedBox(height: 16),
            CustomTextFeild(hint: 'Contant', maxline: 5),
            SizedBox(height: 50),
            CustomButton(),
          ],
        ),
      ),
    );
  }
}

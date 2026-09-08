import 'package:flutter/material.dart';
import 'package:notes_app/widgets/custom_buttom.dart';
import 'package:notes_app/widgets/custom_text_feild.dart';

class AddNoteForm extends StatefulWidget {
  const AddNoteForm({super.key});

  @override
  State<AddNoteForm> createState() => _AddNoteFormState();
}

class _AddNoteFormState extends State<AddNoteForm> {
  final GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  String? title, subTitle;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: autovalidateMode,
      child: Column(
        children: [
          SizedBox(height: 32),
          CustomTextFeild(
            hint: 'Title',
            onSaved: (value) {
              title = value;
            },
          ),
          SizedBox(height: 16),
          CustomTextFeild(
            hint: 'Contant',
            maxline: 5,
            onSaved: (value) {
              subTitle = value;
            },
          ),
          SizedBox(height: 50),
          CustomButton(
            name: 'Add',
            onTap: () {
              if (formKey.currentState!.validate()) {
                formKey.currentState!.save();
              } else {
                autovalidateMode = AutovalidateMode.always;
                setState(() {});
              }
            },
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

import 'package:notes_app/widgets/button_add_note.dart';
import 'package:notes_app/widgets/colors_list_view.dart';
import 'package:notes_app/widgets/custom_text_field.dart';

class AddNoteForm extends StatefulWidget {
  const AddNoteForm({super.key});

  @override
  State<AddNoteForm> createState() => _AddNoteFormState();
}

class _AddNoteFormState extends State<AddNoteForm> {
  final GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  final TextEditingController titleController = TextEditingController();
  final TextEditingController subTitleController = TextEditingController();

  @override
  void dispose() {
    titleController.dispose();
    subTitleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: autovalidateMode,
      child: Column(
        children: [
          SizedBox(height: 20),
          CustomTextField(hint: 'Title', controller: titleController),
          SizedBox(height: 15),
          CustomTextField(
            hint: 'Content',
            maxline: 5,
            controller: subTitleController,
          ),
          SizedBox(height: 16),
          ColorsListView(),
          SizedBox(height: 16),
          ButtonAddNote(
            formKey: formKey,
            titleController: titleController,
            subTitleController: subTitleController,
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}

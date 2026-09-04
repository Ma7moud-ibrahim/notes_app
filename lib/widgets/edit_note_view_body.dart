import 'package:flutter/material.dart';
import 'package:notes_app/widgets/custom_app_bar.dart';
import 'package:notes_app/widgets/custom_buttom.dart';
import 'package:notes_app/widgets/custom_text_feild.dart';

class EditNoteViewBody extends StatelessWidget {
  const EditNoteViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        children: [
          SizedBox(height: 50),

          CustomAppBar(title: 'Edit Note', icon: Icons.check),
          SizedBox(height: 50),
          CustomTextFeild(hint: 'Title'),
          SizedBox(height: 15),
          CustomTextFeild(hint: 'Contant', maxline: 5),
        ],
      ),
    );
  }
}

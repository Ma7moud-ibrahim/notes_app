import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/notes/notes_cubit.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/widgets/custom_app_bar.dart';
import 'package:notes_app/widgets/custom_text_field.dart';

class EditNoteViewBody extends StatefulWidget {
  const EditNoteViewBody({super.key, required this.note});
  final NoteModel note;

  @override
  State<EditNoteViewBody> createState() => _EditNoteViewBodyState();
}

class _EditNoteViewBodyState extends State<EditNoteViewBody> {
  late final TextEditingController titleController;
  late final TextEditingController subTitleController;

  @override
  void initState() {
    super.initState();
    titleController = TextEditingController(text: widget.note.title);
    subTitleController = TextEditingController(text: widget.note.subTitle);
  }

  @override
  void dispose() {
    titleController.dispose();
    subTitleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        children: [
          SizedBox(height: 50),

          CustomAppBar(
            title: 'Edit Note',
            icon: Icons.check,
            onPressed: () {
              widget.note.title = titleController.text;
              widget.note.subTitle = subTitleController.text;
              widget.note.save();
              BlocProvider.of<NotesCubit>(context).fetchAllNotes();
              Navigator.pop(context);
            },
          ),
          SizedBox(height: 50),
          CustomTextField(hint: widget.note.title, controller: titleController),
          SizedBox(height: 15),
          CustomTextField(
            hint: widget.note.subTitle,
            controller: subTitleController,
            maxline: 5,
          ),
        ],
      ),
    );
  }
}

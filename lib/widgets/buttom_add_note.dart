import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:notes_app/cubits/add_note/add_note_cubit.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/widgets/custom_buttom.dart';

class ButtomAddNote extends StatefulWidget {
  const ButtomAddNote({
    super.key,
    required this.formKey,
    required this.titleController,
    required this.subTitleController,
  });

  final GlobalKey<FormState> formKey;
  final TextEditingController titleController;
  final TextEditingController subTitleController;

  @override
  State<ButtomAddNote> createState() => _ButtomAddNoteState();
}

class _ButtomAddNoteState extends State<ButtomAddNote> {
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddNoteCubit, AddNoteState>(
      builder: (context, state) {
        return CustomButton(
          isLoading: state is AddNoteLoading,
          name: 'Add',
          onTap: () {
            if (widget.formKey.currentState!.validate()) {
              var noteModel = NoteModel(
                title: widget.titleController.text,
                subTitle: widget.subTitleController.text,
                data: DateFormat('d MMM yyyy - hh:mm a').format(DateTime.now()),
                color: Colors.blue.toARGB32(),
              );
              BlocProvider.of<AddNoteCubit>(context).addNote(noteModel);
            } else {
              setState(() => autovalidateMode = AutovalidateMode.always);
            }
          },
        );
      },
    );
  }
}

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
    required this.title,
    required this.subTitle,
  });

  final GlobalKey<FormState> formKey;
  final String? title;
  final String? subTitle;

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
          isLoading: state is AddNoteLoading ? true : false,
          name: 'Add',

          onTap: () {
            if (widget.formKey.currentState!.validate()) {
              widget.formKey.currentState!.save();
              var noteModel = NoteModel(
                title: widget.title!,
                subTitle: widget.subTitle!,
                data: DateFormat('d MMM yyyy - hh:mm a').format(DateTime.now()),
                color: Colors.blue.toARGB32(),
              );
              BlocProvider.of<AddNoteCubit>(context).addNote(noteModel);
            } else {
              autovalidateMode = AutovalidateMode.always;
              setState(() {});
            }
          },
        );
      },
    );
  }
}

part of 'notes_cubit.dart';

sealed class NotesState extends Equatable {
  const NotesState();

  @override
  List<Object> get props => [];
}

final class NotesInitial extends NotesState {}

final class NotesSuccess extends NotesState {
  final List<NoteModel> notes;

  const NotesSuccess(this.notes);

  @override
  List<Object> get props => [notes];
}

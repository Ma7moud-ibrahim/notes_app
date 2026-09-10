part of 'notes_cubit.dart';

sealed class NotesState extends Equatable {
  const NotesState();

  @override
  List<Object> get props => [];
}

final class NotesInitial extends NotesState {}

final class NotesLoading extends NotesState {}

final class NotesSucess extends NotesState {
  final List<NoteModel> notes;

  const NotesSucess({required this.notes});
}

final class NotesFailure extends NotesState {
  final String errorMessage;

  const NotesFailure({required this.errorMessage});
}

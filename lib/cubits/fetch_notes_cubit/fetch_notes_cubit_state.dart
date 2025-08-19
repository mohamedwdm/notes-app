part of 'fetch_notes_cubit_cubit.dart';

@immutable
sealed class FetchNotesCubitState {}

class FetchNotesCubitInitial extends FetchNotesCubitState {}

class FetchNotesCubitLoading extends FetchNotesCubitState {}

class FetchNotesCubitSuccess extends FetchNotesCubitState {
  final List<NotesModel> notes;

  FetchNotesCubitSuccess({required this.notes});
}

class FetchNotesCubitFiluer extends FetchNotesCubitState {
  final String messege;

  FetchNotesCubitFiluer({required this.messege});
}

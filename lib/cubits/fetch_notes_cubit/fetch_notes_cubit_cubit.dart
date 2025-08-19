import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';
import 'package:notes_app/constants.dart';
import 'package:notes_app/models/notes_model.dart';

part 'fetch_notes_cubit_state.dart';

class FetchNotesCubitCubit extends Cubit<FetchNotesCubitState> {
  FetchNotesCubitCubit() : super(FetchNotesCubitInitial());
fetchAllNotes() async{
  try {
    var notesBox = Hive.box<NotesModel>(kNotesBox);
    List<NotesModel> notes = notesBox.values.toList();
    emit(FetchNotesCubitSuccess(notes: notes));
  } on Exception catch (e) {
    emit(FetchNotesCubitFiluer(messege: e.toString()));
  }
}
}


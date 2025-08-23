import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';
import 'package:notes_app/constants.dart';
import 'package:notes_app/models/notes_model.dart';

part 'fetch_notes_cubit_state.dart';

class FetchNotesCubitCubit extends Cubit<FetchNotesCubitState> {
  FetchNotesCubitCubit() : super(FetchNotesCubitInitial());
  List<NotesModel>? notes;
  fetchAllNotes() async {
    var notesBox = Hive.box<NotesModel>(kNotesBox);
     notes = notesBox.values.toList();
  }
}

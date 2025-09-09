import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';
import 'package:notes_app/constants.dart';
import 'package:notes_app/models/notes_model.dart';

part 'add_note_state.dart';

class AddNoteCubit extends Cubit<AddNoteState> {
  AddNoteCubit() : super(AddNoteInitial());

  Color? color = kColors[0];

  addNote(NotesModel notes) async {
    notes.color = color!.value;
    emit(AddNoteLoading());
    try {
      var notesBox = Hive.box<NotesModel>(kNotesBox);
      await notesBox.add(notes);
      emit(AddNoteSuccess());
    } on Exception catch (e) {
      emit(AddNoteFiluer(messege: e.toString()));
    }
  }
}

import 'package:flutter/material.dart';
import 'package:notes_app/models/notes_model.dart';
import 'package:notes_app/widgets/edit_view_body.dart';

class EditNoteView extends StatelessWidget {
  const EditNoteView({super.key, required this.note});
  static String id = 'edit notes view';

  final NotesModel note;
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: EditViewBody(note: note,));
  }
}

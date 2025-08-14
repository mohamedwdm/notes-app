import 'package:flutter/material.dart';
import 'package:notes_app/views/edit_note_view.dart';
import 'package:notes_app/views/notes_view.dart';

void main() {
  runApp(NotesApp());
}

class NotesApp extends StatelessWidget {
  const NotesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        fontFamily: 'Poppins',
      ),
      routes: {
        NotesView.id: (context) => NotesView(),
        EditNoteView.id: (context) => EditNoteView()
        },
      initialRoute: NotesView.id,
    );
  }
}

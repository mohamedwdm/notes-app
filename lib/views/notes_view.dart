import 'package:flutter/material.dart';
import 'package:notes_app/widgets/notes_view_body.dart';

class NotesView extends StatelessWidget {
  const NotesView({super.key});

  static String id = 'notes view';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NotesViewBody() ,
    );
  }
}

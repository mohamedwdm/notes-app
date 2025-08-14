import 'package:flutter/material.dart';
import 'package:notes_app/widgets/edit_view_body.dart';

class EditNoteView extends StatelessWidget {
  const EditNoteView({super.key});
  static String id = 'edit notes view';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: EditViewBody(),
    );
  }
}
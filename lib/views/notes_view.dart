import 'package:flutter/material.dart';
import 'package:notes_app/constants.dart';
import 'package:notes_app/widgets/add_note_bottom_sheet.dart';
import 'package:notes_app/widgets/notes_view_body.dart';

class NotesView extends StatelessWidget {
  const NotesView({super.key});

  static String id = 'notes view';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: kPrimaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
          
        ),
        onPressed: () {
          showModalBottomSheet(
            isScrollControlled: true,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            context: context,
            builder: (context) {
              return AddNoteBottomSheet();
            },
          );
        },
        child: const Icon(Icons.add, color: Colors.black),
      ),
      body: const NotesViewBody(),
    );
  }
}

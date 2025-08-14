import 'package:flutter/material.dart';
import 'package:notes_app/widgets/custom_appbar.dart';
import 'package:notes_app/widgets/note_item_listview.dart';

class NotesViewBody extends StatelessWidget {
  const NotesViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        children: [
          const SizedBox(height: 40),
          CustomAppBar(icon: Icons.search, title: 'Notes',),
          Expanded(child: NoteItemListView()),
        ],
      ),
    );
  }
}

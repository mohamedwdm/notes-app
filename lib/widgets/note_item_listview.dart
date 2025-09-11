import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:notes_app/constants.dart';
import 'package:notes_app/cubits/fetch_notes_cubit/fetch_notes_cubit_cubit.dart';
import 'package:notes_app/models/notes_model.dart';
import 'package:notes_app/widgets/custom_note_item.dart';

class NoteItemListView extends StatelessWidget {
  const NoteItemListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FetchNotesCubitCubit, FetchNotesCubitState>(
      builder: (context, state) {
        List<NotesModel> notes = BlocProvider.of<FetchNotesCubitCubit>(context).notes!;

        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          child: ListView.builder(
            itemCount: notes.length,
            padding: EdgeInsets.zero,
            itemBuilder: (context, index) {
              final note = notes[index];

              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 4.0),
                // Swipe to delete 
                child: Dismissible(
                  key: ValueKey(note.key), // Hive note has unique key
                  direction: DismissDirection.endToStart,
                  background: Container(
                    alignment: Alignment.centerRight,
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    color: Colors.red,
                    child: const Icon(Icons.delete, color: Colors.white),
                  ),

                  onDismissed: (direction) {
                    final deletedNote = note;
                    final deletedKey = note.key;

                    deletedNote.delete();
                    BlocProvider.of<FetchNotesCubitCubit>(context).fetchAllNotes();

                    // Snackbar with Undo
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: const Text("Note deleted"),
                        action: SnackBarAction(
                          label: "Undo",
                          onPressed: () async {
                            final notesBox = Hive.box<NotesModel>(kNotesBox);
                            await notesBox.put(deletedKey, deletedNote);
                            BlocProvider.of<FetchNotesCubitCubit>(context).fetchAllNotes();
                          },
                        ),
                      ),
                    );
                  },

                  child: NotesItem(note: note),
                ),
              );
            },
          ),
        );
      },
    );
  }
}

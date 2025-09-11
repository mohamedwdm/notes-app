import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/fetch_notes_cubit/fetch_notes_cubit_cubit.dart';
import 'package:notes_app/widgets/custom_appbar.dart';
import 'package:notes_app/widgets/note_item_listview.dart';

class NotesViewBody extends StatefulWidget {
  const NotesViewBody({super.key});

  @override
  State<NotesViewBody> createState() => _NotesViewBodyState();
}

class _NotesViewBodyState extends State<NotesViewBody> {
    @override
  void initState() {
   BlocProvider.of<FetchNotesCubitCubit>(context).fetchAllNotes();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        children: [
          const SizedBox(height: 40),
          const CustomAppBar( title: 'Notes App',),
          Expanded(child: NoteItemListView()),
        ],
      ),
    );
  }
}

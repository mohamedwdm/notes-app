import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/fetch_notes_cubit/fetch_notes_cubit_cubit.dart';
import 'package:notes_app/models/notes_model.dart';
import 'package:notes_app/widgets/custm_textfield.dart';
import 'package:notes_app/widgets/custom_appbar.dart';
import 'package:notes_app/widgets/edit_note_color_list.dart';
import 'package:notes_app/widgets/show_snackbar.dart';

class EditViewBody extends StatefulWidget {
  const EditViewBody({super.key, required this.note});

  final NotesModel note;

  @override
  State<EditViewBody> createState() => _EditViewBodyState();
}

class _EditViewBodyState extends State<EditViewBody> {
  String? title, content;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        children: [
          SizedBox(height: 40),
          CustomAppBar(
            icon: Icons.check,
            title: 'Edit Note',
            onPressed: () {
              final oldTitle = widget.note.title;
              final oldSubtitle = widget.note.subtitle;
              final newTitle = title ?? oldTitle;
              final newSubtitle = content ?? oldSubtitle;
              if (newTitle == oldTitle &&
                  newSubtitle == oldSubtitle) {
                Navigator.pop(context);
                ShowSnackBar(context, "No changes made");
                return;
              }
              widget.note.title = newTitle;
              widget.note.subtitle = newSubtitle;
              widget.note.save();

              BlocProvider.of<FetchNotesCubitCubit>(
                context,
              ).fetchAllNotes();
              Navigator.pop(context);
              ShowSnackBar(context, "Edited Successfully");
            },
          ),
          SizedBox(height: 40),
          CustomTextField(
            hintText: widget.note.title,
            initialValue: widget.note.title,
            onChanged: (value) {
              title = value;
            },
          ),
          SizedBox(height: 15),
          CustomTextField(
            hintText: widget.note.subtitle,
            initialValue: widget.note.subtitle,
            maxLine: 5,
            onChanged: (value) {
              content = value;
            },
          ),
          SizedBox(height: 15),
          EditNoteColorsList(note: widget.note),
        ],
      ),
    );
  }
}

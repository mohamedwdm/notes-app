import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:notes_app/cubits/fetch_notes_cubit/fetch_notes_cubit_cubit.dart';
import 'package:notes_app/widgets/add_not_form.dart';

class AddNoteBottomSheet extends StatelessWidget {
  const AddNoteBottomSheet({super.key});

  // we extract it as separate widget to be with build method to make the changes happen
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddNoteCubit(),
      child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: BlocConsumer<AddNoteCubit, AddNoteState>(
            listener: (context, state) {
              if (state is AddNoteSuccess) {
                Navigator.pop(context);
                  BlocProvider.of<FetchNotesCubitCubit>(
                    context,
                  ).fetchAllNotes();                
              } else if (state is AddNoteFiluer) {
                print('Failure ${state.messege}');
              }
            },
            builder: (context, state) {
              return AbsorbPointer(
                // to avoid clicking on any thing while loading
                absorbing: state is AddNoteLoading ? true : false,
                child: Padding(
                  padding:  EdgeInsets.only(left: 16.0 , right: 16 , bottom: MediaQuery.of(context).viewInsets.bottom),
                  child: SingleChildScrollView(child: AddNoteForm()),
                ));
            },
          ),
        ),
    );
  }
}

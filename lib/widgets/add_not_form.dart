import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:notes_app/models/notes_model.dart';
import 'package:notes_app/widgets/custm_textfield.dart';
import 'package:notes_app/widgets/custom_button.dart';

class AddNoteForm extends StatefulWidget {
  const AddNoteForm({super.key});

  @override
  State<AddNoteForm> createState() => _AddNoteFormState();
}

class _AddNoteFormState extends State<AddNoteForm> {
  final GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  String? title, subtitle;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: autovalidateMode,
      child: Column(
        children: [
          SizedBox(height: 32),

          CustomTextField(
            hintText: 'title',
            onSaved: (value) {
              title = value;
            },
          ),
          SizedBox(height: 15),
          CustomTextField(
            hintText: 'content',
            maxLine: 5,
            onSaved: (value) {
              subtitle = value;
            },
          ),
          SizedBox(height: 30),
          CustomButton(
            onTap: () {
              if (formKey.currentState!.validate()) {
                formKey.currentState!.save();
                var note = NotesModel(
                  title: title!,
                  subtitle: subtitle!,
                  date: DateTime.now().toString(),
                  color: Colors.blue.value,
                );
                BlocProvider.of<AddNoteCubit>(context).addNote(note);
              } else {
                autovalidateMode = AutovalidateMode.always;
                setState(() {});
              }
            },
          ),
          SizedBox(height: 30),
        ],
      ),
    );
  }
}

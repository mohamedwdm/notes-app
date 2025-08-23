import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/constants.dart';
import 'package:notes_app/cubits/fetch_notes_cubit/fetch_notes_cubit_cubit.dart';
import 'package:notes_app/models/notes_model.dart';
import 'package:notes_app/views/notes_view.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:notes_app/views/simple_bloc_observer.dart';

void main() async {
  await Hive.initFlutter();

  Hive.registerAdapter(NotesModelAdapter());
  Bloc.observer = SimpleBlocObserver();
  await Hive.openBox<NotesModel>(kNotesBox);
  runApp(NotesApp());
}

class NotesApp extends StatelessWidget {
  const NotesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FetchNotesCubitCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          brightness: Brightness.dark,
          fontFamily: 'Poppins',
        ),
        routes: {
          NotesView.id: (context) => NotesView(),
        },
        initialRoute: NotesView.id,
      ),
    );
  }
}

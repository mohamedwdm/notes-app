import 'package:flutter/material.dart';
import 'package:notes_app/screens/home_screen.dart';

void main() {
  runApp(NotesApp());
}

class NotesApp extends StatelessWidget {
  const NotesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {HomeScreen.id: (context) => HomeScreen()},
      initialRoute: HomeScreen.id,
    );
  }
}

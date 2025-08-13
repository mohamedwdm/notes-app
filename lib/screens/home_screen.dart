import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static String id = 'Home Page';

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text('Notes'), centerTitle: true));
  }
}

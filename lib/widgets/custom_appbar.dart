import 'package:flutter/material.dart';
import 'package:notes_app/widgets/custom_search_icon.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key, required this.icon, required this.title});
  final IconData icon;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children:  [
        Text(title, style: TextStyle(fontSize: 28)),

        CustomSearchIcon(icon: icon,),
      ],
    );
  }
}

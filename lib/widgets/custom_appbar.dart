import 'package:flutter/material.dart';
import 'package:notes_app/widgets/custom_icon.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
    this.icon,
    required this.title,
    this.onPressed,
  });
  final IconData? icon;
  final String title;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: TextStyle(fontSize: 28)),
        if (icon != null)
          CustomIcon(icon: icon!, onPressed: onPressed),
      ],
    );
  }
}

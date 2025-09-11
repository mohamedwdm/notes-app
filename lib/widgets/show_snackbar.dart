import 'package:flutter/material.dart';

void ShowSnackBar(BuildContext context,{required String message ,String? label,void Function()? onPressed} ) {

  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(message),
      action: (label != null && onPressed != null)
          ? SnackBarAction(label: label, onPressed: onPressed)
          : null, // no action if label/onPressed not provided    
          ),
  );
}

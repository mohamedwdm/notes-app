import 'package:flutter/material.dart';
import 'package:notes_app/widgets/custm_textfield.dart';

class AddNoteBottomSheet extends StatelessWidget {
  const AddNoteBottomSheet({super.key});

  // we extract it as separate widget to be with build method to make the changes happen
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: [
          SizedBox(height: 32),
      
          CustmTextField(),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:notes_app/widgets/custm_textfield.dart';
import 'package:notes_app/widgets/custom_button.dart';

class AddNoteBottomSheet extends StatelessWidget {
  const AddNoteBottomSheet({super.key});

  // we extract it as separate widget to be with build method to make the changes happen
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 32),
        
            CustmTextField(hintText: 'title'),
            SizedBox(height: 15),
            CustmTextField(hintText: 'content', maxLine: 5),
            SizedBox(height: 30,),
            CustomButton(),
            SizedBox(height: 30,),

          ],
        ),
      ),
    );
  }
}

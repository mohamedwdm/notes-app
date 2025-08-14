import 'package:flutter/material.dart';
import 'package:notes_app/widgets/custm_textfield.dart';
import 'package:notes_app/widgets/custom_appbar.dart';

class EditViewBody extends StatelessWidget {
  const EditViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        children: [
          SizedBox(height: 40,),
          CustomAppBar(icon: Icons.check, title: 'Edit',),
          SizedBox(height: 40,),
          CustomTextField(hintText: 'title'),
          SizedBox(height: 15,),
          CustomTextField(hintText: 'content' , maxLine: 5,)

        ],
      ),
    );
  }
}
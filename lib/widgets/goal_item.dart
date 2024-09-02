import 'package:flutter/material.dart';
import 'package:goals/widgets/show_dialog_edit_goals.dart';

Widget goalItem(index,context, id, goalName) => InkWell(
      onTap: () {

        buildShowDialogEditGoals(index,context, id);
      },
      child: Container(
        height: 80,
        margin: const EdgeInsets.all(8),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            boxShadow: const [
              BoxShadow(
                  color: Colors.black, blurRadius: 5, offset: Offset(2, 2))
            ],
            gradient: LinearGradient(begin: Alignment.bottomRight, colors: [
              Colors.blue,
              Colors.blue[900]!,
            ])),
        child: Center(
          child: Text(
            '$id : $goalName',
            style: const TextStyle(
                fontSize: 17, color: Colors.white, fontWeight: FontWeight.w600),
          ),
        ),
      ),
    );

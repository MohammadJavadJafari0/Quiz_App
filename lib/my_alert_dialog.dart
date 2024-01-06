// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors_in_immutables, sized_box_for_whitespace, prefer_const_constructors

import 'package:flutter/material.dart';

import 'custom_button.dart';

class MyAlertDialog extends StatelessWidget {
  final VoidCallback onYesPressed, onExitPressed;
  final int currentQuestionNumber;

  MyAlertDialog(
      this.onYesPressed, this.onExitPressed, this.currentQuestionNumber);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      title: Text('آیا میخوای دوباره تعیین سطح بشی؟'),
      content: Container(
        width: 300,
        child: Row(
          children: [
            Expanded(
              child: Custom_Button('بله', Colors.red, currentQuestionNumber,
                  onYesPressed, 50, 40),
            ),
            SizedBox(
              width: 15,
            ),
            Expanded(
              child: Custom_Button('خروج', Colors.red, currentQuestionNumber,
                  onExitPressed, 50, 40),
            ),
          ],
        ),
      ),
    );
  }
}

// ignore_for_file: camel_case_types, use_key_in_widget_constructors, prefer_const_constructors_in_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:quiz/question.dart';

class Custom_Button extends StatelessWidget {
  final String text;
  final Color color;
  final int currentQuestionNumber;
  final VoidCallback onTapped;
  final double width;
  final double height;

  Custom_Button(this.text, this.color, this.currentQuestionNumber,
      this.onTapped, this.width, this.height);

  @override
  Widget build(BuildContext context) {
    bool isLastQuestion = currentQuestionNumber == testList.length - 1;
    String displayText = isLastQuestion ? 'پایان آزمون' : text;
    return Material(
      color: color,
      borderRadius: BorderRadius.circular(20),
      child: InkWell(
        onTap: onTapped,
        borderRadius: BorderRadius.circular(20),
        child: Container(
          height: height,
          width: width,
          padding: EdgeInsets.symmetric(vertical: 15),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: Colors.black, width: 2),
          ),
          child: Center(
            child: Text(
              displayText,
              style: TextStyle(
                color: Colors.black,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

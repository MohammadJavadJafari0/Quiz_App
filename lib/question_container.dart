// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, must_be_immutable

import 'package:flutter/material.dart';
import 'package:quiz/question.dart';

class Questincontainer extends StatelessWidget {
  final int num;
  final List statusList;
  final int currentQuestionNumber;

  Questincontainer(this.num, this.statusList, this.currentQuestionNumber);

  Color color = Colors.grey;
  int temp = 0;
  int size = testList.length;

  @override
  Widget build(BuildContext context) {
    temp = num - 1;
    if (temp == currentQuestionNumber) {
      if (temp == size - 1 && statusList[temp] != 0) {
        if (statusList[temp] == true) {
          color = Colors.green;
        } else if (statusList[temp] == false) {
          color = Colors.red;
        } else {
          // pass
        }
      } else {
        color = Colors.white;
      }
    } else {
      // add exiting if here again
      if (statusList[temp] == true) {
        color = Colors.green;
      } //
      else if (statusList[temp] == false) {
        color = Colors.red;
      } else {
        // pass
      }
    }
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      height: 50,
      width: 50,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color,
        border: Border.all(color: Colors.black, width: 2),
      ),
      child: Center(
        child: Text(
          '$num',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}

// ignore_for_file: use_key_in_widget_constructors, must_be_immutable

import 'package:flutter/material.dart';
import 'package:quiz/question.dart';
import 'package:quiz/question_container.dart';

class QuestionListRow extends StatelessWidget {
  final List statusList;
  final int currentQuestionNumber;

  QuestionListRow(this.statusList, this.currentQuestionNumber);

  List<Widget> widgetsList = [];

  @override
  Widget build(BuildContext context) {
    widgetsList.clear();
    for (int i = 0; i < testList.length; i++) {
      widgetsList
          .add(Questincontainer(i + 1, statusList, currentQuestionNumber));
    }
    return Row(
      children: widgetsList,
    );
  }
}

// ignore_for_file: must_be_immutable, prefer_const_literals_to_create_immutables, prefer_const_constructors, non_constant_identifier_names, use_key_in_widget_constructors

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quiz/constant.dart';
import 'package:quiz/custom_button.dart';
import 'package:quiz/my_alert_dialog.dart';

class ResultScreen extends StatelessWidget {
  final bool isLastQuestion;
  final List<int> resultList;
  final int currentQuestionNumber;

  const ResultScreen(
      this.isLastQuestion, this.resultList, this.currentQuestionNumber);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Center(child: Text('مشاهده نتایج')),
        ),
        body: SafeArea(
          child: Stack(fit: StackFit.expand, children: [
            Image.asset(
              'assets/image/2.jpg',
              fit: BoxFit.cover,
            ),
            SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15, vertical: 20),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(color: Colors.black, width: 3),
                          color: const Color.fromARGB(255, 236, 234, 234)),
                      child: Column(
                        children: [
                          Center(
                              child: Text(
                            'تعداد پاسخ صحیح: ${resultList[0]}',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          )),
                          Center(
                              child: Text(
                            'تعداد پاسخ غلط: ${resultList[1]}',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          )),
                          Center(
                              child: Text(
                            'تعداد سوالات پاسخ داده نشده: ${resultList[2]}',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          )),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 300,
                  ),
                  Custom_Button('شروع مجدد', kgreen, currentQuestionNumber, () {
                    onDoAgain(context);
                  }, 140, 80),
                ],
              ),
            )
          ]),
        ));
  }

  void onDoAgain(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return MyAlertDialog(() {
          onYesPressed(context);
        }, () {
          onExitPressed(context);
        }, currentQuestionNumber);
      },
    );
  }

  void onYesPressed(BuildContext context) {
    Navigator.pop(context);
    Navigator.pop(context);
  }

  void onExitPressed(BuildContext context) {
    if (Platform.isAndroid) {
      SystemNavigator.pop();
    } else if (Platform.isIOS) {
      exit(0);
    } else {
      Navigator.pop(context);
      Navigator.pop(context);
      Navigator.pop(context);
    }
  }
}

// ignore_for_file: use_key_in_widget_constructors, camel_case_types, library_private_types_in_public_api, prefer_const_constructors, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:quiz/answer_container.dart';
import 'package:quiz/constant.dart';
import 'package:quiz/custom_button.dart';
import 'package:quiz/question.dart';
import 'package:quiz/questionListRow.dart';
import 'package:quiz/result_screen.dart';

class Quiz_screen extends StatefulWidget {
  @override
  _Quiz_screenState createState() => _Quiz_screenState();
}

class _Quiz_screenState extends State<Quiz_screen>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;

  late Size size;
  ScrollController scrollController = ScrollController();

  int currentQuestionNumber = 0;
  bool isOnPressed = false;
  // bool isLastQuestion = false;
  bool get isLastQuestion => currentQuestionNumber == testList.length - 1;

  List statusList = [];

  @override
  void initState() {
    super.initState();
    for (int i = 0; i < testList.length; i++) {
      statusList.add(0);
    }
    controller =
        AnimationController(duration: Duration(seconds: 30), vsync: this);
    animation = Tween(begin: 0.0, end: 1.0).animate(controller)
      ..addListener(() {
        setState(() {
          if ((animation.value * 100).round() >= 98) {
            onNextPressed(true); // calling onNextPressed function
            if (controller.isAnimating) {
              // add a new if for checking animating
              controller.reset();
              controller.forward();
            }
          }
        });
      });
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            'assets/image/2.jpg',
            fit: BoxFit.cover,
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: size.height * 0.07,
                    ),
                    Container(
                      height: 20,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        border: Border.all(
                          width: 2,
                          color: Colors.white,
                        ),
                      ),
                      child: LinearProgressIndicator(
                        borderRadius: BorderRadius.circular(25),
                        value: animation.value,
                        backgroundColor: Colors.white,
                        valueColor: AlwaysStoppedAnimation<Color>(kgreen),
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.05,
                    ),
                    SingleChildScrollView(
                      controller: scrollController,
                      scrollDirection: Axis.horizontal,
                      child: QuestionListRow(statusList, currentQuestionNumber),
                    ),
                    SizedBox(
                      height: size.height * 0.025,
                    ),
                    Divider(
                      color: Colors.white,
                    ),
                    SizedBox(
                      height: size.height * 0.025,
                    ),
                    SizedBox(
                      height: size.height * 0.2,
                      child: Text(
                        testList[currentQuestionNumber].question,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Answer_Container((isOnPressed) ? kgreen : Colors.white,
                        testList[currentQuestionNumber].answer1, () {
                      onAnswerPressed(1);
                    }),
                    SizedBox(
                      height: size.height * 0.03,
                    ),
                    Answer_Container((!isOnPressed) ? kgreen : Colors.white,
                        testList[currentQuestionNumber].answer2, () {
                      onAnswerPressed(2);
                    }),
                    SizedBox(
                      height: size.height * 0.07,
                    ),
                    Custom_Button('بعدی', kgreen, currentQuestionNumber, () {
                      controller.reset();
                      onNextPressed(false);
                      controller.forward();
                    }, 140, 80),
                    SizedBox(
                      height: size.height * 0.05,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void onNextPressed(bool isFromTimer) {
    scrollController.animateTo(currentQuestionNumber * 50.0,
        duration: Duration(milliseconds: 500), curve: Curves.ease);
    // add input for function because of controller
    if (isFromTimer == true) {
      statusList[currentQuestionNumber] = false;
    } else {
      checkAnswer();
    }
    if (currentQuestionNumber + 1 >= 10) {
      my_navigator();
      // go to resultscreen
    } else {
      currentQuestionNumber++;
    }
    setState(() {});
  }

  void checkAnswer() {
    // remove setstate
    int myAnswer = (isOnPressed) ? 1 : 2;
    bool status = testList[currentQuestionNumber].isRight(myAnswer);
    statusList[currentQuestionNumber] = status;
  }

  Future<void> my_navigator() async {
    controller.reset();
    List<int> resultList = grade();
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) =>
            ResultScreen(isLastQuestion, resultList, currentQuestionNumber),
      ),
    );

    reseter();
  }

  List<int> grade() {
    int rightAnswer = 0;
    int wrongAnswer = 0;
    int noAnswer = 0;

    for (var each in statusList) {
      if (each == true) {
        rightAnswer++;
      } else if (each == false) {
        wrongAnswer++;
      } else {
        noAnswer++;
      }
    }
    return [rightAnswer, wrongAnswer, noAnswer];
  }

  void reseter() {
    currentQuestionNumber = 0;
    isOnPressed = false;
    statusList.clear();
    for (int i = 0; i < testList.length; i++) {
      statusList.add(0);
    }
    controller.forward();
    scrollController.animateTo(currentQuestionNumber * 50.0,
        duration: Duration(milliseconds: 500), curve: Curves.ease);
    setState(() {});
  }

  void onAnswerPressed(int num) {
    if (num == 1) {
      setState(() {
        isOnPressed = true;
        // remove checkanswer
      });
    } else if (num == 2) {
      setState(() {
        isOnPressed = false;
        // remove checkanswer
      });
    } else {
      // handle later
    }
  }
}

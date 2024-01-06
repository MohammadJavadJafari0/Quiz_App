// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, non_constant_identifier_names, unnecessary_string_interpolations, avoid_print, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:quiz_demo3/constant.dart';
import 'package:quiz_demo3/question.dart';
import 'package:quiz_demo3/resultscreen.dart';

void main() {
  runApp(
    MaterialApp(
      home: MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;

  late Size size;
  ScrollController scrollController = ScrollController();

  int currentQuestionNumber = 0;
  bool isOnePressed = false;
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
            // change <= to >=
            onNextPressed(true); // calling onNextPressed function
            if (controller.isAnimating) {
              // add a new if for checking animating
              controller.reset();
              controller.forward();
            }
          }
        });
      });
    controller.forward(); // change controller.reapet with controller.forward
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
                      child: Row(
                        children: questionListRow(),
                      ),
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
                    answerContainer(testList[currentQuestionNumber].answer1, 1),
                    SizedBox(
                      height: size.height * 0.03,
                    ),
                    answerContainer(testList[currentQuestionNumber].answer2, 2),
                    SizedBox(
                      height: size.height * 0.07,
                    ),
                    Material(
                      color: kgreen,
                      borderRadius: BorderRadius.circular(20),
                      child: InkWell(
                        onTap: () {
                          controller.reset();
                          onNextPressed(false);
                          controller.forward();
                        },
                        borderRadius: BorderRadius.circular(20),
                        child: Container(
                          width: 150,
                          padding: EdgeInsets.symmetric(vertical: 15),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(color: Colors.black, width: 2),
                          ),
                          child: Center(
                            child: Text(
                              isLastQuestion ? 'پایان آزمون' : 'بعدی',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
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

  // functions

  List<Widget> questionListRow() {
    List<Widget> widgetsList = [];
    for (int i = 0; i < testList.length; i++) {
      widgetsList.add(questionContainer(i + 1));
    }
    return widgetsList;
  }

  Widget questionContainer(int num) {
    Color color = Colors.grey;
    int temp = num - 1;
    int size = testList.length; // change testlist.length-1 to testlist.length
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

  Widget answerContainer(String answer, int num) {
    return InkWell(
      onTap: () {
        if (num == 1) {
          setState(() {
            isOnePressed = true;
            // remove checkanswer
          });
        } else if (num == 2) {
          setState(() {
            isOnePressed = false;
            // remove checkanswer
          });
        } else {
          // handle later
        }
      },
      borderRadius: BorderRadius.circular(20),
      child: Container(
        padding: EdgeInsets.only(left: 20, right: 10, top: 10, bottom: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            width: 2,
            color: Colors.black,
          ),
          color: const Color.fromARGB(232, 255, 255, 255),
        ),
        child: Center(
          child: Row(
            children: [
              Expanded(
                child: Text(
                  '$answer',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(1), // تنظیم حاشیه برای آیکون
                decoration: BoxDecoration(
                  color: Colors.black, // رنگ حاشیه
                  shape: BoxShape.circle, // شکل حاشیه
                ),
                child: Icon(
                  Icons.brightness_1_rounded,
                  color: (isOnePressed && num == 1 || !isOnePressed && num == 2)
                      ? kgreen
                      : Colors.white,
                  size: 30,
                ),
              )
            ],
          ),
        ),
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
      // add reset and dispose
      // isLastQuestion = true;
      my_navigator();
      // go to resultscreen
    } //
    else {
      currentQuestionNumber++;
    }
    setState(() {});
  }

  void checkAnswer() {
    // remove setstate
    int myAnswer = (isOnePressed) ? 1 : 2;
    bool status = testList[currentQuestionNumber].isRight(myAnswer);
    statusList[currentQuestionNumber] = status;
  }

  Future<void> my_navigator() async {
    controller.reset();
    List<int> resultList = grade();
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ResultScreen(isLastQuestion, resultList),
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
    isOnePressed = false;
    statusList.clear();
    for (int i = 0; i < testList.length; i++) {
      statusList.add(0);
    }
    controller.forward();
    scrollController.animateTo(currentQuestionNumber * 50.0,
        duration: Duration(milliseconds: 500), curve: Curves.ease);
    setState(() {});
  }
}

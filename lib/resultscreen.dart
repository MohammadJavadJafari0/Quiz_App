// ignore_for_file: must_be_immutable, prefer_const_literals_to_create_immutables, prefer_const_constructors, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:quiz_demo3/constant.dart';

class ResultScreen extends StatelessWidget {
  final bool isLastQuestion;
  final List<int> resultList;

  const ResultScreen(this.isLastQuestion, this.resultList, {Key? key})
      : super(key: key);

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
            Column(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
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
                Material(
                  color: kgreen,
                  borderRadius: BorderRadius.circular(20),
                  child: InkWell(
                    onTap: () {
                      onDoAgain(context, isLastQuestion);
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
                          'شروع مجدد',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            )
          ]),
        ));
  }

  void onDoAgain(BuildContext context, bool isLastQuestion) {
    if (isLastQuestion) {
      Navigator.pop(context);
    } else {
      Navigator.popUntil(context, ModalRoute.withName('/'));
    }
  }
}

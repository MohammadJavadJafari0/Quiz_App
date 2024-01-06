// ignore_for_file: camel_case_types, use_key_in_widget_constructors, prefer_const_constructors, prefer_const_constructors_in_immutables, unnecessary_string_interpolations, unrelated_type_equality_checks

import 'package:flutter/material.dart';

class Answer_Container extends StatelessWidget {
  final Color color;
  final String answer;
  final VoidCallback onPressed;

  Answer_Container(this.color, this.answer, this.onPressed);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
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
                  color: color,
                  size: 30,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

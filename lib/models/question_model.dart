import 'package:flutter/material.dart';

class QuestionModel {
  String question;
  String heroImage;
  Color heroColor;
  List<String> options;
  String answer;

  QuestionModel({
    required this.question,
    required this.heroImage,
    required this.heroColor,
    required this.options,
    required this.answer,
  });
}

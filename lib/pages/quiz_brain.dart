import 'package:flutter/material.dart';
import 'package:proyectos/models/question_model.dart';

class Quizbrain {
  int questionIndex = 0;

  List<QuestionModel> questionList = [
    QuestionModel(
      question: "¿Cómo se llama el superhéroe?",
      heroImage: "assets/images/capitan_america.jpg",
      heroColor: Color(0xFF3B5BA5),
      options: [
        "El Americano",
        "Capitán Americano",
        "Capitán América",
        "Sr Capitán",
      ],
      answer: "Capitán América",
    ),
    QuestionModel(
      question: "¿Cómo se llama este superhéroe?",
      heroImage: "assets/images/iron_man.jpg",
      heroColor: Color(0xFFB22222),
      options: ["Iron Man", "Hombre de Hierro", "Tony Stark", "El Hombre Rojo"],
      answer: "Iron Man",
    ),
    QuestionModel(
      question: "¿Cómo se llama este superhéroe?",
      heroImage: "assets/images/spiderman.jpg",
      heroColor: Color(0xFFC49B2E),
      options: ["Araña", "Spider-Man", "Spider Boy", "Peter Man"],
      answer: "Spider-Man",
    ),
    QuestionModel(
      question: "¿Cómo se llama este superhéroe?",
      heroImage: "assets/images/batman.jpg",
      heroColor: Color(0xFF8B0000),
      options: ["Bat-Man", "El Murciélago", "Batman", "Bruce Man"],
      answer: "Batman",
    ),
    QuestionModel(
      question: "¿Cómo se llama este superhéroe?",
      heroImage: "assets/images/superman.jpg",
      heroColor: Color(0xFF1B1B2F),
      options: ["Superman", "Super Hombre", "Man of Steel", "Clark Man"],
      answer: "Superman",
    ),
  ];

  String getQuestion() {
    return questionList[questionIndex].question;
  }

  String getImage() {
    return questionList[questionIndex].heroImage;
  }

  List<String> getOptions() {
    return questionList[questionIndex].options;
  }

  bool checkAnswer(String userAnswer) {
    return userAnswer == questionList[questionIndex].answer;
  }

  void nextQuestion() {
    if (questionIndex < questionList.length - 1) {
      questionIndex++;
    }
  }

  int getQuestionNumber() {
    return questionIndex + 1;
  }
}

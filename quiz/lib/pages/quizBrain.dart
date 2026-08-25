import 'package:quiz/pages/models/question_model.dart';

class Quizbrain {
  int questionIndex = 0;

  List<QuestionModel> questionList = [
    QuestionModel(question: "¿Lima es la capital del Perú?", answer: true),
    QuestionModel(
      question: "¿Machu Picchu se encuentra en Cusco?",
      answer: true,
    ),
    QuestionModel(
      question: "¿El lago Titicaca está ubicado completamente dentro del Perú?",
      answer: false,
    ),
    QuestionModel(
      question: "¿La moneda oficial del Perú es el sol?",
      answer: true,
    ),
    QuestionModel(question: "¿El Perú limita con Brasil?", answer: true),
    QuestionModel(
      question: "¿La bandera del Perú tiene los colores rojo, blanco y rojo?",
      answer: true,
    ),
    QuestionModel(
      question: "¿Arequipa es conocida como la Ciudad Blanca?",
      answer: true,
    ),
    QuestionModel(
      question: "¿El río Amazonas nace en la costa del Perú?",
      answer: false,
    ),
    QuestionModel(
      question:
          "¿El ceviche es uno de los platos más representativos del Perú?",
      answer: true,
    ),
    QuestionModel(
      question: "¿El Perú tiene salida al océano Atlántico?",
      answer: false,
    ),
  ];

  String getQuestionText() {
    return questionList[questionIndex].question;
  }

  bool getQuestionAnswer() {
    return questionList[questionIndex].answer;
  }

  void nextQuestion() {
    if (questionIndex < questionList.length - 1) {
      questionIndex++;
    } else {
      print("Se acabaron las preguntas");
      questionIndex = 0;
    }
  }
}

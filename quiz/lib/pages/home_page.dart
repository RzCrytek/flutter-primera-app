import 'package:flutter/material.dart';
import 'package:quiz/pages/quizBrain.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Quizbrain quizbrain = Quizbrain();
  bool? respuestaCorrecta;

  void checkAnswer(bool userAnwer) {
    bool correctAnswer = quizbrain.getQuestionAnswer();
    if (userAnwer == correctAnswer) {
      print("verdadderoo");
      respuestaCorrecta = true;
    } else {
      print("La respuesta esta mal");
      respuestaCorrecta = false;
    }

    quizbrain.nextQuestion();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff2F3243),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color(0xff2F3243),
        title: Text("Quizz App", style: TextStyle(color: Colors.white)),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              flex: 5,
              child: Center(
                child: Text(
                  quizbrain.getQuestionText(),
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                child: MaterialButton(
                  color: Colors.greenAccent,
                  minWidth: double.infinity,
                  child: Text("Verdadero"),
                  onPressed: () {
                    checkAnswer(true);
                  },
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                child: MaterialButton(
                  color: Colors.redAccent,
                  minWidth: double.infinity,
                  child: Text("Falso"),
                  onPressed: () {
                    checkAnswer(false);
                  },
                ),
              ),
            ),

            if (respuestaCorrecta != null)
              Expanded(
                child: Text(
                  respuestaCorrecta!
                      ? '${quizbrain.questionIndex} - correcto'
                      : '${quizbrain.questionIndex} - incorrecto',
                  style: TextStyle(
                    color: respuestaCorrecta == true
                        ? Colors.greenAccent
                        : Colors.redAccent,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

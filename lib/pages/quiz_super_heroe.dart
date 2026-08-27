import 'package:flutter/material.dart';
import 'package:proyectos/pages/quiz_brain.dart';

class QuizSuperHeroe extends StatefulWidget {
  const QuizSuperHeroe({super.key});

  @override
  State<QuizSuperHeroe> createState() => _QuizSuperHeroeState();
}

class _QuizSuperHeroeState extends State<QuizSuperHeroe> {
  Quizbrain quizbrain = Quizbrain();

  bool? respuestaCorrecta;

  List<Color> colors = [
    const Color(0xFF5B4B9E), // morado
    const Color(0xFF2FB6A6), // turquesa
    const Color(0xFFE8B84B), // amarillo
    const Color(0xFFE05B5B), // rojo
  ];

  void checkAnswer(String userAnswer) {
    bool correct = quizbrain.checkAnswer(userAnswer);

    setState(() {
      respuestaCorrecta = correct;
    });

    if (quizbrain.questionIndex < quizbrain.questionList.length - 1) {
      setState(() {
        quizbrain.nextQuestion();
        respuestaCorrecta = null;
      });
    }
  }

  Widget answerButton(int index) {
    return Expanded(
      child: ElevatedButton(
        onPressed: respuestaCorrecta == null
            ? () => checkAnswer(quizbrain.getOptions()[index])
            : null,
        style: ElevatedButton.styleFrom(
          backgroundColor: colors[index],
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
        child: Text(
          quizbrain.getOptions()[index],
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quiz de Superhéroes'),
        centerTitle: true,
      ),

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12),

          child: Column(
            children: [
              // PREGUNTA
              Text(
                quizbrain.getQuestion(),
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 10),

              // IMAGEN
              Expanded(
                flex: 3,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(
                    quizbrain.getImage(),
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              const SizedBox(height: 10),

              // RESPUESTAS
              Expanded(
                flex: 5,
                child: Column(
                  children: [
                    Expanded(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          answerButton(0),
                          const SizedBox(width: 8),
                          answerButton(1),
                        ],
                      ),
                    ),

                    const SizedBox(height: 8),

                    Expanded(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          answerButton(2),
                          const SizedBox(width: 8),
                          answerButton(3),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 8),

              // Container(
              //   width: double.infinity,
              //   color: Colors.amber,
              //   alignment: Alignment.center,
              //   padding: const EdgeInsets.symmetric(vertical: 8),
              //   child: Text(
              //     '1 - Correcto',
              //     style: TextStyle(
              //       fontSize: 18,
              //       fontWeight: FontWeight.bold,
              //       color: Colors.green,
              //     ),
              //   ),
              // ),

              // RESULTADO
              if (respuestaCorrecta != null)
                Container(
                  width: double.infinity,
                  alignment: Alignment.center,
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Text(
                    '${quizbrain.getQuestionNumber()} - '
                    '${respuestaCorrecta! ? "Correcto" : "Incorrecto"}',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: respuestaCorrecta! ? Colors.green : Colors.red,
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

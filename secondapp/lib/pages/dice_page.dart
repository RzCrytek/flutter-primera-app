import 'dart:math';

import 'package:flutter/material.dart';

class DicePage extends StatefulWidget {
  DicePage({super.key});

  @override
  State<DicePage> createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  int nDado = 1;

  void aumentarDado() {
    setState(() {
      nDado = nDado == 6 ? 1 : nDado += 1;
    });
  }

  void disminuirDado() {
    setState(() {
      nDado = nDado == 1 ? 6 : nDado -= 1;
    });
  }

  void shuffleDado() {
    setState(() {
      nDado = Random().nextInt(6) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Dice Page')),
      body: Center(
        child: Column(
          mainAxisAlignment: .center,
          children: [
            Container(
              margin: EdgeInsets.all(32),
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(25),
              ),
              child: Image.asset("assets/images/dice$nDado.png"),
            ),

            Row(
              mainAxisAlignment: .spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    disminuirDado();
                  },
                  child: Icon(Icons.arrow_left_rounded, size: 50),
                ),
                ElevatedButton(
                  onPressed: () {
                    shuffleDado();
                  },
                  child: Icon(Icons.shuffle, size: 50),
                ),
                ElevatedButton(
                  onPressed: () {
                    aumentarDado();
                  },
                  child: Icon(Icons.arrow_right_rounded, size: 50),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class RetosContainer extends StatelessWidget {
  const RetosContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(bottom: 50),
        child: Center(
          child: Column(
            children: [
              Container(
                width: 350,
                height: 150,
                alignment: Alignment.bottomCenter,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(50),
                    bottomRight: Radius.circular(50),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.blue.withValues(alpha: 0.5),
                      blurRadius: 8,
                      spreadRadius: 5,
                      offset: const Offset(5, 5), // x, y
                    ),
                  ],
                ),
                child: Center(
                  child: Text(
                    "I am a header",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),

              SizedBox(
                width: 300,
                height: 80,
                child: Row(
                  children: [
                    Expanded(
                      flex: 8,
                      child: Container(
                        decoration: const BoxDecoration(
                          color: Color.fromARGB(255, 144, 202, 249),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(40),
                            bottomLeft: Radius.circular(40),
                          ),
                        ),
                        alignment: Alignment.centerLeft,
                        padding: const EdgeInsets.only(left: 24),
                        child: const Text(
                          "Challenge",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Container(
                        decoration: const BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(40),
                            bottomRight: Radius.circular(40),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 20),
              Container(
                width: 350,
                height: 150,
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.only(left: 24),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24),
                  gradient: const LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [Colors.red, Colors.orange],
                  ),
                ),
                child: Text(
                  "Challenge",
                  style: TextStyle(
                    color: Colors.white60,
                    fontSize: 30,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ),
              SizedBox(height: 20),
              Container(
                width: 300,
                height: 300,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(color: Colors.blue[300]),
                child: Text(
                  "Text",
                  style: TextStyle(color: Colors.indigo[900], fontSize: 30),
                ),
              ),
              SizedBox(height: 20),
              Container(
                width: 300,
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: Colors.blue[300],
                  borderRadius: BorderRadius.all(Radius.circular(25)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.blue[900]!.withValues(alpha: 1),
                      blurRadius: 5,
                      spreadRadius: 3,
                      offset: const Offset(5, 5), // x, y
                    ),
                  ],
                ),
                child: Center(
                  child: Text(
                    "I am a text",
                    style: TextStyle(color: Colors.indigo[900], fontSize: 40),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Container(
                width: 300,
                height: 300,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.deepPurple,
                  borderRadius: BorderRadius.all(Radius.circular(25)),
                ),

                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    width: double.infinity,
                    height: 100,
                    decoration: const BoxDecoration(
                      color: Colors.cyan,
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Container(
                width: 300,
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                  border: Border.all(color: Colors.indigo, width: 5),
                  gradient: const LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [Colors.white, Colors.lightBlue],
                  ),
                ),
                child: Center(
                  child: Text(
                    "I am a text",
                    style: TextStyle(color: Colors.blue[900], fontSize: 40),
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

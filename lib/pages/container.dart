import 'package:flutter/material.dart';

class ContainerPage extends StatelessWidget {
  const ContainerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Container(
                width: 100,
                height: 100,
                alignment: Alignment.bottomCenter,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  border: Border.all(color: Colors.orange, width: 5),
                ),
                child: Center(
                  child: Text(
                    "H",
                    style: TextStyle(color: Colors.orange, fontSize: 60),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Container(
                width: 100,
                height: 100,
                alignment: Alignment.bottomCenter,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  border: Border.all(color: Colors.orange, width: 5),
                ),
                child: Center(
                  child: Text(
                    "H",
                    style: TextStyle(color: Colors.orange, fontSize: 60),
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

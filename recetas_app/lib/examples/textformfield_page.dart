import 'package:flutter/material.dart';

class TextformfieldPage extends StatelessWidget {
  TextformfieldPage({super.key});

  final _formKey = GlobalKey<FormState>();
  TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("TextFormField Page")),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 18,
                    fontWeight: .bold,
                  ),
                  cursorColor: Colors.red, //Colors del cursor
                  cursorWidth: 10, //ancho del cursos
                  cursorHeight: 20, //ancho del cursor
                  cursorRadius: Radius.circular(
                    50,
                  ), //APLICAMOS REDONDEO AL CURSOR
                  textCapitalization: TextCapitalization.words,
                  decoration: InputDecoration(
                    labelText: "Correo",
                    filled: true,
                    fillColor: Colors.grey.shade300,
                    hintText: "xxxxxx@gmail,com",
                    hintStyle: TextStyle(fontWeight: FontWeight.w300),
                    helperText: "Ingresa tu Correo electrónico ",
                    prefix: Icon(Icons.person),
                    suffixIcon: Icon(Icons.check_circle),
                    // enabled: false,
                    border: OutlineInputBorder(
                      // borderSide: BorderSide(color: Colors.green, width: 4),
                      borderSide: BorderSide.none,
                    ),

                    enabledBorder: OutlineInputBorder(
                      // borderSide: BorderSide(color: Colors.green, width: 4),
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(25),
                    ),

                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue, width: 3),
                      borderRadius: BorderRadius.circular(10),
                    ),

                    focusedErrorBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.red, width: 2),
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

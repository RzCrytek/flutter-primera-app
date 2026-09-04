import 'package:flutter/material.dart';

class TextformfieldPage extends StatelessWidget {
  TextformfieldPage({super.key});

  final _formKey = GlobalKey<FormState>();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

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
                  controller: _emailController,
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
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
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "El campo no puede estar vacío";
                    } else if (value.length < 5) {
                      return "El correo debe tener al menos 5 caracteres";
                    } else if (value.length > 20) {
                      return "El correo no puede tener más de 20 caracteres";
                    } else if (!RegExp(
                      r'^[^@]+@[^@]+\.[^@]+$',
                    ).hasMatch(value)) {
                      return "El correo no es válido";
                    } else {
                      return null;
                    }
                  },
                ),
                SizedBox(height: 30),
                TextFormField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: "Contraseña",
                    filled: true,
                    fillColor: Colors.grey.shade300,
                    hintText: "********",
                    hintStyle: TextStyle(fontWeight: FontWeight.w300),
                    helperText: "Ingresa tu Contraseña ",
                    prefix: Icon(Icons.lock),
                    suffixIcon: Icon(Icons.check_circle),
                    border: OutlineInputBorder(borderSide: BorderSide.none),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "El campo no puede estar vacío";
                    } else if (value.length < 5) {
                      return "La contraseña debe tener al menos 5 caracteres";
                    } else if (value.length > 10) {
                      return "La contraseña no puede tener más de 10 caracteres";
                    } else {
                      return null;
                    }
                  },
                ),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text("Formulario enviado"),
                          backgroundColor: Colors.green,
                          duration: Duration(seconds: 2),
                        ),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text("Revisa las alertas del formulario"),
                          backgroundColor: Colors.red,
                          duration: Duration(seconds: 2),
                        ),
                      );
                    }
                  },
                  child: Text("Enviar Formulario"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

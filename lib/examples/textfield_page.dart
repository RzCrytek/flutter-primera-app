import 'package:flutter/material.dart';

class TextfieldPage extends StatefulWidget {
  @override
  State<TextfieldPage> createState() => _TextfieldPageState();
}

class _TextfieldPageState extends State<TextfieldPage> {
  String nombre = "";

  final TextEditingController nameController = TextEditingController();
  final TextEditingController apellidoController = TextEditingController();

  final FocusNode _focusNode = FocusNode();
  final FocusNode _focus1 = FocusNode();

  @override
  void dispose() {
    nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    nameController.text = "Jhonny";
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            mainAxisAlignment: .center,
            children: [
              Text("Hola"),
              TextField(
                focusNode: _focus1,
                controller: nameController,
                keyboardType: TextInputType.text, //teclado normal
                // keyboardType: TextInputType.number, //teclado numérico
                // keyboardType: TextInputType.emailAddress, //teclado correo
                // keyboardType: TextInputType.phone, //teclado telefono
                // keyboardType: TextInputType.multiline, //teclado multilinea
                // obscureText: true, //oculta el texto para contraseñas
                maxLength: 200, //limita la cantidad de caracteres
                maxLines: 3, //limita la cantidad de lineas
                readOnly: false, //solo ver el campo y no modificar
                enabled: true, //desactivar el campo
                style: TextStyle(
                  color: Colors.red,
                ), //controla el estilo del texto ingresado
                onChanged: (String valor) {
                  //se ejecuta cada que el usuario escribe algo
                  print(valor);
                  nombre = valor;
                },
                onSubmitted: (value) {
                  FocusScope.of(context).requestFocus(_focusNode);
                },
                decoration: InputDecoration(
                  counterText: "", //oculto el contador de caracteres
                  labelText:
                      "Nombre", //texto que aparece cuando el field no esta seleccionado
                  hint: Text(
                    "Ingresa tu nombre completo",
                  ), //texto de ayuda del field
                  prefixIcon: Icon(Icons.person), //icono a la izquierda
                  suffix: Icon(Icons.search), //icono a la derecha
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
              ),
              SizedBox(height: 32),
              TextField(
                focusNode: _focusNode,
                controller: apellidoController,
                maxLength: 200, //limita la cantidad de caracteres
                maxLines: 1, //limita la cantidad de lineas
                readOnly: false, //solo ver el campo y no modificar
                enabled: true, //desactivar el campo
                onSubmitted: (value) {
                  FocusScope.of(context).unfocus();
                },
                decoration: InputDecoration(
                  labelText:
                      "Apellido", //texto que aparece cuando el field no esta seleccionado
                  hint: Text("Ingresa tu Apellido"), //texto de ayuda del field
                  prefixIcon: Icon(Icons.person), //icono a la izquierda
                  suffix: Icon(Icons.search), //icono a la derecha
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
              ),

              ElevatedButton(
                onPressed: () {
                  // print(nombre);
                  print(nameController);
                  print(
                    nameController.text,
                  ); //obtenemos el texto que ingresa el usuario
                },
                child: Text("Imprimir variable nombre"),
              ),

              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  _focusNode.requestFocus();
                },
                child: Text("Enfocar textfield de contraseña"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

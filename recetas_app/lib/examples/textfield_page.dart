import 'package:flutter/material.dart';

class TextFieldPage extends StatefulWidget {
  TextFieldPage({super.key});

  @override
  State<TextFieldPage> createState() => _TextFieldPageState();
}

class _TextFieldPageState extends State<TextFieldPage> {
  final TextEditingController _controller = TextEditingController();

  bool _hasError = false;

  void _validarCorreo() {
    String correo = _controller.text;
    _hasError = !correo.contains("@");
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("TextFormField Page")),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                onChanged: (value) => _validarCorreo(),
                controller: _controller,
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
                  errorText: _hasError ? "Formato inválido" : null,
                  fillColor: Colors.grey.shade300,
                  hintText: "asdasd@gmail",
                  helperText: "Ingresa tu correo bien ",
                  prefix: Icon(Icons.person),
                  suffixIcon: _hasError
                      ? Icon(Icons.cancel)
                      : Icon(Icons.check_circle),
                  suffixIconColor: _hasError ? Colors.red : Colors.green,
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
              SizedBox(height: 32),
              ElevatedButton(
                onPressed: () {
                  print(_controller.text);
                  _validarCorreo();
                },
                child: Text("Validar"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

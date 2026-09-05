import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Login Page")),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            context.go("/profile");
          },
          child: Text("Iniciar sesión"),
        ),
      ),
    );
  }
}

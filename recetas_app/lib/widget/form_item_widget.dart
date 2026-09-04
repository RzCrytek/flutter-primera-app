import 'package:flutter/material.dart';

class FormItemWidget extends StatelessWidget {
  final TextEditingController controller;
  final IconData iconData;
  final String label;
  final int maxLines;
  final String? Function(String?)? validator;

  FormItemWidget({
    super.key,
    required this.controller,
    required this.iconData,
    required this.label,
    this.maxLines = 1,
    required this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: TextFormField(
        maxLines: maxLines,
        controller: controller,
        style: TextStyle(color: Colors.white, fontSize: 18),
        cursorColor: Colors.white,
        decoration: InputDecoration(
          labelText: label,
          labelStyle: TextStyle(color: Colors.white),
          filled: true,
          fillColor: Color(0xFF0F1E2b),
          hintStyle: TextStyle(fontWeight: .w300),
          prefixIcon: Icon(iconData, color: Colors.white),
          border: OutlineInputBorder(borderSide: BorderSide.none),
          enabledBorder: OutlineInputBorder(
            borderSide: .none,
            borderRadius: .circular(25),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: .none,
            borderRadius: .circular(25),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red, width: 2),
            borderRadius: .circular(25),
          ),
        ),
        validator: validator,
        // validator: (value) {
        //   if (value == null || value.isEmpty) {
        //     return "Por favor ingresa el título de la receta";
        //   } else {
        //     return null;
        //   }
        // },
      ),
    );
  }
}

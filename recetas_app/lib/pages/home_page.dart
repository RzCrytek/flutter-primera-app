import 'package:flutter/material.dart';
import 'package:recetas_app/models/receta_model.dart';
import 'package:recetas_app/widget/form_item_widget.dart';
import 'package:recetas_app/widget/receta_card_widget.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController _titleController = TextEditingController();

  TextEditingController _preparationController = TextEditingController();

  TextEditingController _imageController = TextEditingController();

  List<RecetaModel> recetasList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFF152B3E),
      appBar: AppBar(
        backgroundColor: Color(0XFF152B3E),
        title: Text("App de Recetas", style: TextStyle(color: Colors.white)),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 32),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: .start,
            children: [
              FormItemWidget(
                controller: _titleController,
                iconData: Icons.title,
                label: "Ingresa el título",
                validator: (p0) {
                  if (p0 == null || p0.isEmpty) {
                    return "return el título es obligatorio";
                  } else if (p0.length < 3) {
                    return "El título debe tener mínimo 3 caracteres";
                  } else {
                    return null;
                  }
                },
              ),
              FormItemWidget(
                controller: _preparationController,
                iconData: Icons.list,
                label: "Ingresa pa preparación",
                maxLines: 3,
                validator: (p0) {
                  if (p0 == null || p0.isEmpty) {
                    return "La prepararación es obligatorio";
                  } else if (p0.length < 10) {
                    return "El título debe tener mínimo 10 caracteres";
                  } else {
                    return null;
                  }
                },
              ),
              FormItemWidget(
                controller: _imageController,
                iconData: Icons.image,
                label: "Ingresa la url de imagen",
                validator: (p0) {
                  if (p0 == null || p0.isEmpty) {
                    return "La imagen es obligatoria";
                  } else if (!p0.startsWith("http")) {
                    return "Ingresa un url válida";
                  } else {
                    return null;
                  }
                },
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      print("Formulario válido");
                      RecetaModel recetaModelAux = RecetaModel(
                        title: _titleController.text,
                        preparation: _preparationController.text,
                        urlImage: _imageController.text,
                      );
                      recetasList.add(recetaModelAux);
                      _titleController.clear();
                      _preparationController.clear();
                      _imageController.clear();
                      setState(() {});
                    } else {
                      print("Formulario inválido");
                    }
                  },
                  child: Text("Registrar receta"),
                ),
              ),
              ...recetasList.map((receta) {
                return RecetaCardWidget(recetaModel: receta);
              }).toList(),
            ],
          ),
        ),
      ),
    );
  }
}

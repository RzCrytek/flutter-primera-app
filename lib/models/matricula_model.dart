import 'package:proyectos/models/carrera_model.dart';
import 'package:proyectos/models/persona_model.dart';

class MatriculaModel {
  String fecha;
  String hora;
  PersonaModel persona;
  CarreraModel carrera;

  MatriculaModel({
    required this.fecha,
    required this.hora,
    required this.persona,
    required this.carrera,
  });
}

MatriculaModel matricula1 = MatriculaModel(
  fecha: "20/08/26",
  hora: "22:16",
  persona: persona1,
  carrera: softwareCarrera,
);

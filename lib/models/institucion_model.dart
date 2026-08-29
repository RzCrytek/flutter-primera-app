import 'package:proyectos/models/matricula_model.dart';

class InstitucionModel {
  String nombre;
  String direccion;
  String ruc;
  String telefono;
  List<MatriculaModel> matriculas;

  InstitucionModel({
    required this.nombre,
    required this.direccion,
    required this.ruc,
    required this.telefono,
    required this.matriculas,
  });
}

InstitucionModel tecsup = InstitucionModel(
  nombre: "Tecsup",
  direccion: "Av limas 132",
  ruc: "202020131313",
  telefono: "123456789",
  matriculas: [matricula1],
);

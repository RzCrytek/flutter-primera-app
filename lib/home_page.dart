import 'package:flutter/material.dart';
import 'package:proyectos/models/carrera_model.dart';
import 'package:proyectos/models/institucion_model.dart';
import 'package:proyectos/models/matricula_model.dart';
import 'package:proyectos/models/persona_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<InstitucionModel> instituciones = [];
  int? expandedIndex;

  final TextEditingController nameController = TextEditingController();
  final FocusNode nameFocusNode = FocusNode();

  void _editarNombreInstitucion(InstitucionModel institution) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        nameController.text = institution.nombre;
        return AlertDialog(
          title: Row(
            mainAxisAlignment: .center,
            children: [Expanded(child: Text("Editar nombre de Institución"))],
          ),
          content: TextField(
            focusNode: nameFocusNode,
            controller: nameController,
            keyboardType: TextInputType.text,
          ),
          actions: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green[900],
                foregroundColor: Colors.white,
              ),
              onPressed: () {
                institution.nombre = nameController.text;
                Navigator.pop(context);
                setState(() {});
              },
              child: Text("Cambiar"),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red[900],
                foregroundColor: Colors.white,
              ),
              onPressed: () {
                Navigator.pop(context);
                setState(() {});
              },
              child: Text("Cancelar"),
            ),
          ],
        );
      },
    );
  }

  void eliminarMatricula(
    InstitucionModel institucion,
    MatriculaModel matricula,
  ) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Row(
            children: [
              Text("Confirmar eliminación"),
              SizedBox(width: 16),
              Icon(Icons.warning, color: Colors.amber),
            ],
          ),
          content: Text(
            "¿Estas seguro de eliminar la matrícula de ${matricula.persona.nombre} ${matricula.persona.apellido}?",
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("Cancelar"),
            ),
            ElevatedButton(
              onPressed: () {
                institucion.matriculas.remove(matricula);

                Navigator.pop(context);

                setState(() {});
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                foregroundColor: Colors.white,
              ),
              child: Text("Eliminar"),
            ),
          ],
        );
      },
    );
  }

  void _eliminarMatriculas(InstitucionModel institucion) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Row(
            children: [
              Text("Limpiar matrículas"),
              SizedBox(width: 16),
              Icon(Icons.warning, color: Colors.amber),
            ],
          ),
          content: Text(
            "Estas seguro de eliminar TODAS las matrículas de ${institucion.nombre}",
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("Cancelar"),
            ),
            ElevatedButton(
              onPressed: () {
                institucion.matriculas.clear();
                Navigator.pop(context);
                setState(() {});
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                foregroundColor: Colors.white,
              ),
              child: Text("Eliminar"),
            ),
          ],
        );
      },
    );
  }

  Widget buildMatriculaTile(
    MatriculaModel matricula,
    InstitucionModel institucion,
  ) {
    return ListTile(
      title: Text("${matricula.persona.nombre} ${matricula.persona.apellido}"),
      subtitle: Text(
        "${matricula.carrera.nombre} - ${matricula.carrera.duracion}",
      ),
      leading: CircleAvatar(
        radius: 25,
        child: Text(matricula.persona.nombre[0]),
      ),
      trailing: IconButton(
        onPressed: () {
          eliminarMatricula(institucion, matricula);
        },
        icon: Icon(Icons.delete, color: Colors.red),
      ),
    );
  }

  Widget _buildCabeceraInstitucion(InstitucionModel institucion) {
    bool limiteMatriculas = institucion.matriculas.length >= 5;
    bool hayMatriculas = institucion.matriculas.isNotEmpty;
    return Row(
      mainAxisAlignment: .center,
      children: [
        Text("${institucion.nombre} - ${institucion.matriculas.length}"),
        IconButton(
          onPressed: limiteMatriculas
              ? null
              : () {
                  PersonaModel eliasEstudiante = PersonaModel(
                    nombre: "Elias",
                    apellido: "Cutire",
                    direccion: "Av sosa 123",
                  );

                  CarreraModel arquiCarrera = CarreraModel(
                    "Arquitectura",
                    "5 AÑOS",
                  );
                  institucion.matriculas.add(
                    MatriculaModel(
                      fecha: "21/08/26",
                      hora: "15;30",
                      persona: eliasEstudiante,
                      carrera: arquiCarrera,
                    ),
                  );
                  setState(() {});
                },
          icon: Icon(Icons.add),
        ),
        IconButton(
          onPressed: !hayMatriculas
              ? null
              : () {
                  _eliminarMatriculas(institucion);
                },
          icon: Icon(Icons.cleaning_services),
        ),
        IconButton(
          onPressed: () {
            _editarNombreInstitucion(institucion);
          },
          icon: Icon(Icons.edit),
        ),
      ],
    );
  }

  Widget _buildExpansionInstitucion(int index, InstitucionModel institucion) {
    return ExpansionTile(
      key: ValueKey("expansionTile_$index${expandedIndex == index}"),
      initiallyExpanded: expandedIndex == index,
      title: _buildCabeceraInstitucion(institucion),
      onExpansionChanged: (bool isOpen) {
        expandedIndex = isOpen ? index : null;
        setState(() {});
      },
      children: institucion.matriculas.map((matricula) {
        return buildMatriculaTile(matricula, institucion);
      }).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // MatriculaModel matriculaModel = MatriculaModel(
          //   fecha: "19/18/26",
          //   hora: "10:00",
          //   persona: persona1,
          //   carrera: softwareCarrera,
          // );

          // tecsup.matriculas.add(matriculaModel);
          // instituciones.add(tecsup);
          instituciones.add(
            InstitucionModel(
              nombre: "ULIMA",
              direccion: "LIMA123",
              ruc: "9876543216549872",
              telefono: "3216549872",
              matriculas: [],
            ),
          );

          setState(() {});
        },
        child: Icon(Icons.add),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            for (int i = 0; i < instituciones.length; i++)
              _buildExpansionInstitucion(i, instituciones[i]),

            // ...tecsup.matriculas.map((e) {
            //   return buildMatriculaTile();
            // }).toList(),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:proyectos/data_general.dart';
import 'package:proyectos/widgets/field_widget.dart';
import 'package:proyectos/widgets/item_type_widget.dart';

class RegisterModalWidget extends StatefulWidget {
  RegisterModalWidget({super.key});

  @override
  State<RegisterModalWidget> createState() => _RegisterModalWidgetState();
}

class _RegisterModalWidgetState extends State<RegisterModalWidget> {
  TextEditingController _titleController = TextEditingController();

  TextEditingController _priceController = TextEditingController();

  TextEditingController _dateController = TextEditingController();

  Widget _buildAddButton() {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
        onPressed: () {},
        child: Text("Añadir", style: TextStyle(color: Colors.white)),
      ),
    );
  }

  void showSelectorFecha() async {
    DateTime? selectDay = await showDatePicker(
      context: context,
      firstDate: DateTime(2020),
      lastDate: DateTime(2030),
      initialDate: DateTime.now(),
      helpText: "Selecciona una fecha",
      cancelText: "Cancelar",
      confirmText: "Aceptar",
      fieldHintText: "dd/mm/aaaa",
      fieldLabelText: "Fecha",
      // Para deshabilitar algunos días
      selectableDayPredicate: (day) {
        return day.weekday != DateTime.sunday;
      },
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary: Colors.cyan, //Color del encabezado y seleccion
              onPrimary: Colors.red, //texto del encabezado
              onSurface: Colors.blue, //texto del calendario
            ),
            dialogTheme: DialogThemeData(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadiusGeometry.circular(45),
              ),
            ),
          ),
          child: child!,
        );
      },
    );
    if (selectDay != null) {
      _dateController.text =
          "${selectDay.day}/${selectDay.month}/${selectDay.year}";
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text("Registra tu pago", style: TextStyle(fontSize: 22)),
          SizedBox(height: 12),
          FieldWidget(
            controller: _titleController,
            hintText: "Ingresa el nombre del gasto",
          ),
          FieldWidget(
            controller: _priceController,
            hintText: "Ingresa el monto",
          ),
          FieldWidget(
            controller: _dateController,
            hintText: "Ingresa la fecha",
            function: showSelectorFecha,
          ),

          Wrap(
            spacing: 8,
            runSpacing: 8,
            alignment: WrapAlignment.center,
            children: types.map((e) => ItemTypeWidget(data: e)).toList(),
          ),

          SizedBox(height: 8),

          _buildAddButton(),
        ],
      ),
    );
  }
}

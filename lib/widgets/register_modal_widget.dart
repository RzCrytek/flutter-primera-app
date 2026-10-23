import 'package:flutter/material.dart';
import 'package:proyectos/data_general.dart';
import 'package:proyectos/database/db_helper_expenses.dart';
import 'package:proyectos/widgets/field_widget.dart';
import 'package:proyectos/widgets/item_type_widget.dart';

class RegisterModalWidget extends StatefulWidget {
  const RegisterModalWidget({super.key});

  @override
  State<RegisterModalWidget> createState() => _RegisterModalWidgetState();
}

class _RegisterModalWidgetState extends State<RegisterModalWidget> {
  final _titleController = TextEditingController();
  final _priceController = TextEditingController();
  final _dateController = TextEditingController();
  final _dbHelper = DbHelperExpenses();
  DateTime? _selectedDate;
  Map<String, dynamic>? _selectedType;
  bool _isSaving = false;

  Widget _buildAddButton() {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
        onPressed: _isSaving ? null : _addExpense,
        child: _isSaving
            ? const SizedBox(
                width: 22,
                height: 22,
                child: CircularProgressIndicator(color: Colors.white),
              )
            : const Text("Añadir", style: TextStyle(color: Colors.white)),
      ),
    );
  }

  Future<void> showSelectorFecha() async {
    final selectDay = await showDatePicker(
      context: context,
      firstDate: DateTime(2020),
      lastDate: DateTime.now(),
      initialDate: DateTime.now(),
      helpText: "Selecciona una fecha",
      cancelText: "Cancelar",
      confirmText: "Aceptar",
      fieldHintText: "dd/mm/aaaa",
      fieldLabelText: "Fecha",
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
    if (selectDay != null && mounted) {
      _selectedDate = selectDay;
      _dateController.text =
          "${selectDay.day}/${selectDay.month}/${selectDay.year}";
      setState(() {});
    }
  }

  Future<void> _addExpense() async {
    final title = _titleController.text.trim();
    final amount = double.tryParse(
      _priceController.text.trim().replaceAll(",", "."),
    );

    if (title.isEmpty ||
        amount == null ||
        !amount.isFinite ||
        amount <= 0 ||
        _selectedDate == null ||
        _selectedType == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            "Completa el nombre, un monto válido, la fecha y la categoría.",
          ),
        ),
      );
      return;
    }

    setState(() => _isSaving = true);
    try {
      await _dbHelper.insertExpense(
        title: title,
        amount: amount,
        date: _selectedDate!,
        categoryId: _selectedType!["id"] as int,
        categoryName: _selectedType!["name"] as String,
        categoryImage: _selectedType!["image"] as String,
      );
      if (mounted) {
        Navigator.of(context).pop(true);
      }
    } catch (error) {
      if (mounted) {
        setState(() => _isSaving = false);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("No se pudo guardar el gasto: $error")),
        );
      }
    }
  }

  @override
  void dispose() {
    _titleController.dispose();
    _priceController.dispose();
    _dateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: MediaQuery.viewInsetsOf(context).bottom),
      child: SingleChildScrollView(
        child: Container(
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
                children: types
                    .map(
                      (type) => ItemTypeWidget(
                        data: type,
                        isSelected: _selectedType?["id"] == type["id"],
                        onTap: () => setState(() => _selectedType = type),
                      ),
                    )
                    .toList(),
              ),
              SizedBox(height: 8),
              _buildAddButton(),
            ],
          ),
        ),
      ),
    );
  }
}

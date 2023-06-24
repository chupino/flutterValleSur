import 'package:apitest3/core/constants/color_palatte.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CustomSelectDateFormField extends StatelessWidget {
  const CustomSelectDateFormField({
    required this.label,
    required this.controller,
    this.hint,
    super.key
    });
  final TextEditingController controller;
  final String? label;
  final String? hint;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: const TextStyle(color: Colors.white),
      readOnly: true,
      controller: controller,
      decoration: InputDecoration(
          labelStyle: TextStyle(color: Colors.grey[500]),
          labelText: label,
          floatingLabelStyle: const TextStyle(color: Colors.white),
          floatingLabelBehavior: FloatingLabelBehavior.auto,
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Color.fromARGB(255, 81, 81, 81)),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: ColorPalette.formFieldBorderColor),
          ),
          fillColor: const Color.fromARGB(255, 19, 12, 17),
          filled: true,
          hintText: hint,
          hintStyle: TextStyle(color: Colors.grey[500])),
      onChanged: (value) {

      },
      onTap: () async {
        DateTime? pickedDate = await showDatePicker(
            confirmText: "Aceptar",
            cancelText: "Cancelar",
            builder: (BuildContext context, Widget? child) {
              return child!;
            },
            context: context,
            initialDate: DateTime(1900),
            firstDate: DateTime(1900),
            lastDate: DateTime(2023));
        if (pickedDate != null) {
          controller.text =
              DateFormat("dd-MM-yyyy").format(pickedDate);
        }
      },
      validator: (value) {
        if (value!.isEmpty) {
          return 'Campo Obligatorio';
        }
        return null;
      },
    );
  }
}

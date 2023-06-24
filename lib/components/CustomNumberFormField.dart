import 'package:apitest3/core/constants/color_palatte.dart';
import 'package:flutter/material.dart';

class CustomNumberFormField extends StatelessWidget {
  const CustomNumberFormField({
    required this.label,
    this.hint,
    required this.controller,
    super.key
    });
  final TextEditingController controller;
  final String label;
  final String? hint;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: const TextStyle(color: Colors.white),
      keyboardType: TextInputType.phone,
      controller: controller,
      decoration: InputDecoration(
          labelStyle: TextStyle(color: Colors.grey[500]),
          labelText: label,
          floatingLabelStyle: const TextStyle(color: Colors.white),
          floatingLabelBehavior: FloatingLabelBehavior.auto,
          enabledBorder: const OutlineInputBorder(
            borderSide:
                BorderSide(color: const Color.fromARGB(255, 81, 81, 81)),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: ColorPalette.formFieldBorderColor),
          ),
          fillColor: const Color.fromARGB(255, 19, 12, 17),
          filled: true,
          hintText: hint,
          hintStyle: TextStyle(color: Colors.grey[500])),
      onChanged: (value) {
        if (value.length > 9) {
          controller.text = value.substring(0, 9);
        }
      },
      validator: (value) {
        if (value!.isEmpty) {
          return 'Campo obligatorio';
        }
        if (value.length != 9) {
          return 'El número debe tener exactamente 9 dígitos';
        }
        // Validación adicional según tus necesidades
        return null;
      },
      onSaved: (value) {
        // Aquí puedes guardar el valor ingresado por el usuario
      },
    );
  }
}

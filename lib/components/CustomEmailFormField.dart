import 'package:apitest3/core/constants/color_palatte.dart';
import 'package:flutter/material.dart';

class CustomEmailFormField extends StatelessWidget {
  final TextEditingController controller;
  final Function(String?)? onChanged;
  const CustomEmailFormField({
    this.onChanged,
    required this.controller,
    super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: const TextStyle(color: Colors.white),
      keyboardType: TextInputType.emailAddress,
      controller: controller,
      
      cursorColor: ColorPalette.primaryColor,
      decoration: InputDecoration(
        focusColor: ColorPalette.primaryColor,
          labelStyle: TextStyle(color: Colors.grey[500]),
          labelText: "Correo Electrónico",
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
          hintText: "Correo Electrónico",
          hintStyle: TextStyle(color: Colors.grey[500])),
      onChanged: onChanged,
      validator: (value) {
        if (value!.isEmpty) {
          return 'Campo obligatorio';
        }
        if (!RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$')
            .hasMatch(value)) {
          return 'Dirección de correo electrónico no válida';
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

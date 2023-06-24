import 'package:apitest3/core/constants/color_palatte.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField(
      {required this.label,
      required this.hintText,
      this.controller,
      this.onChanged,
      this.enableFloatingLabel=true,
      this.color,
      this.colorBorder,
      this.readOnly,
      super.key});
  final String? label;
  final bool? enableFloatingLabel;
  final bool? readOnly;
  final Color? colorBorder;
  final String hintText;
  final Color? color;
  final TextEditingController? controller;
  final Function(String?)? onChanged;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: const TextStyle(color: Colors.white),
      controller: controller,
      readOnly: readOnly??false,
      onChanged: onChanged,
      decoration: InputDecoration(
          labelStyle: TextStyle(color: Colors.grey[500]),
          labelText: label,
          floatingLabelStyle: const TextStyle(color: Colors.white),
          floatingLabelBehavior: enableFloatingLabel!?FloatingLabelBehavior.auto:FloatingLabelBehavior.never,
          enabledBorder:  OutlineInputBorder(
            borderSide: BorderSide(color: colorBorder??Color.fromARGB(255, 81, 81, 81)),
          ),
          focusedBorder:  OutlineInputBorder(
            borderSide: BorderSide(color: colorBorder??ColorPalette.formFieldBorderColor),
          ),
          fillColor: color??Color.fromARGB(255, 19, 12, 17),
          
          filled: true,
          hintText: hintText,
          hintStyle: TextStyle(color: Colors.grey[500])),
      validator: (value) {
        if (value!.isEmpty) {
          return 'Campo Obligatorio';
        }
        return null;
      },
      onSaved: (value) {
        // Aquí puedes guardar el valor ingresado por el usuario
      },
    );
  }
}

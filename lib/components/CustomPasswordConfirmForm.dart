import 'package:apitest3/components/hr.dart';
import 'package:apitest3/core/constants/color_palatte.dart';
import 'package:flutter/material.dart';

class CustomPasswordConfirmForm extends StatelessWidget {
  final TextEditingController controllerPass;
  final TextEditingController controllerConfirmPass;
  const CustomPasswordConfirmForm(
      {super.key,
      required this.controllerPass,
      required this.controllerConfirmPass});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      TextFormField(
        controller: controllerPass,
        validator: (val) {
          if (val!.isEmpty) return 'Vacio';
          return null;
        },
        obscureText: true,
        style: const TextStyle(color: Colors.white),
        decoration: InputDecoration(
            labelStyle: TextStyle(color: Colors.grey[500]),
            labelText: "Contraseña",
            floatingLabelStyle: const TextStyle(color: Colors.white),
            floatingLabelBehavior: FloatingLabelBehavior.auto,
            suffixIcon: const Icon(
              Icons.visibility_off,
              color: Colors.white,
            ),
            enabledBorder: const OutlineInputBorder(
              borderSide:
                  BorderSide(color: const Color.fromARGB(255, 81, 81, 81)),
            ),
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: ColorPalette.formFieldBorderColor),
            ),
            fillColor: const Color.fromARGB(255, 19, 12, 17),
            filled: true,
            hintText: "Contraseña",
            hintStyle: TextStyle(color: Colors.grey[500])),
      ),
      const hr(),
      TextFormField(
          controller: controllerConfirmPass,
          onChanged: (value) {},
          obscureText: true,
          style: const TextStyle(color: Colors.white),
          decoration: InputDecoration(
              labelStyle: TextStyle(color: Colors.grey[500]),
              suffixIcon: const Icon(
                Icons.visibility_off,
                color: Colors.white,
              ),
              enabledBorder: const OutlineInputBorder(
                borderSide:
                    BorderSide(color: const Color.fromARGB(255, 81, 81, 81)),
              ),
              focusedBorder: const OutlineInputBorder(
                borderSide:
                    BorderSide(color: ColorPalette.formFieldBorderColor),
              ),
              fillColor: const Color.fromARGB(255, 19, 12, 17),
              filled: true,
              hintText: "Confirmar contraseña",
              hintStyle: TextStyle(color: Colors.grey[500]),
              labelText: "Confirmar contraseña",
              floatingLabelStyle: const TextStyle(color: Colors.white),
              floatingLabelBehavior: FloatingLabelBehavior.auto),
          validator: (val) {
            if (val!.isEmpty) return 'Vacio';
            if (val != controllerPass.text) return 'No coincide';
            return null;
          })
    ]);
  }
}

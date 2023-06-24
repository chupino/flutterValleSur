import 'package:apitest3/core/constants/color_palatte.dart';
import 'package:flutter/material.dart';

class CustomPasswordTextField extends StatefulWidget {
  final controller;
  final String hintText;
  final bool obscureText;
  final String? Function(String?)? validator;
  const CustomPasswordTextField({
    super.key,
    this.validator,
    required this.controller,
    required this.hintText,
    required this.obscureText,
  });

  @override
  State<CustomPasswordTextField> createState() =>
      _CustomPasswordTextFieldState();
}

class _CustomPasswordTextFieldState extends State<CustomPasswordTextField> {
  bool _obscureText = true;
  void _togglePasswordVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: widget.validator,
      controller: widget.controller,
      obscureText: _obscureText,
      style: TextStyle(color: Colors.white),
      cursorColor: ColorPalette.primaryColor,
      decoration: InputDecoration(
        iconColor: Colors.white,
        focusColor: ColorPalette.primaryColor,
          suffixIcon: IconButton(
            onPressed: () {
              _togglePasswordVisibility();
            },
            color: ColorPalette.iconColor,
            icon: _obscureText
                ? const Icon(Icons.visibility_off)
                : const Icon(Icons.visibility),
          ), //const Icon(Icons.visibility_off,color: Colors.white,),
          enabledBorder: const OutlineInputBorder(
            borderSide:
                BorderSide(color: const Color.fromARGB(255, 81, 81, 81)),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: ColorPalette.formFieldBorderColor),
          ),
          fillColor: Color.fromARGB(255, 19, 12, 17),
          filled: true,
          hintText: widget.hintText,
          hintStyle: TextStyle(color: Colors.grey[500])),
    );
  }
}

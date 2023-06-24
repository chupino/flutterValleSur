import 'package:apitest3/core/constants/color_palatte.dart';
import 'package:apitest3/core/constants/textstyle_ext.dart';
import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

class CustomDropdownFormField extends StatelessWidget {
  final Function(String?) onChanged;
  final List<String> elementos;
  final String hint;
  const CustomDropdownFormField({super.key, required this.onChanged, required this.elementos, required this.hint});
  @override
  Widget build(BuildContext context) {
    String? selectedItem;
    String defaultItem = "Seleccione un valor";
    return DropdownButtonFormField2(
        value: selectedItem,
        validator: (value) {
          if (value == defaultItem || value==null) {
            return "Campo obligatorio";
          }
          return null;
        },
        hint: Text(
          hint,
          textAlign: TextAlign.start,
          style: TextStyle(
            fontSize: 14,
            color: ColorPalette.formFieldLabelColor,
          ),
        ),
        dropdownStyleData: DropdownStyleData(
            decoration: BoxDecoration(color: ColorPalette.primaryColor)),
        style: TextStyles.defaultStyle.text1Color,
        decoration: InputDecoration(
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Color.fromARGB(255, 81, 81, 81)),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: ColorPalette.formFieldBorderColor),
          ),
          fillColor: const Color.fromARGB(255, 19, 12, 17),
          filled: true,
          hintText: defaultItem,
          hintStyle: TextStyle(color: Colors.grey[500]),
        ),
        onChanged: onChanged,
        items: elementos
            .map((e) => DropdownMenuItem(
                  child: Text(e),
                  value: e,
                ))
            .toList());
/* DropdownButtonFormField<String>(
  style: const TextStyle(color: Colors.white),
  dropdownColor: ColorPalette.primaryColor,
  validator: (value) {
    if (value == defaultSex) {
      return "Campo obligatorio";
    }
    return null;
  },
  value: selectedSex.isNotEmpty ? selectedSex : defaultSex,
  items: sexos.map((sexo) {
    return DropdownMenuItem<String>(
      value: sexo,
      child: Text(sexo),
    );
  }).toList(),
  onChanged: (value) {
    if (value != defaultSex) {
      selectedSex = value!;
      print(selectedSex);
    }
  },
  decoration: InputDecoration(
    enabledBorder: const OutlineInputBorder(
      borderSide: BorderSide(color: Color.fromARGB(255, 81, 81, 81)),
    ),
    focusedBorder: const OutlineInputBorder(
      borderSide: BorderSide(color: ColorPalette.formFieldBorderColor),
    ),
    fillColor: const Color.fromARGB(255, 19, 12, 17),
    filled: true,
    hintText: defaultSex,
    hintStyle: TextStyle(color: Colors.grey[500]),
  ),
); */
  }
}

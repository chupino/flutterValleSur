import 'package:apitest3/components/custom_textfield.dart';
import 'package:apitest3/core/constants/color_palatte.dart';
import 'package:apitest3/core/constants/dimension_constants.dart';
import 'package:apitest3/core/constants/textstyle_ext.dart';
import 'package:apitest3/core/helpers/image_helper.dart';
import 'package:flutter/material.dart';

class CustomAuthIdRadioButton extends StatelessWidget {
  final String icon;
  final String title;
  final String? selectedValue;
  final ValueChanged<String?> onChangedRadioButton;
  final ValueChanged<String?> onChangedID;
  final double? margin;
  final double? fontSize;
  final TextEditingController controllerDni;
  final TextEditingController controllerEx;
  const CustomAuthIdRadioButton(
      {Key? key,
      required this.icon,
      this.margin,
      this.fontSize,
      required this.title,
      this.selectedValue,
      required this.onChangedRadioButton,
      required this.onChangedID,
      required this.controllerDni,
      required this.controllerEx})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(kDefaultPadding),
      decoration: BoxDecoration(
          color: ColorPalette.primaryColor.withOpacity(0.7),
          borderRadius: BorderRadius.circular(kDefaultPadding)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              ImageHelper.loadFromAsset(
                icon,
              ),
              SizedBox(
                width: kDefaultPadding,
              ),
              Text(
                title,
                style: TextStyles.defaultStyle.bold,
              ),
            ],
          ),
          SizedBox(
            height: kMediumPadding,
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.8,
            decoration: BoxDecoration(
              color: ColorPalette.secondColor.withOpacity(0.15),
              borderRadius: BorderRadius.circular(
                40,
              ),
            ),
            padding: EdgeInsets.all(kMinPadding),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Radio<String>(
                  value: "Dni",
                  groupValue: selectedValue,
                  onChanged: onChangedRadioButton,
                ),
                Text(
                  "Dni",
                  style: TextStyle(
                      color: ColorPalette.text1Color,
                      fontFamily: "Poppins",
                      fontSize: fontSize),
                ),
                SizedBox(
                  width: margin,
                ),
                Radio<String>(
                  value: "Carnet Extranjería",
                  groupValue: selectedValue,
                  onChanged: onChangedRadioButton,
                ),
                Text(
                  "Carnet Extranjería",
                  style: TextStyle(
                      color: ColorPalette.text1Color,
                      fontFamily: "Poppins",
                      fontSize: fontSize),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          if (selectedValue == "Dni") ...[
            Container(
                width: MediaQuery.of(context).size.width * 0.8,
                decoration: BoxDecoration(
                  color: ColorPalette.secondColor.withOpacity(0.15),
                  borderRadius: BorderRadius.circular(
                    40,
                  ),
                ),
                padding: EdgeInsets.all(kMinPadding),
                child: CustomTextFormField(
                  label: "Dni",
                  hintText: "Dni",
                  controller: controllerDni,
                  color: Colors.transparent,
                  colorBorder: Colors.transparent,
                ))
            /* TextField(
              controller: controllerDni,
              onChanged: onChangedID,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    borderSide: BorderSide(
                        color: const Color.fromARGB(
                            255, 126, 0, 0)), // Color del borde plomo
                  ),
                  fillColor: ColorPalette.secondColor.withOpacity(0.15),
                  filled: true,
                  labelText: "Introduzca su DNI"),
            ) */
          ] else if (selectedValue == "Carnet Extranjería") ...[
            Container(
              width: MediaQuery.of(context).size.width * 0.8,
              decoration: BoxDecoration(
                color: ColorPalette.secondColor.withOpacity(0.15),
                borderRadius: BorderRadius.circular(
                  40,
                ),
              ),
              padding: EdgeInsets.all(kMinPadding),
              child: CustomTextFormField(
                label: "Carnet Extranjeria",
                hintText: "Carnet Extranjeria",
                controller: controllerEx,
                color: Colors.transparent,
                colorBorder: Colors.transparent,
              ),
            )
            /* TextField(
              controller: controllerEx,
              onChanged: onChangedID,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    borderSide: BorderSide(
                        color: const Color.fromARGB(
                            255, 126, 0, 0)), // Color del borde plomo
                  ),
                  fillColor: ColorPalette.secondColor.withOpacity(0.15),
                  filled: true,
                  labelText: "Introduzca su Carnet de Extranjería"),
            ) */
          ]
        ],
      ),
    );
  }
}

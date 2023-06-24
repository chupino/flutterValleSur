import 'package:apitest3/core/constants/color_palatte.dart';
import 'package:apitest3/core/constants/dimension_constants.dart';
import 'package:apitest3/core/constants/textstyle_ext.dart';
import 'package:apitest3/core/helpers/image_helper.dart';
import 'package:flutter/material.dart';

class CustomRadioButton extends StatelessWidget {
  final String icon;
  final String title;
  final String? selectedValue;
  final ValueChanged<String?> onChanged;
  final String value1;
  final String value2;
  final double? margin;
  final double? fontSize;

  const CustomRadioButton({
    Key? key,
    required this.icon,
    this.margin,
    this.fontSize,
    required this.title,
    this.selectedValue,
    required this.onChanged,
    required this.value1,
    required this.value2,
  }) : super(key: key);

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
                  value: value1,
                  groupValue: selectedValue,
                  onChanged: onChanged,
                ),
                Text(value1,style: TextStyle(color: ColorPalette.text1Color,fontFamily: "Poppins",fontSize: fontSize),),
                SizedBox(width: margin,),
                Radio<String>(
                  value: value2,
                  groupValue: selectedValue,
                  onChanged: onChanged,
                ),
                Text(value2,style: TextStyle(color: ColorPalette.text1Color,fontFamily: "Poppins",fontSize: fontSize),),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

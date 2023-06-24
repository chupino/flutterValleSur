import 'package:flutter/material.dart';
import 'package:apitest3/core/constants/color_palatte.dart';
import 'package:apitest3/core/constants/dimension_constants.dart';
import 'package:apitest3/core/constants/textstyle_ext.dart';

class ItemButtonWidgetSolid extends StatelessWidget {
  const ItemButtonWidgetSolid({Key? key, required this.data, this.onTap, this.color}) : super(key: key);

  final String data;
  final Function()? onTap;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: kDefaultPadding),
        width: double.infinity,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(kMediumPadding),
        ),
        alignment: Alignment.center,
        child: Text(
          textAlign: TextAlign.center,
          data,
          style: TextStyle(color: ColorPalette.text1Color,fontFamily: "Poppins",fontWeight: FontWeight.bold,fontSize: 20)
        ),
      ),
    );
  }
}

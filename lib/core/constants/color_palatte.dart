import 'package:flutter/material.dart';

class ColorPalette {
  static const Color primaryColor = Color(0xff6155CC);
  static const Color secondColor = Color(0xff8F67E8);


  static const Color blue = Color.fromARGB(255, 18, 38, 84);
  static const Color text2Color = Color.fromARGB(255, 147, 138, 223);
  static const Color granate = Color.fromARGB(255, 153, 0, 74);
  static const Color dividerColor = Color(0xFFE5E7EB);
  static const Color formFieldBorderColor=Color.fromARGB(255, 120, 121, 122);
  static const Color formFieldLabelColor=Color.fromARGB(255, 158, 158, 158);
  static const Color text1Color = Color.fromARGB(255, 248, 248, 248);
  static const Color subTitleColor = Color.fromARGB(255, 185, 181, 181);
  static const Color cardHotelColor =Color.fromARGB(255, 37, 24, 54);
  static const Color backgroundScaffoldColor = Color.fromARGB(255, 44, 17, 60);
  static const Color buttonColor=Color.fromARGB(255, 77, 35, 85);
  static const Color backgroundScaffoldSecundaryColor = const Color.fromARGB(255, 40, 66, 90);
  static const Color navBarColor= Color.fromARGB(255, 77, 35, 85);
  static const Color navBarSelectedColor=Color.fromARGB(255, 243, 243, 243);
  static const Color iconColor=Color.fromARGB(255, 243, 243, 243);
  static const Color iconColorSecundary=Color.fromARGB(255, 142, 123, 239);
  static const Color navBarUnselectedColor=Color.fromARGB(255, 255, 255, 255);
  static const Color dangerColor=Color.fromARGB(255, 220, 51, 51);
  

}

class Gradients {
  static const Gradient defaultGradientBackground = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomLeft,
    colors: [
      ColorPalette.secondColor,
      ColorPalette.primaryColor,
    ],
  );
}

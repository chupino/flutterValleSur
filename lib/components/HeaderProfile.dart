import 'package:apitest3/core/constants/color_palatte.dart';
import 'package:apitest3/main.dart';
import 'package:flutter/material.dart';

import 'package:badges/badges.dart' as badge;
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

//import 'package:smart_hotel/app/controllers/auth_controller.dart';
import 'package:apitest3/controller/homecontroller.dart';
/* import 'package:smart_hotel/app/theme/color.dart';
import 'package:smart_hotel/app/theme/const.dart'; */

//final authController = Get.find<AuthController>();

class CustomHeaderProfile extends StatelessWidget {
  final String? title;
  final double height;
  final Size size;
  final Color borderPic;
  final String profilePic;
  final Function()? logout;

  CustomHeaderProfile(
      {
      required this.logout,
      required this.borderPic,
      required this.title,
      required this.height,
      required this.size,
      required this.profilePic});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.height * 0.4,
      width: size.width,
      child: Stack(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(left: 12, right: 28, top: 15),
            height: height - 50,
            width: size.width,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [mainBackupColor, Color.fromARGB(255, 18, 38, 84)],
              ),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      title!,
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Poppins',
                        fontSize: size.height * 0.038,
                        fontWeight: FontWeight.w600,
                        overflow: TextOverflow.visible,
                      ),
                    ),
                    IconButton(
                      onPressed: logout,
                        icon: Icon(
                      Icons.logout,
                      color: ColorPalette.iconColor,
                      size: size.height * 0.05,
                    ))
                  ],
                )
              ],
            ),
          ),
          Positioned(
            top: (size.height - 730) /
                2, // Ajusta este valor para mover la foto hacia arriba o abajo
            left: size.width / 4, // Ajusta este valor para centrar la foto
            child: SizedBox(
              width: size.width * 0.5,
              height: size.height * 0.4,
              child: CircleAvatar(
                backgroundColor: borderPic,
                radius: size.height *
                    0.02, // Ajusta este valor para cambiar el tamaño del CircleAvatar
                child: CircleAvatar(
                  radius: size.height *
                      0.11, // Ajusta este valor para cambiar el tamaño de la imagen dentro del CircleAvatar
                  backgroundImage: AssetImage(profilePic),
                ),

// Ajusta este valor para cambiar el ancho del borde
              ),
            ),
          ),
        ],
      ),
    );
  }
}

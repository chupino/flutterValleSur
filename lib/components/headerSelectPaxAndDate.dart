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

class SimpleHeader extends GetView<HomeController> {
  const SimpleHeader({
    required this.title,
    required this.height,
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;
  final title;
  final double height;

  @override
  Widget build(BuildContext context) {
    int countThisNotification = 1;
    return Container(
      height: height,
      width: size.width,
      child: Stack(
        children: <Widget>[
          
          Container(
            padding: EdgeInsets.only(left: 12, right: 28,top: 15),
            height: height,
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
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                    
                    Text(
                        title!,
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Poppins',
                          fontSize: size.height*0.038,
                          fontWeight: FontWeight.w600,
                          overflow: TextOverflow.visible
                        ),
                      ),
              ],
            ),
          ),
          
        ],
      ),
    );
  }
}
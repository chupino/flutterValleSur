import 'package:apitest3/core/constants/textstyle_ext.dart';
import 'package:apitest3/core/helpers/asset_helper.dart';
import 'package:apitest3/core/helpers/image_helper.dart';
import 'package:apitest3/main.dart';
import 'package:flutter/material.dart';

import 'package:badges/badges.dart' as badge;
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

//import 'package:smart_hotel/app/controllers/auth_controller.dart';
import 'package:apitest3/controller/homecontroller.dart';

import '../core/constants/color_palatte.dart';
import '../core/constants/dimension_constants.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
/* import 'package:smart_hotel/app/theme/color.dart';
import 'package:smart_hotel/app/theme/const.dart'; */

//final authController = Get.find<AuthController>();

class HeaderHabitaciones extends GetView<HomeController> {
  const HeaderHabitaciones({
    Key? key,
    required this.size,
    required this.selectedDate,
    required this.acompaniantes,
    required this.onTap,
  }) : super(key: key);

  final Size size;
  final Function() onTap;
  final String selectedDate;
  final String acompaniantes;

  @override
  Widget build(BuildContext context) {
    int countThisNotification = 1;
    return Container(
      height: size.height * 0.32,
      child: Stack(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(left: 12, right: 28, top: 15),
            height: size.height * 0.32 - 27,
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
              children: [
                SizedBox(
                  height: size.height * 0.03,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                      onTap: onTap,
                      child: Container(
                        padding: EdgeInsets.all(kItemPadding),
                        child: Icon(
                          Icons.arrow_back_ios,
                          color: ColorPalette.iconColor,
                          size: size.height * 0.052,
                        ),
                      ),
                    ),
                    Image.asset(
                      "assets/images/vallesur_logo.png",
                      height: size.height * 0.065,
                    ),
                    Text(
                      "Habitaciones",
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Poppins',
                        fontSize: size.height * 0.03,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              alignment: Alignment.center,
              margin: EdgeInsets.symmetric(horizontal: 6),
              padding: EdgeInsets.symmetric(horizontal: 8),
              height: 100,
              decoration: BoxDecoration(
                color: ColorPalette.cardHotelColor,
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 10),
                    blurRadius: 50,
                    color: mainBackupColor.withOpacity(0.23),
                  ),
                ],
              ),
              child: Row(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: Colors.purple,
                          borderRadius: BorderRadius.circular(25)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          ImageHelper.loadFromAsset(
                            AssetHelper.icoGuest,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(acompaniantes,
                              style: TextStyle(
                                  color: ColorPalette.text1Color,
                                  fontSize: size.height * 0.014,
                                  fontFamily: "Poppins",
                                  fontWeight: FontWeight.bold))
                        ],
                      )),
                  SizedBox(
                    width: 15,
                  ),
                  Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: Colors.purple,
                          borderRadius: BorderRadius.circular(25)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          ImageHelper.loadFromAsset(
                            AssetHelper.icoCalendal,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(selectedDate,
                              style: TextStyle(
                                  color: ColorPalette.text1Color,
                                  fontSize: size.height * 0.013,
                                  fontFamily: "Poppins",
                                  fontWeight: FontWeight.bold))
                        ],
                      )),
/*                   ElevatedButton(
                    onPressed: () {
                      //Buscar algo XD
                    },
                    child: SvgPicture.asset("assets/svg/mini_search.svg"),
                    style: ElevatedButton.styleFrom(
                      shape: CircleBorder(),
                      primary: mainBackupColor,
                    ),
                  ), */
                ],
              ),
            ),
          ),
        ],
      ),
    );
    // ],
    // );
  }
}

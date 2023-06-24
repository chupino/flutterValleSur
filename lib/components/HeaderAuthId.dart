import 'package:apitest3/core/constants/textstyle_ext.dart';
import 'package:apitest3/core/helpers/asset_helper.dart';
import 'package:apitest3/core/helpers/image_helper.dart';
import 'package:apitest3/main.dart';
import 'package:flutter/material.dart';
import 'package:easy_stepper/easy_stepper.dart';

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

class HeaderAuthId extends GetView {
  const HeaderAuthId({
    Key? key,
    required this.size,
    required this.activeStep,
  }) : super(key: key);

  final Size size;
  final int activeStep;

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
                      onTap: (){},
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
                      "Verificar Identidad",
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Poppins',
                        fontSize: size.height * 0.027,
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
              padding: EdgeInsets.only(right: 8,left:8,top: 8,),
              height: size.height*0.169,
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
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  SizedBox(
                    height: size.height*0.158,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          flex: 15,
                          child: EasyStepper(
                            
                            activeStep: activeStep,
                            lineLength: 100,
                            lineThickness: 3,
                            lineSpace: 4,
                            lineType: LineType.normal,
                            defaultLineColor: Colors.purple.shade300,
                            activeStepBackgroundColor: ColorPalette.primaryColor,
                            activeStepIconColor: ColorPalette.iconColor,
                            activeStepBorderColor: ColorPalette.formFieldBorderColor,
                            activeStepTextColor: TextStyles.defaultStyle.text1Color.bold.color,
                            finishedStepBackgroundColor: ColorPalette.iconColorSecundary,
                            finishedStepTextColor: ColorPalette.subTitleColor.withOpacity(0.4),
                            finishedStepIconColor: ColorPalette.iconColor.withOpacity(0.5),
                            activeStepBorderType: BorderType.normal,
                            borderThickness: 10,
                            internalPadding: 30,
                            maxReachedStep: 2,
                            showLoadingAnimation: false,
                            disableScroll: false,
                            enableStepTapping: false,
                            steps:  [
                              EasyStep(
                                icon: Icon(Icons.perm_identity_rounded),
                                title: 'Identificacion',
                                lineText: '',
                                customLineWidget: Text('Introduce tu documento de identidad',style: TextStyle(color: ColorPalette.text1Color.withOpacity(0.6)),textAlign: TextAlign.center,)
                              ),
                              EasyStep(
                                icon: Icon(Icons.verified_rounded),
                                title: 'Confirmar',
                                enabled: true,
                                lineText: "",
                                
                              ),
     
                            ],
                            onStepReached: (index) {
                              print(index);
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
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

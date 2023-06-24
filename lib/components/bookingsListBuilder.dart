import 'package:apitest3/components/header.dart';
import 'package:apitest3/components/headerHabitacionesMini.dart';
import 'package:apitest3/components/headermini.dart';
import 'package:apitest3/controller/habitacionesListController.dart';
import 'package:flutter/material.dart';
import 'package:apitest3/core/constants/color_palatte.dart';
import 'package:apitest3/core/constants/dimension_constants.dart';
import 'package:apitest3/core/constants/textstyle_ext.dart';
import 'package:apitest3/core/helpers/asset_helper.dart';
import 'package:apitest3/core/helpers/image_helper.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import 'headerHabitaciones.dart';

class BookingListBuilder extends StatelessWidget {
  final Widget child;
  const BookingListBuilder(
      {
      required this.child,
      super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return 
          Container(
            decoration: BoxDecoration(
                color: ColorPalette.backgroundScaffoldSecundaryColor),
            margin: EdgeInsets.only(top: 20),
            padding: EdgeInsets.all(8),
            child: child,
          );

  }
}

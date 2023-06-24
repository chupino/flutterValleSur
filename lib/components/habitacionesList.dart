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

class HabitacionesList extends GetView<HabitacionesListController> {
  final Widget child;
  final String selectedDate;
  final String acompaniantes;
  const HabitacionesList(
      {required this.selectedDate,
      required this.acompaniantes,
      required this.child,
      super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      extendBody: true,
      backgroundColor: ColorPalette.backgroundScaffoldSecundaryColor,
      body: CustomScrollView(
        slivers: <Widget>[
          SliverPersistentHeader(
            delegate: _HeaderDelegate(
                size: size,
                selectedDate: selectedDate,
                acompaniantes: acompaniantes),
            pinned: true,
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Container(
                  decoration: BoxDecoration(
                      color: ColorPalette.backgroundScaffoldSecundaryColor),
                  margin: EdgeInsets.only(top: 20),
                  padding: EdgeInsets.all(8),
                  child: child,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _HeaderDelegate extends SliverPersistentHeaderDelegate {
  final Size size;
  final String selectedDate;
  final String acompaniantes;

  _HeaderDelegate({
    required this.size,
    required this.selectedDate,
    required this.acompaniantes,
  });

  bool isCollapsed(double shrinkOffset) {
    return shrinkOffset > 100;
  }

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    final scaleFactor = 1 - shrinkOffset / 200;
    final collapsed = isCollapsed(shrinkOffset);

    return Container(
      height: maxExtent,
      child: Stack(
        children: <Widget>[
          Visibility(
            visible: !collapsed,
            child: HeaderHabitaciones(
              size: size,
              onTap: () {
                Get.back();
              },
              selectedDate: selectedDate,
              acompaniantes: acompaniantes,
            ),
          ),
          Visibility(
            visible: collapsed,
            child: HeaderHabitacionesMini(size: size),
          ),
        ],
      ),
    );
  }

  @override
  double get maxExtent => size.height * 0.32;

  @override
  double get minExtent => size.height * 0.14;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}


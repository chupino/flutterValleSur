import 'dart:ui';

import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:simple_shadow/simple_shadow.dart';
import 'package:apitest3/test_data/promoData.dart';


import '../models/promo.dart';

class Promo_carousel extends StatelessWidget {
  final double _borderRadius = 10.0;
  final Color colortiles;
  final Color subtitles;
  final Size size;

  const Promo_carousel({super.key, required this.colortiles, required this.subtitles, required this.size});
  @override
  Widget build(BuildContext context) {
    
    return Container(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Promo',
                  style: TextStyle(
                    color: colortiles,
                    fontFamily: 'Poppins',
                    fontSize: size.height * 0.025,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 5,
          ),
          GestureDetector(
            onTap: () {
              //nada creo
            },
            child: Container(
              height: 111,
              child: ListView.builder(
                padding: EdgeInsets.only(right: 16),
                scrollDirection: Axis.horizontal,
                itemCount: items.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.only(left: 16, top: 10, bottom: 10),
                    padding: EdgeInsets.all(16),
                    width: 260,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(_borderRadius),
                      gradient: LinearGradient(colors: [
                        items[index].startColor,
                        items[index].endColor,
                      ], begin: Alignment.topLeft, end: Alignment.bottomRight),
                      boxShadow: [
                        BoxShadow(
                          color: items[index].endColor,
                          offset: Offset(0.0, 2.0),
                          blurRadius: 6.0,
                        ),
                      ],
                    ),
                    child: Stack(
                      alignment: Alignment.centerLeft,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    items[index].namePromo,
                                    style: TextStyle(
                                      color: subtitles,
                                      fontFamily: 'Poppins',
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                      height: 1.3,
                                      letterSpacing: 1,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(top: 3),
                                    child: Text(
                                      items[index].date,
                                      style: TextStyle(
                                        color: subtitles,
                                        fontFamily: 'Poppins',
                                        fontSize: 9,
                                        fontWeight: FontWeight.w400,
                                        height: 1.3,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SimpleShadow(
                              child: SvgPicture.asset(
                                items[index].iconPromo,
                                width: 60,
                              ),
                              opacity: 0.5, // Default: 0.5
                              color: subtitles, // Default: Black
                              offset: Offset(5, 5), // Default: Offset(2, 2)
                              sigma: 5, // Defa
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

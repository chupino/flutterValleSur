import 'package:apitest3/core/constants/color_palatte.dart';
import 'package:apitest3/models/user.dart';
import 'package:flutter/material.dart';

import 'package:apitest3/core/constants/dimension_constants.dart';
import 'package:apitest3/core/constants/textstyle_ext.dart';
import 'package:apitest3/core/helpers/image_helper.dart';
import 'package:apitest3/components/dash_line.dart';
import 'package:apitest3/components/item_button_widget.dart';
import 'package:apitest3/components/item_utility_hotel.dart';

import 'package:apitest3/models/room_model.dart';

class ItemBookingPrices extends StatelessWidget {
  const ItemBookingPrices({
    Key? key,
    required this.items,
    required this.precioFinal,
  }) : super(key: key);

  final List<Map<String,dynamic>> items;
  final String precioFinal;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(kMediumPadding),
        color: ColorPalette.backgroundScaffoldColor.withOpacity(0.777),
      ),
      margin: EdgeInsets.only(bottom: kMediumPadding),
      padding: const EdgeInsets.all(kDefaultPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 7,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Resumen de la Reserva",
                      style: TextStyles.defaultStyle.fontHeader.bold,
                    ),
                    DashLineWidget(),
                    SizedBox(
                      height: kDefaultPadding,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Column(
                        children: items.map((item) {
                            return Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  item["item"],
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: ColorPalette.text1Color.withOpacity(0.7)
                                  ),
                                ),
                                Text(
                                  "\$${item["precio"]}",
                                  textAlign: TextAlign.right,
                                  style: TextStyle(
                                    color: ColorPalette.text1Color.withOpacity(0.7)
                                  ),
                                ),
                              ],
                            );
                          }).toList(),
                      ),
                    )
                    
                    
                  ],
                ),
              ),
              /* Expanded(
                flex: 3,
                child: ImageHelper.loadFromNetwork(roomModel.roomImage,radius: BorderRadius.circular(kItemPadding))
                /* ImageHelper.loadFromAsset(roomModel.roomImage, radius: BorderRadius.circular(kItemPadding)), */
              ), */
            ],
          ),
          //ItemUtilityHotelWidget(),
          DashLineWidget(),
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Precio Total:',
                      style: TextStyles.defaultStyle.fontHeader.bold,
                      textAlign: TextAlign.end,
                    ),
                    SizedBox(
                      height: kMinPadding,
                    ),

                  ],
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      precioFinal,
                      style: TextStyles.defaultStyle.fontHeader.bold,
                      textAlign: TextAlign.end,
                    ),
                    SizedBox(
                      height: kMinPadding,
                    ),

                  ],
                ),
              ),
              
            ],
          ),
        ],
      ),
    );
  }
}
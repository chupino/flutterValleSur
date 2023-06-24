import 'package:apitest3/core/constants/color_palatte.dart';
import 'package:flutter/material.dart';

import 'package:apitest3/core/constants/dimension_constants.dart';
import 'package:apitest3/core/constants/textstyle_ext.dart';
import 'package:apitest3/core/helpers/asset_helper.dart';
import 'package:apitest3/core/helpers/image_helper.dart';
import 'package:apitest3/models/hotel_model.dart';
import 'package:apitest3/components/dash_line.dart';
import 'package:apitest3/components/item_button_widget.dart';

class ItemHotelWidget extends StatelessWidget {
  const ItemHotelWidget({
    Key? key,
    required this.hotelModel,
    this.onTap,
  }) : super(key: key);

  final HotelModel hotelModel;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(kDefaultPadding),
        color: ColorPalette.cardHotelColor,
      ),
      margin: EdgeInsets.only(bottom: kMediumPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: double.infinity,
            margin: EdgeInsets.only(),
            child: ImageHelper.loadFromAsset(
              hotelModel.hotelImage,
              radius: BorderRadius.only(
                topLeft: Radius.circular(
                  kDefaultPadding,
                ),
                topRight: Radius.circular(
                  kDefaultPadding,
                ),
                
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(
              kDefaultPadding,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  hotelModel.hotelName,
                  style: TextStyles.defaultStyle.fontHeader.bold,
                ),
                SizedBox(
                  height: kDefaultPadding,
                ),
                Row(
                  children: [
                    ImageHelper.loadFromAsset(
                      AssetHelper.icoLocationBlank,
                    ),
                    SizedBox(
                      width: kMinPadding,
                    ),
                    Text(
                      hotelModel.location,
                      style: TextStyles.defaultStyle.secundaryTextColor,
                    ),
                    Text(
                      ' - ${hotelModel.awayKilometer} del destino',
                      style: TextStyles.defaultStyle.subTitleTextColor.fontCaption,
                      maxLines: 2,
                    ),
                  ],
                ),
                SizedBox(
                  height: kDefaultPadding,
                ),
                Row(
                  children: [
                    ImageHelper.loadFromAsset(
                      AssetHelper.icoStar,
                    ),
                    SizedBox(
                      width: kMinPadding,
                    ),
                    Text(
                      hotelModel.star.toString(),
                      style: TextStyles.defaultStyle.secundaryTextColor,
                    ),
                    Text(
                      ' (${hotelModel.numberOfReview} opiniones)',
                      style: TextStyles.defaultStyle.subTitleTextColor,
                    ),
                  ],
                ),
                DashLineWidget(),
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '\$${hotelModel.price.toString()}',
                            style: TextStyles.defaultStyle.fontHeader.bold,
                          ),
                          SizedBox(
                            height: kMinPadding,
                          ),
                          Text(
                            '/noche',
                            style: TextStyles.defaultStyle.fontCaption,
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      child: ItemButtonWidget(
                        data: 'Reservar una habitación',
                        onTap: onTap,
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

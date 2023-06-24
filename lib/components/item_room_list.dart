import 'package:apitest3/core/constants/color_palatte.dart';
import 'package:flutter/material.dart';

import 'package:apitest3/core/constants/dimension_constants.dart';
import 'package:apitest3/core/constants/textstyle_ext.dart';
import 'package:apitest3/core/helpers/image_helper.dart';
import 'package:apitest3/components/dash_line.dart';
import 'package:apitest3/components/item_button_widget.dart';
import 'package:apitest3/components/item_utility_hotel.dart';

import 'package:apitest3/models/room_model.dart';

class ItemRoomListWidget extends StatelessWidget {
  const ItemRoomListWidget({
    Key? key,
    required this.roomModel,
    this.onTap,
    this.numberOfRoom,
  }) : super(key: key);

  final RoomModel roomModel;
  final Function()? onTap;
  final int? numberOfRoom;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(kMediumPadding),
        color: ColorPalette.backgroundScaffoldColor,
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
                      roomModel.roomName,
                      style: TextStyles.defaultStyle.fontHeader.bold,
                    ),
                    SizedBox(
                      height: kDefaultPadding,
                    ),
                    Text(
                      'Room Size: ${roomModel.size} m2',
                      maxLines: 2,
                      style: TextStyles.defaultStyle.subTitleTextColor,
                    ),
                    SizedBox(
                      height: kDefaultPadding,
                    ),
                    Text(
                      roomModel.utility,
                      style: TextStyles.defaultStyle.subTitleTextColor,
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 3,
                child: ImageHelper.loadFromNetwork(roomModel.roomImage,radius: BorderRadius.circular(kItemPadding))
                /* ImageHelper.loadFromAsset(roomModel.roomImage, radius: BorderRadius.circular(kItemPadding)), */
              ),
            ],
          ),
          ItemUtilityHotelWidget(),
          DashLineWidget(),
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '\$${roomModel.price.toString()}',
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
                child: numberOfRoom == null
                    ? ItemButtonWidget(
                        data: 'Escoger',
                        onTap: onTap,
                      )
                    : Text(
                        '$numberOfRoom habitacion',
                        textAlign: TextAlign.end,
                      ),
              ) 
            ],
          ),
        ],
      ),
    );
  }
}

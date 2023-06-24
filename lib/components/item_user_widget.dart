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

class ItemUserWidget extends StatelessWidget {
  const ItemUserWidget({
    Key? key,
    required this.userModel,
    this.onTap,
    this.numberOfRoom,
  }) : super(key: key);

  final UserModel userModel;
  final Function()? onTap;
  final int? numberOfRoom;

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
                      "Datos Personales",
                      style: TextStyles.defaultStyle.fontHeader.bold,
                    ),
                    SizedBox(
                      height: kDefaultPadding,
                    ),
                    Text(
                      'Tipo Documento: ${userModel.tipo_id}',
                      maxLines: 2,
                      style: TextStyles.defaultStyle.subTitleTextColor,
                    ),
                    SizedBox(
                      height: kDefaultPadding,
                    ),
                    Text(
                      'Nro de Documento: ${userModel.id}',
                      style: TextStyles.defaultStyle.subTitleTextColor,
                    ),
                    SizedBox(
                      height: kDefaultPadding,
                    ),
                    Text(
                      'Nombre: ${userModel.nombres}',
                      style: TextStyles.defaultStyle.subTitleTextColor,
                    ),
                    SizedBox(
                      height: kDefaultPadding,
                    ),
                    Text(
                      'Apellidos: ${userModel.apellidos}',
                      style: TextStyles.defaultStyle.subTitleTextColor,
                    ),
                    SizedBox(
                      height: kDefaultPadding,
                    ),
                    Text(
                      'Correo: ${userModel.correo}',
                      style: TextStyles.defaultStyle.subTitleTextColor,
                    ),
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
                child:Text(
                        'El hotel tendra acceso a estos datos',
                        textAlign: TextAlign.start,
                        style: TextStyle(color: ColorPalette.secondColor),
                      ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      'Ver mas...',
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
import 'package:apitest3/components/item_button_widget_solid.dart';
import 'package:apitest3/core/constants/color_palatte.dart';
import 'package:apitest3/models/reserva_model.dart';
import 'package:flutter/material.dart';

import 'package:apitest3/core/constants/dimension_constants.dart';
import 'package:apitest3/core/constants/textstyle_ext.dart';
import 'package:apitest3/core/helpers/image_helper.dart';
import 'package:apitest3/components/dash_line.dart';
import 'package:apitest3/components/item_button_widget.dart';
import 'package:apitest3/components/item_utility_hotel.dart';

import 'package:apitest3/models/room_model.dart';

class ItemReservaWidget extends StatelessWidget {
  const ItemReservaWidget({
    Key? key,
    required this.reservaModel,
    this.onTap,
  }) : super(key: key);

  final ReservaModel reservaModel;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(kMediumPadding),
        color: ColorPalette.backgroundScaffoldColor.withOpacity(0.7),
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
                      reservaModel.roomName,
                      style: TextStyles.defaultStyle.fontHeader.bold,
                    ),
                    SizedBox(
                      height: kDefaultPadding,
                    ),
                    /* Text(
                      'Fecha: ${reservaModel.fechaReserva} ',
                      maxLines: 2,
                      style: TextStyles.defaultStyle.subTitleTextColor,
                    ), */
                    Text.rich(
                      TextSpan(
                        text: 'Fecha: ',
                        style: TextStyle(
                            fontFamily: "Poppins",
                            fontSize: 18,
                            color: ColorPalette.text1Color),
                        children: [
                          TextSpan(
                            text: reservaModel.fechaReserva,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                color: ColorPalette.text2Color,
                                fontFamily: "Poppins"),
                          ),
                        ],
                      ),
                      textAlign: TextAlign.start,
                    ),
                    SizedBox(
                      height: kDefaultPadding,
                    ),
                    Text.rich(
                      
                      TextSpan(
                        text: 'Hora Llegada: ',
                        
                        style: TextStyle(
                            fontFamily: "Poppins",
                            fontSize: 18,
                            color: ColorPalette.text1Color),
                        children: [
                          TextSpan(
                            text: reservaModel.horaLlegadaReserva=="null"?"No especificó":reservaModel.horaLlegadaReserva,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                color: ColorPalette.text2Color,
                                fontFamily: "Poppins"),
                          ),
                        ],
                      ),
                      textAlign: TextAlign.start,
                    ),
                    SizedBox(
                      height: kDefaultPadding,
                    ),
                    Text.rich(
                      TextSpan(
                        text: 'Titular: ',
                        style: TextStyle(
                            fontFamily: "Poppins",
                            fontSize: 18,
                            color: ColorPalette.text1Color),
                        children: [
                          TextSpan(
                            text: reservaModel.nombres +
                                " " +
                                reservaModel.apellidos,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                color: ColorPalette.text2Color,
                                fontFamily: "Poppins"),
                          ),
                        ],
                      ),
                      textAlign: TextAlign.start,
                    ),
                    SizedBox(
                      height: kDefaultPadding,
                    ),
                    Text.rich(
                      TextSpan(
                        text: 'Email: ',
                        style: TextStyle(
                            fontFamily: "Poppins",
                            fontSize: 18,
                            color: ColorPalette.text1Color),
                        children: [
                          TextSpan(
                            text: reservaModel.correo,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                color: ColorPalette.text2Color,
                                fontFamily: "Poppins"),
                          ),
                        ],
                      ),
                      textAlign: TextAlign.start,
                    ),
                  ],
                ),
              ),
              Expanded(
                  flex: 3,
                  child: ImageHelper.loadFromNetwork(reservaModel.roomImage,
                      radius: BorderRadius.circular(kItemPadding))
                  /* ImageHelper.loadFromAsset(roomModel.roomImage, radius: BorderRadius.circular(kItemPadding)), */
                  ),
            ],
          ),
          /* ItemUtilityHotelWidget(), */
          DashLineWidget(),
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ItemButtonWidgetSolid(
                      data: "Ver detalles",
                      color: ColorPalette.iconColorSecundary,
                      onTap: onTap,
                    )
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

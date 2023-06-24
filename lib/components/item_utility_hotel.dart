import 'package:flutter/material.dart';
import 'package:apitest3/core/constants/dimension_constants.dart';
import 'package:apitest3/core/helpers/asset_helper.dart';
import 'package:apitest3/core/helpers/image_helper.dart';

import '../core/constants/textstyle_ext.dart';

class ItemUtilityHotelWidget extends StatelessWidget {
  const ItemUtilityHotelWidget({Key? key}) : super(key: key);

  static const List<Map<String, String>> listUtilityHotel = [
    {'icon': AssetHelper.icoWifi, 'name': 'Wifi\nGratis'},
    {'icon': AssetHelper.icoNonRefund, 'name': 'No-\nDevoluciones'},
    {'icon': AssetHelper.icoBreakfast, 'name': 'Desayuno-\nGratis'},
    {'icon': AssetHelper.icoNonSmoke, 'name': 'No-\nFumones'},
  ];

  Widget _buildItemUtilityHotelWidget({required String icon, required String name}) {
    return Column(
      children: [
        ImageHelper.loadFromAsset(
          icon,
        ),
        SizedBox(
          height: kTopPadding,
        ),
        Text(name, textAlign: TextAlign.center,style: TextStyles.defaultStyle.secundaryTextColor.bold,),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: kDefaultPadding),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: listUtilityHotel
            .map(
              (e) => _buildItemUtilityHotelWidget(
                icon: e['icon']!,
                name: e['name']!,
              ),
            )
            .toList(),
      ),
    );
  }
}

import 'package:apitest3/components/headerSelectPaxAndDate.dart';
import 'package:apitest3/components/item_button_widget.dart';
import 'package:apitest3/components/item_change_pax.dart';
import 'package:apitest3/core/constants/color_palatte.dart';
import 'package:apitest3/core/constants/dimension_constants.dart';
import 'package:apitest3/core/helpers/asset_helper.dart';
import 'package:flutter/material.dart';

class SelectPaxPage extends StatefulWidget {
  const SelectPaxPage({Key? key}) : super(key: key);

  static const String routeName = '/guest_and_room_screen';

  @override
  State<SelectPaxPage> createState() => _SelectPaxPageState();
}

class _SelectPaxPageState extends State<SelectPaxPage> {
  final GlobalKey<ItemChangePaxState> _itemCountGuest =
      GlobalKey<ItemChangePaxState>();

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: ColorPalette.backgroundScaffoldSecundaryColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SimpleHeader(
              size: size,
              title: "Seleccionar Acompañantes",
              height: 160,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20,vertical: 20),
              child: Column(
                children: [
                  ItemChangePax(
                    key: _itemCountGuest,
                    initData: 1,
                    icon: AssetHelper.icoGuest,
                    value: 'Acompañantes',
                  ),
                  SizedBox(
                    height: kDefaultPadding,
                  ),
                  ItemButtonWidget(
                    data: 'Seleccionar',
                    onTap: () {
                      Navigator.of(context).pop([
                        _itemCountGuest.currentState!.number,
                      ]);
                    },
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

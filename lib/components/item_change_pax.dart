import 'package:apitest3/core/constants/color_palatte.dart';
import 'package:apitest3/core/constants/textstyle_ext.dart';
import 'package:flutter/material.dart';
import 'package:apitest3/core/helpers/asset_helper.dart';
import 'package:apitest3/core/helpers/image_helper.dart';

import '../../core/constants/dimension_constants.dart';

class ItemChangePax extends StatefulWidget {
  const ItemChangePax({Key? key, this.initData = 0, required this.icon, required this.value})
      : super(key: key);

  final int initData;
  final String icon;
  final String value;

  @override
  State<ItemChangePax> createState() => ItemChangePaxState();
}

class ItemChangePaxState extends State<ItemChangePax> {
  late final TextEditingController _textEditingController;

  final FocusNode _focusNode = FocusNode();

  late int number;

  @override
  void initState() {
    super.initState();
    _textEditingController = TextEditingController(text: widget.initData.toString())
      ..addListener(() {
        number = int.parse(_textEditingController.text);
      });
    number = widget.initData;
  }

  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(
      builder: (context, setState) {
        return Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(kTopPadding), color: ColorPalette.primaryColor.withOpacity(0.18)),
          margin: EdgeInsets.only(bottom: kMediumPadding),
          padding: EdgeInsets.all(kMediumPadding),
          child: Row(
            children: [
              ImageHelper.loadFromAsset(
                widget.icon,
              ),
              SizedBox(
                width: kMediumPadding-10,
              ),
              Text(widget.value,style: TextStyles.defaultStyle.subTitleTextColor,),
              Spacer(),
              GestureDetector(
                onTap: () {
                  if (number > 1) {
                    setState(() {
                      number--;
                      _textEditingController.text = number.toString();
                      if (_focusNode.hasFocus) {
                        _focusNode.unfocus();
                      }
                    });
                  }
                },
                child: ImageHelper.loadFromAsset(
                  AssetHelper.icoDecre,
                  height: 25
                ),
              ),
              Container(
                height: 35,
                width: 60,
                padding: EdgeInsets.only(left: 1),
                alignment: Alignment.center,
                child: TextField(
                  controller: _textEditingController,
                  textAlign: TextAlign.center,
                  focusNode: _focusNode,
                  enabled: true,
                  autocorrect: false,
                  minLines: 1,
                  maxLines: 1,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    contentPadding: const EdgeInsets.only(
                      bottom: 18,
                    ),
                  ),
                  style: TextStyle(color: ColorPalette.text1Color),
                  onChanged: (value) {},
                  onSubmitted: (String submitValue) {},
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    number++;
                    _textEditingController.text = number.toString();
                    if (_focusNode.hasFocus) {
                      _focusNode.unfocus();
                    }
                  });
                },
                child: ImageHelper.loadFromAsset(AssetHelper.icoIncre,height: 25),
              ),
            ],
          ),
        );
      },
    );
  }
}

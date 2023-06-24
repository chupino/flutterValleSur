import 'package:apitest3/core/constants/color_palatte.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:apitest3/components/fading_sliding_widget.dart';
import 'package:apitest3/models/onboard_page_item.dart';

class OnboardPage extends StatefulWidget {
  final OnboardPageItem onboardPageItem;

  OnboardPage({required this.onboardPageItem});

  @override
  _OnboardState createState() => _OnboardState();
}

class _OnboardState extends State<OnboardPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    _animationController = AnimationController(vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Container(
      decoration: BoxDecoration(
        color: ColorPalette.backgroundScaffoldSecundaryColor
      ),
      padding: EdgeInsets.only(top: height * 0.15,bottom: 150),
      child: Column(
        children: <Widget>[
           Lottie.asset(
              controller: _animationController,
              onLoaded: (composition){
                _animationController
                ..duration=composition.duration
                ..forward()
                ..addListener(() {
                  if(widget.onboardPageItem.animationDuration!=null){
                    if(_animationController.lastElapsedDuration!>
                    widget.onboardPageItem.animationDuration){
                      _animationController.stop();
                    }
                  }
                });
              },
              widget.onboardPageItem.lottieAsset,
              width: width * 0.9,
              height: height*0.4,
              repeat: true,
              
            ),
          SizedBox(height: height * 0.15),
          Flexible(
            child: FadingSlidingWidget(
              animationController: _animationController,
              interval: const Interval(0.2, 0.5),
              child: Text(
                widget.onboardPageItem.text,
                style: TextStyle(
                  fontSize: width * 0.069,
                  fontFamily: 'ProductSans',
                  color: Colors.white,
                  fontWeight: FontWeight.w600
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
import 'package:apitest3/core/constants/color_palatte.dart';
import 'package:flutter/material.dart';

class RoundedContainer extends StatelessWidget {
  final Widget child;
  final double borderRadius;
  final EdgeInsets padding;

  const RoundedContainer({
    required this.child,
    this.borderRadius = 10.0,
    this.padding = const EdgeInsets.all(10.0),
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius),
      child: Container(
        decoration: BoxDecoration(
          color: ColorPalette.primaryColor.withOpacity(0.19),
        ),
        padding: padding,
        child: child,
      ),
    );
  }
}
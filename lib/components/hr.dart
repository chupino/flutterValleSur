import 'package:flutter/cupertino.dart';

class hr extends StatelessWidget {
  final double? height;
  final double? width;
  const hr({this.height, super.key, this.width});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? 12,
      width: width ?? 12,
    );
  }
}

import 'package:apitest3/components/headerSelectPaxAndDate.dart';
import 'package:apitest3/core/constants/color_palatte.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_flutter/qr_flutter.dart';

class ReservaQR extends StatelessWidget {
  const ReservaQR({super.key});

  @override
  Widget build(BuildContext context) {
    final qr = Get.arguments;
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: ColorPalette.backgroundScaffoldSecundaryColor,
        body: Center(
            child: Column(
          children: [
            SimpleHeader(title: "Tu Reserva", height: 150, size: size),
            Container(
              padding: EdgeInsets.symmetric(vertical: 20,horizontal: 10),
              margin: EdgeInsets.symmetric(vertical: 20,horizontal: 10),
              width: size.width * 0.8,
              decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 255, 255, 255).withOpacity(0.7),
                  borderRadius: BorderRadius.circular(10)),
              child: Column(
                children: [
                  QrImageView(
                    data: "http://127.0.0.1:8080/administrador/reservas-show/"+qr,
                    version: QrVersions.auto,
                    size: 200,
                  ),
                ],
              ),
            ),
          ],
        )));
  }
}

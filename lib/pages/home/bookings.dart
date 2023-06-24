import 'package:apitest3/components/bookingScaffold.dart';
import 'package:apitest3/components/headerSelectPaxAndDate.dart';
import 'package:apitest3/components/item_button_widget_solid.dart';
import 'package:apitest3/components/item_reserva_widget.dart';
import 'package:apitest3/controller/BookingsController.dart';
import 'package:apitest3/core/constants/color_palatte.dart';
import 'package:apitest3/models/reserva_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class ReservasPage extends StatefulWidget {
  const ReservasPage({super.key});

  @override
  State<ReservasPage> createState() => _ReservasPageState();
}

class _ReservasPageState extends State<ReservasPage> {


  @override
  Widget build(BuildContext context) {
    final controller = Get.put(BookingController());
    final Size size = MediaQuery.of(context).size;
    return FutureBuilder(
        future: controller.isAuthenticated(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data == true) {
              return Scaffold(
                  backgroundColor:
                      ColorPalette.backgroundScaffoldSecundaryColor,
                  body: SingleChildScrollView(
                      child: Container(
                          child: Column(
                    children: [
                      //ItemReservaWidget(reservaModel: reserva)
                      SimpleHeader(
                          title: "Mis reservas", height: 180, size: size),
                      Container(
                          padding: EdgeInsets.symmetric(
                              vertical: 15, horizontal: 10),
                          child: BookingsList())
                    ],
                  ))));
            } else {
              print(snapshot.data);
              return Scaffold(
                  backgroundColor:
                      ColorPalette.backgroundScaffoldSecundaryColor,
                  body: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Container(
                            padding: EdgeInsets.all(10),
                            width: size.width * 0.9,
                            decoration: BoxDecoration(
                                color:
                                    ColorPalette.secondColor.withOpacity(0.7),
                                borderRadius: BorderRadius.circular(10)),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Lottie.asset(
                                    "assets/animations/lock-animation.json"),
                                Text.rich(
                                  TextSpan(
                                    text:
                                        'Parece que no estas verificado con tu documento de identidad ',
                                    style: TextStyle(
                                        fontFamily: "Poppins",
                                        fontSize: 18,
                                        color: ColorPalette.text1Color),
                                    children: [
                                      TextSpan(
                                        text: 'Hazlo ahora!',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18,
                                            color: Color.fromARGB(
                                                255, 59, 205, 46),
                                            fontFamily: "Poppins"),
                                      ),
                                    ],
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                ItemButtonWidgetSolid(
                                  data: "Autenticarme",
                                  onTap: () {
                                    Get.toNamed("/authID");
                                  },
                                  color: ColorPalette.blue,
                                )
                              ],
                            )),
                      ],
                    ),
                  ));
            }
          } else {
            return Container(
              child: Text("Error"),
            );
          }
        });
  }
}

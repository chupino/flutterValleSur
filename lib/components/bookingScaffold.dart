import 'package:apitest3/components/bookingsListBuilder.dart';
import 'package:apitest3/components/item_reserva_widget.dart';
import 'package:apitest3/controller/BookingsController.dart';
import 'package:apitest3/core/constants/color_palatte.dart';
import 'package:apitest3/models/reserva_model.dart';
import 'package:apitest3/pages/hotelDetails/hotelDetails.dart';
import 'package:apitest3/pages/reservaDetails/reservaDetails.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class BookingsList extends GetView<BookingController> {
  const BookingsList({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(BookingController());
    final Size size = MediaQuery.of(context).size;
    return FutureBuilder(

        future: controller.getReservas(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            //return Text("data");
            List<ReservaModel> reservas = [];

            reservas = snapshot.data!
                .map((item) => ReservaModel.fromJson(item))
                .toList();
            return BookingListBuilder(
              child: Column(children: 
                  reservas.map((e) => ItemReservaWidget(reservaModel: e,onTap: () {
                    Get.toNamed("/reservaDetails",arguments: e);
                  },)).toList()
                ),
              
              );
            /* return ListView.builder(
              itemCount: reservas.length,
              itemBuilder: (BuildContext context, int index) {
                ReservaModel reservaModel = reservas[index];
                return ItemReservaWidget(reservaModel: reservaModel);
              },
            ); */
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (snapshot.hasError && snapshot.error is MySpecificError) {
            // Manejo de la excepción MySpecificError
            return Center(
              child: Container(
                padding: EdgeInsets.all(10),
                width: size.width * 0.8,
                decoration: BoxDecoration(
                    color: ColorPalette.secondColor.withOpacity(0.7),
                    borderRadius: BorderRadius.circular(6)),
                child: Column(
                  children: [
                    Lottie.asset("assets/animations/112136-empty-red.json"),
                    Text(
                      "Parece que aún no has realizado reservas",
                      style: TextStyle(
                        color: ColorPalette.text1Color,
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            );
          } else if (snapshot.hasError) {
            // Manejo de otras excepciones no controladas
            return Center(child: Text("Unhandled Exception"));
          } else {
            return CircularProgressIndicator();
          }
        });
  }
}

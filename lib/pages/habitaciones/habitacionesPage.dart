import 'package:apitest3/components/item_room_list.dart';
import 'package:apitest3/controller/habitacionesController.dart';
import 'package:apitest3/core/constants/color_palatte.dart';
import 'package:apitest3/models/room_model.dart';
import 'package:apitest3/pages/reservaForm/checkOutStep1.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

import '../../components/habitacionesList.dart';
import '../../components/item_room_widget.dart';
import 'package:lottie/lottie.dart';

class HabitacionesPage extends GetView<HabitacionController> {
  static const String checkout = '/habitaciones';

  HabitacionesPage({
    Key? key
    }):super(key: key) {
      controller.arguments=Get.arguments;
    }
  @override
  Widget build(BuildContext context) {
    final argumentosPreReserva=controller.arguments;

    // TODO: implement build
    return FutureBuilder(
        future: controller.getHabitaciones(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Scaffold(
              backgroundColor: ColorPalette.backgroundScaffoldSecundaryColor,
              body: Center(
                child: Lottie.asset("assets/animations/loading.json",height: 150),
              ),
            );
          } else if (snapshot.hasData) {
            List<RoomModel> habitaciones =
                controller.showHabitaciones(habitaciones: snapshot.data!);
            return HabitacionesList(
              acompaniantes: argumentosPreReserva![1].toString(),
              selectedDate: argumentosPreReserva![2].toString(),
              child: SingleChildScrollView(
                child: Column(
                  children: habitaciones
                      .map((e) => ItemRoomListWidget(
                            roomModel: e,
                            onTap: () {
                              String imagen=e.roomImage;
                              Map reserva={
                                "_id":e.id.toString(),
                                "nro_habitacion":e.roomNum.toString(),
                                "nro_piso":e.floorNum.toString(),
                                "tipo_habitacion":e.roomName,
                                "precio":e.price,
                                "estado":e.estado,
                                "caracteristicas":e.features,
                                "imagen":e.roomImage
                              };
                              /* Get.toNamed("/checkout", arguments: [
                                  e,
                                ]); */
                                //Get.toNamed(CheckOutScreen.routeName, arguments: e);
                                controller.isVerify().then((value) {
                                  if(value){
                                    print("si esta registrado");
                                    Get.toNamed(CheckOutScreen.routeName, arguments: [{"room":e,"preBooking":argumentosPreReserva}]);
                                  }else{
                                    print("no esta registrado");
                                    Get.toNamed("/authID");
                                  }
                                });
                                //Get.toNamed("/authID");
                              //print(e);
                            },
                          ))
                      .toList(),
                ),
              ),
            );
            //throw "bien";
          } else {
            return CircularProgressIndicator();
          }
        });
  }
}

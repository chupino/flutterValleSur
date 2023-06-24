import 'package:apitest3/components/animated_button.dart';
import 'package:apitest3/components/header.dart';
import 'package:apitest3/components/headerSelectPaxAndDate.dart';
import 'package:apitest3/components/item_button_widget.dart';
import 'package:apitest3/components/item_options_reserva.dart';
import 'package:apitest3/core/constants/color_palatte.dart';
import 'package:apitest3/core/constants/dimension_constants.dart';
import 'package:apitest3/core/helpers/asset_helper.dart';
import 'package:apitest3/pages/formPax&Date/selectDatePage.dart';
import 'package:apitest3/pages/formPax&Date/selectPax.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:apitest3/extensions/dateTime_ext.dart';

class SelectPaxAndDatePage extends StatefulWidget {
  const SelectPaxAndDatePage({Key? key, this.destination}) : super(key: key);

  static const String routeName = '/hotel_booking_screen';

  final String? destination;

  @override
  State<SelectPaxAndDatePage> createState() => _SelectPaxAndDatePageState();
}

class _SelectPaxAndDatePageState extends State<SelectPaxAndDatePage> {
  String? selectDate;
  String? selectDateInicio;
  String? selectDateFinal;
  String? acompaniantes;

  int? nroAcompaniantes;
  int? diferenciaEnDias;
  var date;
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
        extendBody: true,
        backgroundColor: ColorPalette.backgroundScaffoldSecundaryColor,
        body: SingleChildScrollView(
            child: Column(
          children: <Widget>[
            /* SliverAppBar(
                  expandedHeight: 200,
                  flexibleSpace: FlexibleSpaceBar(
                    background: HeaderWithSearchBox(size: size),
                  ),
                ), */
            SimpleHeader(
              height: 200,
              size: size,
              title: "Seleccionar Acompañantes y Fechas de Estadia",
            ),
            Container(
              padding: EdgeInsets.all(15),
              child: Column(children: [
                ItemOptionsBookingWidget(
                    title: "Destino",
                    value: "Moquegua",
                    icon: AssetHelper.icoLocation,
                    onTap: () {}),
                ItemOptionsBookingWidget(
                    title: "Seleccionar Fecha",
                    value: selectDate ?? 'Seleccionar Fecha',
                    icon: AssetHelper.icoCalendal,
                    onTap: () async {
                      final result = await Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SelectDateScreen()));
                      if (result is List<DateTime?>) {
                        setState(() {
                          date=result;
                          selectDate =
                              '${result[0]?.getStartDate} - ${result[1]?.getEndDate}';
                          selectDateInicio = result[0]?.getStartDate;
                          selectDateFinal = result[0]?.getEndDate;
                          Duration diff=result[0]!.difference(result[1]!);
                          diferenciaEnDias= diff.inDays.abs();
                        });
                      }
                    }),
                ItemOptionsBookingWidget(
                  title: "Acompañantes",
                  value: acompaniantes ?? "Acompañantes",
                  icon: AssetHelper.icoGuest,
                  onTap: () async {
                    final result = await Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SelectPaxPage()));
                    if (result is List<int>) {

                      setState(() {
                        if (result[0] == 1) {
                          acompaniantes = '${result[0]} Acompañante';
                          nroAcompaniantes = result[0];
                        } else {
                          acompaniantes = '${result[0]} Acompañantes';
                          nroAcompaniantes = result[0];
                        }
                      });
                    }
                  },
                ),
                ItemButtonWidget(
                  data: "Buscar Habitaciones",
                  onTap: () {
                    if (acompaniantes == null ||
                        selectDate == null ||
                        selectDateInicio == null ||
                        selectDateFinal == null) {
                      Get.snackbar('Atención',
                          'Debes seleccionar los datos para continuar',
                          snackPosition: SnackPosition.BOTTOM,
                          backgroundColor: ColorPalette.primaryColor,
                          colorText: Colors.white,
                          margin: const EdgeInsets.all(10),
                          duration: const Duration(seconds: 2));
                    } else {
                      print(date[0]);
                      Get.toNamed("/habitaciones", arguments: [
                        nroAcompaniantes,
                        acompaniantes,
                        selectDate,
                        diferenciaEnDias.toString(),
                        date[0],
                        date[1]
                      ]);
                    }
                  },
                )
              ]),
            )
          ],
        )));
  }
}

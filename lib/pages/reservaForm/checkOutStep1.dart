import 'package:apitest3/components/CustomRadioButton.dart';
import 'package:apitest3/components/CustomSelectTime.dart';
import 'package:apitest3/components/HeaderCheckout.dart';
import 'package:apitest3/components/HeaderCheckoutMini.dart';
import 'package:apitest3/components/checkin.dart';
import 'package:apitest3/components/checkout.dart';
import 'package:apitest3/components/headerSelectPaxAndDate.dart';
import 'package:apitest3/components/item_bookingprices_widget.dart';
import 'package:apitest3/components/item_button_widget_solid.dart';
import 'package:apitest3/components/item_user_widget.dart';
import 'package:apitest3/controller/CheckOutController.dart';
import 'package:apitest3/models/detail_succes_content.dart';
import 'package:apitest3/models/user.dart';
import 'package:intl/intl.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:apitest3/core/constants/color_palatte.dart';
import 'package:apitest3/core/constants/dimension_constants.dart';
import 'package:apitest3/core/constants/textstyle_ext.dart';
import 'package:apitest3/core/helpers/asset_helper.dart';
import 'package:apitest3/core/helpers/image_helper.dart';
import 'package:apitest3/models/room_model.dart';
import 'package:lottie/lottie.dart';
import 'package:dotted_line/dotted_line.dart';
//import 'package:apitest3/representation/screen/main_app.dart';
import 'package:apitest3/components/item_button_widget.dart';
import 'package:apitest3/components/item_room_widget.dart';
import 'package:time_range/time_range.dart';
import 'package:apitest3/components/app_bar_container.dart';
import 'package:get/get.dart';
import 'package:easy_stepper/easy_stepper.dart';

class CheckOutScreen extends StatefulWidget {
  const CheckOutScreen({Key? key}) : super(key: key);

  static const String routeName = '/checkout';

  @override
  State<CheckOutScreen> createState() => _CheckOutScreenState();
}

class _CheckOutScreenState extends State<CheckOutScreen> {
  final peticionesAdicionalesController = TextEditingController();
  final _maxLines = 2;

  int activeStep = 0;
  int activeStep2 = 0;
  int reachedStep = 0;
  int upperBound = 5;

  String? _selectedValueReserva;
  String? _selectedValueTrabajo;
  String? _selectedValueHora;
  ScrollController _scrollController = ScrollController();
  TimeRangeResult? _selectedRangeHora;
  final List<String> steps = [
    'Book and Review',
    'Payment',
    'Confirm',
  ];
  final dashImages = [
    'assets/1.png',
    'assets/2.png',
    'assets/3.png',
    'assets/4.png',
    'assets/5.png',
    'assets/5.png',
  ];
  @override
  void initState() {
    // TODO: implement initState

    super.initState();
  }

  Widget _buildItemTextBoxCheckout(String icon, String title, String value,
      Size size, TextEditingController controller) {
    return Container(
      padding: EdgeInsets.all(kDefaultPadding),
      decoration: BoxDecoration(
          color: ColorPalette.primaryColor.withOpacity(0.7),
          borderRadius: BorderRadius.circular(kDefaultPadding)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              ImageHelper.loadFromAsset(
                icon,
              ),
              SizedBox(
                width: kDefaultPadding,
              ),
              Text(
                title,
                style: TextStyles.defaultStyle.bold,
              ),
              SizedBox(
                width: 30,
              ),
              Text(
                "Opcional",
                style: TextStyle(color: ColorPalette.formFieldLabelColor),
              )
            ],
          ),
          SizedBox(
            height: kMediumPadding,
          ),
          Container(
            width: size.width * 0.8,
            decoration: BoxDecoration(
              color: ColorPalette.secondColor.withOpacity(0.15),
              borderRadius: BorderRadius.circular(
                30,
              ),
            ),
            padding: EdgeInsets.only(left: 20, right: 20, top: 15, bottom: 8),
            child: TextField(
              controller: controller,
              style: TextStyle(color: ColorPalette.formFieldLabelColor),
              maxLines: null,
              maxLength: 180,
              decoration: InputDecoration(
                hintStyle: TextStyle(color: ColorPalette.formFieldLabelColor),
                border: InputBorder.none,
                hintText: 'Escribe aquí...',
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CheckOutController());
    final RoomModel arguments = Get.arguments[0]["room"];
    final argumentsPreBooking = Get.arguments[0]["preBooking"];
    Size size = MediaQuery.of(context).size;

    return Scaffold(
        extendBodyBehindAppBar: false,
        extendBody: false,
        backgroundColor: ColorPalette.backgroundScaffoldSecundaryColor,
        body: CustomScrollView(slivers: [
          SliverPersistentHeader(
            delegate: _HeaderDelegate(size: size, activeStep: activeStep),
            pinned: true,
          ),
          SliverList(
              delegate: SliverChildListDelegate([
            Column(children: [
              if (activeStep == 0) ...[
                SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        padding:
                            EdgeInsets.only(right: 20, left: 20, bottom: 20),
                        child: Column(
                          children: [
                            /* ItemRoomWidget(
                                  roomModel: arguments, numberOfRoom: 1), */
                            CustomRadioButton(
                              icon: AssetHelper.icoGuest,
                              title: "Para quien es la reserva?",
                              selectedValue: _selectedValueReserva,
                              onChanged: (value) {
                                setState(() {
                                  _selectedValueReserva = value;
                                });
                              },
                              value1: "Para mi",
                              value2: "Para otra persona",
                              fontSize: 13,
                            ),
                            SizedBox(
                              height: kMediumPadding,
                            ),
                            CustomRadioButton(
                              icon: AssetHelper.icoGuest,
                              title: "Vienes por trabajo?",
                              selectedValue: _selectedValueTrabajo,
                              onChanged: (value) {
                                setState(() {
                                  _selectedValueTrabajo = value;
                                });
                              },
                              value1: "Si",
                              value2: "No",
                              fontSize: 15,
                              margin: 40,
                            ),
                            SizedBox(
                              height: kMediumPadding,
                            ),
                            _buildItemTextBoxCheckout(
                                AssetHelper.icoHotel,
                                "Peticiones Adicionales",
                                "nose",
                                size,
                                peticionesAdicionalesController),
                            SizedBox(
                              height: kMediumPadding,
                            ),
                            CustomSelectTime(
                              icon: AssetHelper.icoGuest,
                              title: "Marcar Hora de LLegada",
                              selectedValue: _selectedValueHora,
                              onChanged: (value) {
                                setState(() {
                                  _selectedValueHora = value;
                                  _selectedRangeHora = null;
                                });
                              },
                              value1: "Si",
                              value2: "No",
                              fontSize: 15,
                              margin: 40,
                              onRangeCompleted: (value) {
                                _selectedRangeHora = value;
                              },
                            ),
                            SizedBox(
                              height: kMediumPadding,
                            ),
                            ItemButtonWidget(
                              data: 'Siguiente',
                              onTap: () {
                                print(argumentsPreBooking);
                                print(arguments);
                                print(_selectedValueReserva);
                                print(_selectedValueTrabajo);
                                print(peticionesAdicionalesController.text);
                                print(_selectedValueHora);
                                if (_selectedValueReserva != null &&
                                    _selectedValueTrabajo != null &&
                                    _selectedValueHora != null) {
                                  if (_selectedValueHora == "No") {
                                    //print("bien todo");
                                    setState(() {
                                      activeStep = 1;
                                    });
                                  } else {
                                    if (_selectedRangeHora != null) {
                                      if (_selectedRangeHora!.start != null &&
                                          _selectedRangeHora!.end != null) {
                                        //print("bien todo");
                                        //print("bien");
                                        setState(() {
                                          activeStep = 1;
                                        });
                                      } else {
                                        //print("bien pero falta la hora");
                                        Get.snackbar('Atención',
                                            'Te faltan llenar algunos datos',
                                            snackPosition: SnackPosition.BOTTOM,
                                            backgroundColor:
                                                ColorPalette.dangerColor,
                                            colorText: Colors.white,
                                            margin: const EdgeInsets.all(10),
                                            duration:
                                                const Duration(seconds: 2));
                                      }
                                    } else {
                                      //print("bien todo pero falta hora");
                                      Get.snackbar('Atención',
                                          'Te faltan llenar algunos datos',
                                          snackPosition: SnackPosition.BOTTOM,
                                          backgroundColor:
                                              ColorPalette.dangerColor,
                                          colorText: Colors.white,
                                          margin: const EdgeInsets.all(10),
                                          duration: const Duration(seconds: 2));
                                    }
                                  }
                                } else {
                                  Get.snackbar('Atención',
                                      'Te faltan llenar algunos datos',
                                      snackPosition: SnackPosition.BOTTOM,
                                      backgroundColor: ColorPalette.dangerColor,
                                      colorText: Colors.white,
                                      margin: const EdgeInsets.all(10),
                                      duration: const Duration(seconds: 2));
                                }
                              },
                            ),
                            SizedBox(
                              height: kMediumPadding,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                )
              ] else if (activeStep == 1) ...[
                FutureBuilder(
                    future: controller.getUserModel(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        List<Map<String, dynamic>> items2 = [
                          {
                            "item": arguments.roomName,
                            "precio": arguments.price
                          },
                          {"item": "Comisión", "precio": "3.5"},
                        ];
                        double precioFinal = 0;

                        for (var item in items2) {
                          double precio =
                              double.tryParse(item["precio"].toString()) ?? 0.0;
                          if (precio != null) {
                            precioFinal += precio;
                          }
                        }

                        return SingleChildScrollView(
                          child: Column(
                            children: [
                              SizedBox(
                                height: 20,
                              ),
                              Container(
                                padding: EdgeInsets.only(
                                    right: 20, left: 20, bottom: 20),
                                child: Column(
                                  children: [
                                    ItemRoomWidget(
                                        roomModel: arguments, numberOfRoom: 1),
                                    ItemUserWidget(userModel: snapshot.data!),
                                    ItemBookingPrices(
                                      items: items2,
                                      precioFinal: precioFinal.toString(),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        SizedBox(
                                            width: size.width / 2 - 25,
                                            child: ItemButtonWidget(
                                              data: "Atrás",
                                              onTap: () {
                                                setState(() {
                                                  activeStep--;
                                                });
                                              },
                                            )),
                                        SizedBox(
                                            width: size.width / 2 - 25,
                                            child: ItemButtonWidget(
                                              data: "Pagar",
                                              onTap: () {
                                                controller.postCompra = () {
                                                  controller.hacerReserva(
                                                    dias: argumentsPreBooking[3]
                                                        .toString(),
                                                    pax: argumentsPreBooking[0]
                                                        .toString(),
                                                    idHabitacion: arguments.id,
                                                    razonHospedaje:
                                                        _selectedValueTrabajo ==
                                                                "Si"
                                                            ? "Trabajo"
                                                            : "Otro",
                                                    destinatario:
                                                        _selectedValueReserva ??
                                                            "Desconocido",
                                                    peticionesAdicionales:
                                                        peticionesAdicionalesController
                                                            .text,
                                                    horaLlegada:
                                                        _selectedRangeHora
                                                                .toString() ??
                                                            "No sabe",
                                                    fecha_checkin: argumentsPreBooking[4].toString(),
                                                    fecha_checkout: argumentsPreBooking[5].toString()
                                                  );
                                                  setState(() {
                                                    activeStep = 2;
                                                  });
                                                };
                                                controller
                                                    .makePayment(
                                                        amount: precioFinal
                                                            .toString(),
                                                        currency: "USD")
                                                    .then((value) {
                                                  print("pago hecho");
                                                }).onError(
                                                        (error, stackTrace) {});
                                                /* controller.hacerReserva(
                                                        dias:
                                                            argumentsPreBooking[
                                                                3].toString(),
                                                        pax: argumentsPreBooking[
                                                            0].toString(),
                                                        idHabitacion:
                                                            arguments.id,
                                                        razonHospedaje:
                                                            _selectedValueTrabajo ==
                                                                    "Si"
                                                                ? "Trabajo"
                                                                : "Otro",
                                                        destinatario:
                                                            _selectedValueReserva ??
                                                                "Desconocido",
                                                        peticionesAdicionales:
                                                            peticionesAdicionalesController
                                                                .text,
                                                        horaLlegada:
                                                            _selectedRangeHora
                                                                    .toString() ??
                                                                "No sabe",); */
                                              },
                                            )),
                                      ],
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        );
                      } else if (snapshot.connectionState ==
                          ConnectionState.waiting) {
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 150,
                            ),
                            Center(
                              child: CircularProgressIndicator(),
                            ),
                          ],
                        );
                      } else if (snapshot.hasError) {
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 150,
                            ),
                            Center(
                              child: Text(snapshot.error.toString()),
                            ),
                          ],
                        );
                      } else {
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 150,
                            ),
                            Center(
                              child: CircularProgressIndicator(),
                            ),
                          ],
                        );
                      }
                    }),
              ] else if (activeStep == 2) ...[
                SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 20),
                        child: Column(
                          children: [
                            Container(
                                padding: EdgeInsets.all(kDefaultPadding),
                                width: size.width * 0.8,
                                decoration: BoxDecoration(
                                    color: ColorPalette.secondColor
                                        .withOpacity(0.7),
                                    borderRadius:
                                        BorderRadius.circular(kDefaultPadding)),
                                child: Column(
                                  children: [
                                    Text(
                                      "Su reserva fue realizada correctamente",
                                      style: TextStyle(
                                        color: ColorPalette.text1Color,
                                        fontFamily: "Poppins",
                                        fontWeight: FontWeight.bold,
                                        fontSize: 24,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Lottie.asset(
                                        "assets/animations/cart-checkout.json"),
                                    Text.rich(
                                      TextSpan(
                                        text:
                                            'Puedes ver los detalles de tu reserva en la pantalla ',
                                        style: TextStyle(
                                            fontFamily: "Poppins",
                                            fontSize: 18,
                                            color: ColorPalette.text1Color),
                                        children: [
                                          TextSpan(
                                            text: 'Reservas',
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
                                      onTap: (){
                                        Get.toNamed("/home");
                                      },
                                      data: "Ir ahora",
                                      color: ColorPalette.blue,
                                    )
                                    /* Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: [
                                    SizedBox(
                                      width: size.width*0.32,
                                      child: ItemButtonWidgetSolid(data: "Ir ahora",color: ColorPalette.blue,)),
                                    SizedBox(
                                      width: size.width*0.35,
                                      child: ItemButtonWidgetSolid(data: "Volver a Inicio",color: ColorPalette.blue))

                                      ],
                                    ) */
                                  ],
                                )),
                          ],
                        ),
                      )
                    ],
                  ),
                )
              ]
            ])
          ]))
        ]));

    /* ListView.builder(
                    controller: _scrollController,
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: detail_succes_content.length,
                  itemBuilder: (BuildContext context, int index) {
                    DetailSuccesContent detailsuccescontents =
                        detail_succes_content[index];
                    
                            
                            ItemButtonWidget(
                              data: "Terminar",
                              onTap: () {
                                Get.toNamed("/home");
                              },
                            );
                  }
                  ), */

    ///example with step tapping only on already reached steps
  }

  bool _allowTabStepping(int index) => index <= reachedStep;

  /// Returns the next button.
  Widget _nextStep() {
    return IconButton(
      onPressed: () {
        if (activeStep2 < upperBound) {
          setState(() {
            ++activeStep2;
            if (reachedStep < activeStep2) {
              reachedStep = activeStep2;
            }
          });
        }
      },
      icon: const Icon(Icons.arrow_forward_ios),
    );
  }

  /// Returns the previous button.
  Widget _previousStep() {
    return IconButton(
      onPressed: () {
        if (activeStep2 > 0) {
          setState(() => --activeStep2);
        }
      },
      icon: const Icon(Icons.arrow_back_ios),
    );
  }
}

class _HeaderDelegate extends SliverPersistentHeaderDelegate {
  final Size size;
  int activeStep;
  _HeaderDelegate({required this.activeStep, required this.size});

  bool isCollapsed(double shrinkOffset) {
    return shrinkOffset > 100;
  }

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    // TODO: implement build
    final scaleFactor = 1 - shrinkOffset / 200;
    final collapsed = isCollapsed(shrinkOffset);
    return Container(
      height: maxExtent,
      child: Stack(
        children: <Widget>[
          Visibility(
            visible: !collapsed,
            child: HeaderCheckout(
              size: size,
              activeStep: activeStep,
            ),
          ),
          Visibility(
            visible: collapsed,
            child: HeaderCheckoutMini(
              size: size,
              activeStep: activeStep,
            ),
          ),
        ],
      ),
    );
  }

  @override
  double get maxExtent => size.height * 0.32;

  @override
  double get minExtent => size.height * 0.24;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}

/*  Scaffold(
      backgroundColor: ColorPalette.backgroundScaffoldSecundaryColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SimpleHeader(title: "Checkout", height: 150, size: size),
            /* Row(
          children: steps
              .map((e) => _buildItemCheckOutStep(
                  steps.indexOf(e) + 1, e, steps.indexOf(e) == steps.length - 1, steps.indexOf(e) == 0))
              .toList(),
        ), */
            Container(
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  SizedBox(
                    height: kMediumPadding,
                  ),
                  ItemRoomWidget(roomModel: arguments, numberOfRoom: 1),
                  CustomRadioButton(
                    icon: AssetHelper.icoGuest,
                    title: "Para quien es la reserva?",
                    selectedValue: _selectedValueReserva,
                    onChanged: (value) {
                      setState(() {
                        _selectedValueReserva = value;
                      });
                    },
                    value1: "Para mi",
                    value2: "Para otra persona",
                    fontSize: 13,
                  ),
                  SizedBox(
                    height: kMediumPadding,
                  ),
                  CustomRadioButton(
                    icon: AssetHelper.icoGuest,
                    title: "Vienes por trabajo?",
                    selectedValue: _selectedValueTrabajo,
                    onChanged: (value) {
                      setState(() {
                        _selectedValueTrabajo = value;
                      });
                    },
                    value1: "Si",
                    value2: "No",
                    fontSize: 15,
                    margin: 40,
                  ),
                  SizedBox(
                    height: kMediumPadding,
                  ),
                  _buildItemTextBoxCheckout(
                      AssetHelper.icoHotel,
                      "Peticiones Adicionales",
                      "nose",
                      size,
                      peticionesAdicionalesController),
                  SizedBox(
                    height: kMediumPadding,
                  ),
                  CustomSelectTime(
                    icon: AssetHelper.icoGuest,
                    title: "Marcar Hora de LLegada",
                    selectedValue: _selectedValueHora,
                    onChanged: (value) {
                      setState(() {
                        _selectedValueHora = value;
                        _selectedRangeHora = null;
                      });
                    },
                    value1: "Si",
                    value2: "No",
                    fontSize: 15,
                    margin: 40,
                    onRangeCompleted: (value) {
                      _selectedRangeHora = value;
                    },
                  ),
                  SizedBox(
                    height: kMediumPadding,
                  ),
                  ItemButtonWidget(
                    data: 'Siguiente',
                    onTap: () {
                      print(_selectedValueReserva);
                      print(_selectedValueTrabajo);
                      print(peticionesAdicionalesController.text);
                      print(_selectedValueHora);
                      if (_selectedValueReserva != null &&
                          _selectedValueTrabajo != null &&
                          _selectedValueHora != null) {
                        if (_selectedValueHora == "No") {
                          //print("bien todo");
                        } else {
                          if (_selectedRangeHora != null) {
                            if (_selectedRangeHora!.start != null &&
                                _selectedRangeHora!.end != null) {
                              //print("bien todo");
                              print("bien");
                            } else {
                              //print("bien pero falta la hora");
                              Get.snackbar(
                                  'Atención', 'Te faltan llenar algunos datos',
                                  snackPosition: SnackPosition.BOTTOM,
                                  backgroundColor: ColorPalette.dangerColor,
                                  colorText: Colors.white,
                                  margin: const EdgeInsets.all(10),
                                  duration: const Duration(seconds: 2));
                            }
                          } else {
                            //print("bien todo pero falta hora");
                            Get.snackbar(
                                'Atención', 'Te faltan llenar algunos datos',
                                snackPosition: SnackPosition.BOTTOM,
                                backgroundColor: ColorPalette.dangerColor,
                                colorText: Colors.white,
                                margin: const EdgeInsets.all(10),
                                duration: const Duration(seconds: 2));
                          }
                        }
                      } else {
                        Get.snackbar(
                            'Atención', 'Te faltan llenar algunos datos',
                            snackPosition: SnackPosition.BOTTOM,
                            backgroundColor: ColorPalette.dangerColor,
                            colorText: Colors.white,
                            margin: const EdgeInsets.all(10),
                            duration: const Duration(seconds: 2));
                      }
                    },
                  ),
                  SizedBox(
                    height: kMediumPadding,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    ); */

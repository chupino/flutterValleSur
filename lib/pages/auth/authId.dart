import 'package:apitest3/components/CustomAuthIdRadioButton.dart';
import 'package:apitest3/components/CustomRadioButton.dart';
import 'package:apitest3/components/HeaderAuthId.dart';
import 'package:apitest3/components/custom_textfield.dart';
import 'package:apitest3/components/headerSelectPaxAndDate.dart';
import 'package:apitest3/components/item_button_widget.dart';
import 'package:apitest3/components/item_change_pax.dart';
import 'package:apitest3/controller/AuthIdController.dart';
import 'package:apitest3/core/constants/color_palatte.dart';
import 'package:apitest3/core/constants/dimension_constants.dart';
import 'package:apitest3/core/constants/textstyle_ext.dart';
import 'package:apitest3/core/helpers/asset_helper.dart';
import 'package:apitest3/core/helpers/image_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class AuthID extends StatefulWidget {
  const AuthID({Key? key}) : super(key: key);

  static const String routeName = '/guest_and_room_screen';

  @override
  State<AuthID> createState() => _AuthIDState();
}

class _AuthIDState extends State<AuthID> {
  final GlobalKey<ItemChangePaxState> _itemCountGuest =
      GlobalKey<ItemChangePaxState>();
  final controllerdni = TextEditingController();
  final controllerex = TextEditingController();
  String? tipoId;
  String? id;
  String estadoBoton = "1";
  bool autenticado = false;
  String dni = "";
  String nombre = "";
  int activeStep = 0;
  final tipoDocumentoController=TextEditingController();
  final numeroDocumentoController=TextEditingController();
  final nombresController=TextEditingController();
  late Map<String, dynamic> user;
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AuthIdController());
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: ColorPalette.backgroundScaffoldSecundaryColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            HeaderAuthId(
              activeStep: activeStep,
              size: size,
            ),
            if (activeStep == 0) ...[
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Column(
                  children: [
                    CustomAuthIdRadioButton(
                        controllerDni: controllerdni,
                        controllerEx: controllerex,
                        icon: AssetHelper.icoPromo,
                        selectedValue: tipoId,
                        title: "Tipo de Identificación",
                        onChangedRadioButton: (value) {
                          setState(() {
                            tipoId = value;
                          });
                        },
                        onChangedID: (value) {
                          setState(() {
                            print(value);
                            id = value;
                          });
                        }),
                    SizedBox(
                      height: kDefaultPadding,
                    ),
                    GestureDetector(
                      onTap: () {
                        if (tipoId != null) {
                          if (tipoId == "Dni") {
                            if (controllerdni.text != "") {
                              setState(() {
                                estadoBoton = "2";
                              });
                              controller
                                  .getDataFromReniec(dni: controllerdni.text)
                                  .then((value) {
                                setState(() {
                                  estadoBoton = "3";
                                });
                                Future.delayed(const Duration(seconds: 2), () {
                                  //Get.offNamed("/home");
                                  setState(() {
                                    activeStep = 1;
                                    user = value;
                                    tipoDocumentoController.text="Dni";
                                    numeroDocumentoController.text=controllerdni.text;
                                    nombresController.text=value["data"]["nombre_completo"];
                                  });
                                });
                                Future.delayed(const Duration(seconds: 1), () {
                                  //Get.offNamed("/home");
                                  setState(() {
                                    estadoBoton = "1";
                                  });
                                });
                              }).catchError((error) {
                                setState(() {
                                  estadoBoton = "1";
                                });
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: const Text(
                                        'Error',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      content: const Text(
                                        'Verifica tus datos o intenta mas tarde',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      actions: [
                                        TextButton(
                                          child: const Text(
                                            'Aceptar',
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                          onPressed: () {
                                            //Navigator.of(context).pop();
                                          },
                                        ),
                                      ],
                                    );
                                  },
                                );
                              });
                            } else {
                              Get.snackbar('Atención', 'Introduce tu documento',
                                  snackPosition: SnackPosition.BOTTOM,
                                  backgroundColor: ColorPalette.dangerColor,
                                  colorText: Colors.white,
                                  margin: const EdgeInsets.all(10),
                                  duration: const Duration(seconds: 2));
                            }
                          } else {
                            if (controllerex.text != "") {
                              setState(() {
                                tipoDocumentoController.text="Carnet de Extranjeria";
                                    numeroDocumentoController.text=controllerex.text;
                                activeStep = 1;
                              });
                            } else {
                              Get.snackbar('Atención', 'Introduce tu documento',
                                  snackPosition: SnackPosition.BOTTOM,
                                  backgroundColor: ColorPalette.dangerColor,
                                  colorText: Colors.white,
                                  margin: const EdgeInsets.all(10),
                                  duration: const Duration(seconds: 2));
                            }
                          }
                        } else {
                          Get.snackbar(
                              'Atención', 'Selecciona un tipo de documento',
                              snackPosition: SnackPosition.BOTTOM,
                              backgroundColor: ColorPalette.dangerColor,
                              colorText: Colors.white,
                              margin: const EdgeInsets.all(10),
                              duration: const Duration(seconds: 2));
                        }
                      },
                      child: Container(
                        alignment: Alignment.center,
                        width: size.width * 0.8,
                        height: size.height * 0.075,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(kMediumPadding),
                          gradient: Gradients.defaultGradientBackground,
                        ),
                        child: estadoBoton == "1"
                            ? Text(
                                "Validar",
                                style: TextStyle(
                                  color:
                                      const Color.fromARGB(255, 253, 253, 253),
                                  fontWeight: FontWeight.bold,
                                  fontSize: size.width * 0.06,
                                  fontFamily: 'ProductSans',
                                ),
                              )
                            : estadoBoton == "2"
                                ? Lottie.asset(
                                    "assets/animations/loginLoading.json")
                                : Lottie.asset(
                                    "assets/animations/success.json"),
                      ),
                    )
                  ],
                ),
              )
            ] else if (activeStep == 1) ...[
              Container(
                padding: EdgeInsets.all(20),
                child: Column(
                  children: [
                    Container(
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
                                AssetHelper.icoGuest,
                              ),
                              SizedBox(
                                width: kDefaultPadding,
                              ),
                              Text(
                                "Eres tu?",
                                style: TextStyles.defaultStyle.bold,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: kMediumPadding,
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.8,
                            decoration: BoxDecoration(
                              color: ColorPalette.secondColor.withOpacity(0.15),
                              borderRadius: BorderRadius.circular(
                                40,
                              ),
                            ),
                            padding: EdgeInsets.all(kMinPadding),
                            child: CustomTextFormField(label: "Tipo Documento", hintText: "Tipo Documento",color: Colors.transparent,colorBorder: Colors.transparent,controller: tipoDocumentoController,readOnly: true,),
                          ),
                          SizedBox(height: 15,),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.8,
                            decoration: BoxDecoration(
                              color: ColorPalette.secondColor.withOpacity(0.15),
                              borderRadius: BorderRadius.circular(
                                40,
                              ),
                            ),
                            padding: EdgeInsets.all(kMinPadding),
                            child: CustomTextFormField(label: "Numero de Documento", hintText: "Numero de Documento",colorBorder: Colors.transparent,color: Colors.transparent,controller: numeroDocumentoController,readOnly: true,),
                          ),
                          SizedBox(height: 15,),
                          tipoDocumentoController.text=="Dni"?
                          Container(
                            width: MediaQuery.of(context).size.width * 0.8,
                            decoration: BoxDecoration(
                              color: ColorPalette.secondColor.withOpacity(0.15),
                              borderRadius: BorderRadius.circular(
                                40,
                              ),
                            ),
                            padding: EdgeInsets.all(kMinPadding),
                            child: CustomTextFormField(label: "Nombres", hintText: "Nombres",colorBorder: Colors.transparent,color: Colors.transparent,controller: nombresController,readOnly: true,),
                          ):Container(),
                        ],
                      ),
                    ),
                    SizedBox(height: 20,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                            width: size.width / 2 - 25,
                            child: ItemButtonWidget(
                              data: "Atrás",
                              onTap: () {
                                setState(() {
                                  activeStep--;
                                  tipoDocumentoController.text="";
                                  numeroDocumentoController.text="";
                                  nombresController.text="";
                                });
                              },
                            )),
                        SizedBox(
                            width: size.width / 2 - 25,
                            child: ItemButtonWidget(
                              data: "Confirmar",
                              onTap: () {

                                controller.authenticateIDUser(tipoDocumentoController.text, numeroDocumentoController.text)
                                .then((value) {
                                  
                                  //Get.toNamed("/home");
                                })
                                .catchError((e){
                                  print(e);
                                });
                              },
                            )),
                      ],
                    )
                  ],
                ),
              )
            ]
          ],
        ),
      ),
    );
  }
}

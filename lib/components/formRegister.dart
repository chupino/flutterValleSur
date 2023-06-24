import 'package:apitest3/components/CustomDropdownFormField.dart';
import 'package:apitest3/components/CustomEmailFormField.dart';
import 'package:apitest3/components/CustomNumberFormField.dart';
import 'package:apitest3/components/CustomPasswordConfirmForm.dart';
import 'package:apitest3/components/custom_textfield.dart';
import 'package:apitest3/components/selectDateFormField.dart';
import 'package:apitest3/controller/FormRegisterController.dart';
import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:apitest3/components/hr.dart';
import 'package:apitest3/controller/registerController.dart';
import 'package:apitest3/main.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:intl/intl.dart';
import 'package:apitest3/test_data/countriesData.dart';

class FormRegister extends StatefulWidget {
  const FormRegister({
    this.onTapRegisterButton,
    required this.size,
    Key? key
  }) : super(key: key);
  final Function()? onTapRegisterButton;
  final Size size;

  @override
  State<FormRegister> createState() => _FormRegisterState();
}

class _FormRegisterState extends State<FormRegister> {
  final _countries = paises;
  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  TextEditingController tipoIdentificacionController =
      TextEditingController(text: "DNI");

  TextEditingController identificacionController = TextEditingController();

  TextEditingController nombreController = TextEditingController();

  TextEditingController apellidoController = TextEditingController();

  TextEditingController sexoController = TextEditingController();

  TextEditingController fechaNacimientoController = TextEditingController();

  TextEditingController nacionalidadController =
      TextEditingController(text: paises.first);

  String? paisSelected;

  TextEditingController regionController = TextEditingController();

  TextEditingController direccionController = TextEditingController();

  TextEditingController telefonoController = TextEditingController();

  final TextEditingController _pass = TextEditingController();

  final TextEditingController _confirmPass = TextEditingController();

  String? selectedSex;

  String? selectedId;

  String estadoBoton = "1";


  final formKey = GlobalKey<FormState>();
  static const subtitleForm = "Parece que no tienes una cuenta, vamos a crear una";
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Get.put(FormRegisterController());
  }
  @override
  Widget build(BuildContext context) {
    FormRegisterController controller=Get.find();
    return ClipRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
        child: Form(
          key: formKey,
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            width: widget.size.width / 1.1,
            decoration: BoxDecoration(
              color: const Color.fromRGBO(0, 0, 0, 1).withOpacity(0.3),
              borderRadius: const BorderRadius.all(Radius.circular(30)),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text(subtitleForm,
                    // ignore: prefer_const_constructors
                    style: TextStyle(color: Colors.white, fontSize: 20),
                    textAlign: TextAlign.start),
                const SizedBox(
                  height: 25,
                ),
                CustomTextFormField(
                  label: "Nombres",
                  hintText: "Nombres",
                  controller: nombreController,
                ),
                const hr(),
                CustomTextFormField(label: "Apellidos", hintText: "Apellidos",controller: apellidoController,),
                const hr(),
                CustomDropdownFormField(
                  elementos: ["Masculino", "Femenino"],
                  onChanged: (value) {
                    selectedSex = value;
                  },
                  hint: "Sexo",
                ),
                const hr(),
                CustomSelectDateFormField(
                  controller: fechaNacimientoController,
                  label: "Fecha de Nacimiento",
                  hint: "Fecha de Nacimiento",
                ),
                const hr(),
                CustomTextFormField(
                  label: "Región",
                  hintText: "Región",
                  controller: regionController,
                ),
                const hr(),
                CustomTextFormField(label: "Dirección", hintText: "Dirección",controller: direccionController,),
                const hr(),
                CustomNumberFormField(
                    label: "Telefono", controller: telefonoController),
                const hr(),
                CustomDropdownFormField(
                  elementos: _countries,
                  onChanged: (value) {
                    nacionalidadController.text != value;
                  },
                  hint: "Nacionalidad",
                ),
                const hr(),
                CustomEmailFormField(controller: emailController),
                const hr(),
                CustomPasswordConfirmForm(
                    controllerPass: _pass, controllerConfirmPass: _confirmPass),
                const SizedBox(
                  height: 20,
                ),
                Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      RichText(
                        text: const TextSpan(
                          text: '',
                          children: <TextSpan>[
                            TextSpan(
                              text:
                                  'Dando a Aceptar y Continuar estas aceptando que ',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            ),
                            TextSpan(
                                text: 'Mauricio te hackee',
                                style: TextStyle(
                                    color: mainBackupColor,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20)),
                          ],
                        ),
                      ),
                    ]),
                const SizedBox(
                  height: 15,
                ),
                GestureDetector(
                  onTap: () {
                    print("aa");
                    if (formKey.currentState!.validate()) {
                      setState(() {
                        
                      estadoBoton = "2";
                      });
                      List<String> partes =
                          fechaNacimientoController.text.split('-');
                      int dia = int.parse(partes[0]);
                      int mes = int.parse(partes[1]);
                      int anio = int.parse(partes[2]);
                      DateTime dateTime = DateTime(anio, mes, dia);

                      String fechaFormateada = dateTime.toIso8601String();
                      Map<String, dynamic> intentRegister = {
                        "username": nombreController.text + "User",
                        "email": emailController.text,
                        "emailVisibility": true,
                        "password": _pass.text,
                        "passwordConfirm": _confirmPass.text,
                        "nombres": nombreController.text,
                        "apellidos": apellidoController.text,
                        "sexo": selectedSex.toString(),
                        "fecha_nacimiento": fechaFormateada,
                        "region": regionController.text,
                        "direccion": direccionController.text,
                        "telefono": telefonoController.text,
                        "nacionalidad": nacionalidadController.text
                      };
                      controller.intentRegister(registerIntent: intentRegister)
                      .then((value) {
                        setState(() {
                          
                        estadoBoton="3";
                        });
                        Future.delayed(Duration(seconds: 1),(){
                          Get.toNamed("/login");
                        });
                      })
                      .catchError((error) {
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
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                ),
                              ],
                            );
                          },
                        );
                      });
                    } else {}
                  },
                  child: Container(
                    alignment: Alignment.center,
                    width: widget.size.width * 0.8,
                    height: widget.size.height * 0.075,
                    child: estadoBoton == "1"
                        ? Text(
                            "Aceptar y Continuar",
                            style: TextStyle(
                              color: const Color.fromARGB(255, 253, 253, 253),
                              fontWeight: FontWeight.bold,
                              fontSize: widget.size.width * 0.06,
                              fontFamily: 'ProductSans',
                            ),
                          )
                        : estadoBoton == "2"
                            ? Lottie.asset(
                                "assets/animations/loginLoading.json")
                            : Lottie.asset("assets/animations/success.json"),
                    decoration: ShapeDecoration(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(widget.size.width * 0.1),
                      ),
                      gradient: const LinearGradient(
                          colors: /* onboardPage
                            ?  */
                              [
                            Color(0xFF8200FF),
                            Color(0xFFFF3264),
                          ]
                          ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

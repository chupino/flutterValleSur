import 'dart:ui';

import 'package:apitest3/components/CustomEmailFormField.dart';
import 'package:apitest3/components/CustomPasswordTextField.dart';
import 'package:apitest3/components/custom_textfield.dart';
import 'package:apitest3/components/CustomDropdownFormField.dart';
import 'package:apitest3/controller/loginController.dart';
import 'package:apitest3/main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
// ignore: depend_on_referenced_packages
import 'package:lottie/lottie.dart';
// ignore: depend_on_referenced_packages
import 'package:validators/validators.dart';

class loginScreen extends StatefulWidget {
  const loginScreen({Key? key}) : super(key: key);

  @override
  State<loginScreen> createState() => _loginScreenState();
}

class _loginScreenState extends State<loginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  String estadoBoton = "1";

  @override
  void dispose() {
    emailController.clear();
    super.dispose();
  }

  bool isEmailCorrect = false;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    final LoginController controller = Get.put(LoginController());
    return Scaffold(
      //backgroundColor: backgrColor,
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          decoration: const BoxDecoration(
              // color: Colors.red.withOpacity(0.1),
              image: DecorationImage(image: AssetImage(

                  // 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcShp2T_UoR8vXNZXfMhtxXPFvmDWmkUbVv3A40TYjcunag0pHFS_NMblOClDVvKLox4Atw&usqp=CAU',
                  'assets/images/login.jpg'), fit: BoxFit.cover, opacity: 0.9)),
          child: SafeArea(
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.arrow_back_ios),
                        color: Colors.white,
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                      Image.asset(
                        'assets/images/vallesur_logo.png',
                        height: 90,
                        width: 120,
                      ),
                      const Text(
                        'Hotel Valle\n Sur',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 30,
                            color: Colors.white),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 100,
                  ),
                  const Text(
                    'Iniciar Sesión',
                    style: TextStyle(
                      fontFamily: 'ProductSans',
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 40,
                    ),
                  ),
                  Text(
                    'Inicia sesión ahora',
                    style: TextStyle(
                        fontFamily: 'ProductSans',
                        color: Colors.white.withOpacity(0.5),
                        fontWeight: FontWeight.w300,
                        // height: 1.5,
                        fontSize: 15),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  ClipRect(
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        // _formKey!.currentState!.validate() ? 200 : 600,
                        // height: isEmailCorrect ? 260 : 182,
                        width: MediaQuery.of(context).size.width / 1.1,
                        decoration: BoxDecoration(
                          color:
                              const Color.fromRGBO(0, 0, 0, 1).withOpacity(0.3),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(30)),
                        ),
                        child: Column(
                          children: [
                            Padding(
                                padding: const EdgeInsets.only(
                                    left: 20, right: 20, bottom: 20),
                                child: CustomEmailFormField(controller: emailController,onChanged: (value) {
                                    final RegExp emailRegex = RegExp(
                                      r'^[\w-]+(\.[\w-]+)*@[a-zA-Z0-9-]+(\.[a-zA-Z0-9-]+)*(\.[a-zA-Z]{2,})$',
                                    );
                                    if (emailRegex.hasMatch(value!)) {
                                      setState(() {
                                        isEmailCorrect = true;
                                      });
                                    } else {
                                      setState(() {
                                        isEmailCorrect = false;
                                      });
                                    }
                                  },)),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 20, right: 20),
                              child: Form(
                                  key: _formKey,
                                  child: CustomPasswordTextField(
                                    controller: passwordController,
                                    hintText: "Contraseña",
                                    obscureText: true,
                                  )
                                  /* TextFormField(
                                  obscuringCharacter: '*',
                                  obscureText: true,
                                  controller: passwordController,
                                  decoration: const InputDecoration(
                                    focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide.none,
                                        borderRadius:
                                            BorderRadius.all(Radius.circular(10))),
                                    enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide.none,
                                        borderRadius:
                                            BorderRadius.all(Radius.circular(10))),
                                    prefixIcon: Icon(
                                      Icons.person,
                                      color: Colors.purple,
                                    ),
                                    filled: true,
                                    fillColor: Colors.white,
                                    labelText: "Contraseña",
                                    hintText: '*********',
                                    labelStyle: TextStyle(color: Colors.purple),
                                  ),
                                  validator: (value) {
                                    if (value!.isEmpty && value!.length < 5) {
                                      return 'Enter a valid password';
                                      {
                                        return null;
                                      }
                                    }
                                  },
                                ), */
                                  ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            isEmailCorrect
                                ? GestureDetector(
                                    onTap: () {
                                      print("aa");
                                      if (_formKey.currentState!.validate()) {
                                        setState(() {
                                          estadoBoton = "2";
                                        });

                                        Map<String, dynamic> intentCredentials =
                                            {
                                          "email": emailController.text,
                                          "password": passwordController.text,
                                        };
                                        controller
                                            .intentLogin(
                                                intentCredentials:
                                                    intentCredentials)
                                            .then((value) {
                                          print("++++++++++++++++++++++$value");
                                          setState(() {
                                            estadoBoton = "3";
                                          });
                                          Future.delayed(
                                              const Duration(seconds: 1), () {
                                            Get.offNamed("/home");
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
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                ),
                                                content: const Text(
                                                  'Verifica tus datos o intenta mas tarde',
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                ),
                                                actions: [
                                                  TextButton(
                                                    child: const Text(
                                                      'Aceptar',
                                                      style: TextStyle(
                                                          color: Colors.white),
                                                    ),
                                                    onPressed: () {
                                                      Navigator.of(context)
                                                          .pop();
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
                                      width: width * 0.8,
                                      height: height * 0.075,
                                      decoration: ShapeDecoration(
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                              width * 0.1),
                                        ),
                                        gradient: const LinearGradient(
                                            colors: /* onboardPage
                            ?  */
                                                [
                                              Color(0xFF8200FF),
                                              Color(0xFFFF3264),
                                            ]),
                                      ),
                                      child: estadoBoton == "1"
                                          ? Text(
                                              "Iniciar Sesión",
                                              style: TextStyle(
                                                color: const Color.fromARGB(
                                                    255, 253, 253, 253),
                                                fontWeight: FontWeight.bold,
                                                fontSize: width * 0.06,
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
                                : Container(),
                            const SizedBox(
                              height: 20,
                            ),
                            const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 20.0),
                              child: Row(
                                children: [
                                  Expanded(
                                      child: Divider(color: mainBackupColor)),
                                  Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 8),
                                    child: Text(
                                      'O',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                  Expanded(
                                      child: Divider(color: mainBackupColor)),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            GestureDetector(
                              onTap: () {
                                controller
                                    .intentLoginwithFacebook()
                                    .then((value) {
                                  print("Logeo ezitoso");
                                }).catchError((e) {
                                  print(e);
                                });
                              },
                              child: Container(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 30),
                                alignment: Alignment.center,
                                width: width * 0.8,
                                height: height * 0.075,
                                decoration: ShapeDecoration(
                                  shape: RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.circular(width * 0.1),
                                  ),
                                  gradient: const LinearGradient(
                                      colors: /* onboardPage
                              ?  */
                                          [
                                        Color.fromARGB(255, 14, 26, 156),
                                        Color.fromARGB(255, 78, 104, 234),
                                      ]
                                      /*                          : [
                                  const Color(0xFFFFFFFF),
                                  const Color(0xFFFFFFFF),
                                ], */
                                      ),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Image.asset(
                                      'assets/images/facebook.png', // Reemplaza con la ruta de tu icono de Facebook
                                      height: 24,
                                      width: 24,
                                    ),
                                    Text(
                                      'Iniciar Sesion con Facebook',
                                      style: TextStyle(
                                        color: const Color.fromARGB(
                                            255, 253, 253, 253),
                                        fontWeight: FontWeight.bold,
                                        fontSize: width * 0.042,
                                        fontFamily: 'ProductSans',
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(
                                height: 10), // Espacio entre los botones
                            GestureDetector(
                              onTap: () {
                                controller
                                    .intentLoginwithGoogle()
                                    .then((value) {
                                  print("logeo exitoso");
                                }).catchError((e) {
                                  print(e);
                                });
                              },
                              child: Container(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 30),
                                alignment: Alignment.center,
                                width: width * 0.8,
                                height: height * 0.075,
                                decoration: ShapeDecoration(
                                  shape: RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.circular(width * 0.1),
                                  ),
                                  gradient: const LinearGradient(
                                      colors: /* onboardPage
                              ?  */
                                          [
                                        Color.fromARGB(255, 186, 16, 16),
                                        Color.fromARGB(255, 247, 108, 101),
                                      ]
                                      /*                          : [
                                  const Color(0xFFFFFFFF),
                                  const Color(0xFFFFFFFF),
                                ], */
                                      ),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Image.asset(
                                      'assets/images/google.png', // Reemplaza con la ruta de tu icono de Facebook
                                      height: 24,
                                      width: 24,
                                    ),
                                    Text(
                                      'Iniciar Sesion con Google',
                                      style: TextStyle(
                                        color: const Color.fromARGB(
                                            255, 253, 253, 253),
                                        fontWeight: FontWeight.bold,
                                        fontSize: width * 0.042,
                                        fontFamily: 'ProductSans',
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'No tienes cuenta?',
                                  style: TextStyle(
                                    color: Colors.white.withOpacity(0.8),
                                  ),
                                ),
                                TextButton(
                                  onPressed: () {
                                    Get.toNamed("/register");
                                  },
                                  child: const Text(
                                    'Create una',
                                    style: TextStyle(
                                        color: Colors.purple,
                                        fontWeight: FontWeight.w500,
                                        decoration: TextDecoration.underline),
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

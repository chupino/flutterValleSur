import 'package:apitest3/components/hr.dart';
import 'package:apitest3/core/constants/color_palatte.dart';
import 'package:apitest3/main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:page_transition/page_transition.dart';

import 'package:apitest3/components/fading_sliding_widget.dart';

class welcomeScreen extends StatefulWidget {
  const welcomeScreen({Key? key}) : super(key: key);

  @override
  State<welcomeScreen> createState() => _welcomeScreenState();
}

class _welcomeScreenState extends State<welcomeScreen> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: ColorPalette.backgroundScaffoldSecundaryColor,
      body: SafeArea(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Image.asset(
                    'assets/images/vallesur_logo.png',
                    height: 90,
                    width: 120,
                  ),
                  Text(
                    'Hotel Valle\n Sur',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                        color: Colors.white),
                  )
                ],
              ),
              Lottie.asset('assets/animations/robotWelcome.json',
                  height: 300, width: 600),
              Text(
                'Bienvenido!',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                    color: Colors.white),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Text(
                  'Ingresa a tu cuenta para tener acceso a todas las caracteristicas',
                  style: TextStyle(
                      color: Colors.white.withOpacity(0.5),
                      fontWeight: FontWeight.w300,
                      // height: 1.5,
                      fontSize: 15),
                ),
              ),
              SizedBox(
                height: 80,
              ),
              GestureDetector(
                onTap: () {
                  Get.toNamed("/login");
                },
                child: Container(
                  alignment: Alignment.center,
                  width: width * 0.8,
                  height: height * 0.075,
                  child: Text(
                    'Suena Bien!',
                    style: TextStyle(
                      color: Color.fromARGB(255, 253, 253, 253),
                      fontWeight: FontWeight.bold,
                      fontSize: width * 0.06,
                      fontFamily: 'ProductSans',
                    ),
                  ),
                  decoration: ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(width * 0.1),
                    ),
                    gradient: LinearGradient(
                        colors: /* onboardPage
                          ?  */
                            [
                          const Color(0xFF8200FF),
                          const Color(0xFFFF3264),
                        ]
                        /*                          : [
                              const Color(0xFFFFFFFF),
                              const Color(0xFFFFFFFF),
                            ], */
                        ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'No tienes una cuenta?',
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.6),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Get.toNamed("/register");
                      /* Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  signUpScreen())); */
                    },
                    child: Text(
                      'Crea una',
                      style: TextStyle(
                          color: Colors.purple, fontWeight: FontWeight.w500),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

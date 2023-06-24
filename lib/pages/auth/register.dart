import 'dart:math';
import 'dart:ui';
import 'package:apitest3/components/formRegister.dart';
import 'package:apitest3/components/hr.dart';
import 'package:apitest3/controller/registerController.dart';
import 'package:apitest3/main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:intl/intl.dart';

// ignore: camel_case_types, must_be_immutable
class registerScreen extends GetView<registerController>{


  registerScreen({super.key});
  @override
  Widget build(BuildContext context) {
    
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
  body: Container(
    decoration: BoxDecoration(
      image: DecorationImage(
        image: AssetImage('assets/images/login.jpg'),
        opacity: 0.9,
        fit: BoxFit.cover,
        
      ),
    ),
    child: SafeArea(
      child: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                IconButton(
                  icon: Icon(Icons.arrow_back_ios),
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
                Text(
                  'Hotel Valle\n Sur',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                    color: Colors.white,
                  ),
                )
              ],
            ),
            SizedBox(height: 100),
            Text(
              'Registrarse',
              style: TextStyle(
                fontFamily: 'ProductSans',
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 40,
              ),
            ),
            Text(
              'Crearse una cuenta es completamente gratis',
              style: TextStyle(
                fontFamily: 'ProductSans',
                color: Colors.white.withOpacity(0.5),
                fontWeight: FontWeight.w300,
                fontSize: 15,
              ),
            ),
            SizedBox(height: 30),
            FormRegister(size: size)
          ],
        ),
      ),
    ),
  ),
);

                  /*  */
                
  }
  }
  
/* class registerScreen extends StatefulWidget {
  const registerScreen({Key? key}) : super(key: key);

  @override
  State<registerScreen> createState() => _registerScreenState();
}

class _registerScreenState extends State<registerScreen> {
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
      TextEditingController(text: "Peru");
  String? paisSelected;
  TextEditingController regionController = TextEditingController();
  TextEditingController direccionController = TextEditingController();
  TextEditingController telefonoController = TextEditingController();
  String? selectedSex;
  String? selectedId;

  @override
  void dispose() {
    emailController.clear();
    super.dispose();
  }

  bool isEmailCorrect = false;
  String estadoBoton = "1";
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _pass = TextEditingController();
  final TextEditingController _confirmPass = TextEditingController();
  final List<String> _countries = [
    'Peru',
    'United States',
    'Canada',
    'Mexico',
    'United Kingdom',
    'Germany',
    'France',
    'Spain',
    'Italy',
    'Japan',
    'China',
  ];
  @override
  Widget build(BuildContext context) {}
} */

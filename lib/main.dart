import 'package:apitest3/.env';
import 'package:apitest3/components/habitacionesList.dart';
import 'package:apitest3/controller/habitacionesController.dart';
import 'package:apitest3/controller/routeController.dart';
import 'package:apitest3/core/constants/color_palatte.dart';
import 'package:apitest3/pages/auth/authId.dart';
import 'package:apitest3/pages/formPax&Date/selectPaxAndDatePage.dart';
import 'package:apitest3/pages/reservaDetails/reservaDetails.dart';
import 'package:apitest3/pages/reservaDetails/reservaQR.dart';
import 'package:apitest3/pages/reservaForm/checkOutStep1.dart';
import 'package:apitest3/pages/reservaForm/formReservaStep1.dart';
import 'package:apitest3/pages/reservaForm/formReservaStep2.dart';
import 'package:apitest3/pages/reservaForm/formReservaStep3.dart';
import 'package:apitest3/pages/reservaForm/formReservaStep4.dart';
import 'package:apitest3/pages/reservaForm/formReservaStep5.dart';
import 'package:apitest3/pages/habitaciones/habitacionesPage.dart';
import 'package:apitest3/pages/hotelDetails/hotelDetails.dart';
import 'package:apitest3/pages/auth/login.dart';
import 'package:apitest3/pages/navBar/navbar.dart';
import 'package:apitest3/pages/start/welcome.dart';
import 'package:apitest3/pages/auth/register.dart';
import 'package:apitest3/pages/reservaForm/resumen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:apitest3/pages/home/index.dart';
import 'package:get/get.dart';
import 'package:apitest3/pages/start/onboard.dart';

import 'core/helpers/size_config.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

const mainBackupColor = Color.fromARGB(255, 153, 0, 74);
const secondaryBackupColor = Color.fromARGB(255, 228, 95, 177);
const backgrColor = Color.fromARGB(255, 45, 39, 47);
void main() async{
  initializeDateFormatting('es');
  WidgetsFlutterBinding.ensureInitialized();
  Get.put(HabitacionController());
  Stripe.publishableKey=stripePublishableKey;
  await Stripe.instance.applySettings();

  String initialRoute=await RouteController.getInitialRoute();

  runApp(GetMaterialApp(
    
    theme: ThemeData(
        primaryColor: const Color.fromARGB(255, 39, 37, 33),
        canvasColor: const Color.fromARGB(255, 53, 50, 42),// Cambiar el colo de acento
    backgroundColor: Colors.white,
    
        colorScheme: const ColorScheme.light(
          primary: Color.fromARGB(255, 20, 10, 17), // Color del botón "Aceptar"
          onPrimary: Colors.white, // Color del texto del botón "Aceptar"
          surface: Colors.pink, // Color de fondo del encabezado
          onSurface: Colors.white, // Color del texto del encabezado
        ),
        textButtonTheme: TextButtonThemeData(
            style: TextButton.styleFrom(
              primary: Colors.red, // button text color
            ),
          ),
        textSelectionTheme: TextSelectionThemeData(
          selectionHandleColor: ColorPalette.primaryColor,
          selectionColor: ColorPalette.secondColor
        ),
        
        dialogBackgroundColor: mainBackupColor, 
      ),
    debugShowCheckedModeBanner: false,
    initialRoute: initialRoute,
    getPages: [
      GetPage(
        name: "/",
        page: ()=>Onboard(),
        transition: Transition.zoom
      ),
      GetPage(
        name: "/reservaDetails",
        page: ()=>ReservaDetails(),
        transition: Transition.zoom
      ),
      GetPage(
        name: "/reservaQr",
        page: ()=>ReservaQR(),
        transition: Transition.zoom
      ),
      GetPage(
        name: "/selectPax&Date",
        page: ()=>SelectPaxAndDatePage(),
        transition: Transition.zoom
      ),
      GetPage(
        name: "/welcome",
        page: ()=>const welcomeScreen(),
        transition: Transition.leftToRightWithFade
      ),
      GetPage(
        name: "/login",
        page: ()=>const loginScreen(),
        transition: Transition.leftToRightWithFade
      ),
      GetPage(
        name: "/register", 
        page: ()=>registerScreen(),
        transition: Transition.leftToRightWithFade
      ),
      GetPage(
        name: "/habitaciones", 
        page: ()=>HabitacionesPage(),
        transition: Transition.leftToRightWithFade
      ),
      GetPage(
        name: "/checkout", 
        page: ()=>CheckOutScreen(),
        transition: Transition.leftToRightWithFade
      ),
      GetPage(
        name: "/detailsHotel", 
        page: ()=>const DetailHotelScreen(),
        transition: Transition.leftToRightWithFade
      ),
      GetPage(
        name: "/authID", 
        page: ()=>const AuthID(),
        transition: Transition.leftToRightWithFade
      ),
      GetPage(
        name: "/selectRoom", 
        page: ()=> HabitacionesPage(),
        transition: Transition.leftToRightWithFade
      ),
      GetPage(
        name: "/home",
        page: ()=>NavBar(),
        transition: Transition.leftToRightWithFade
      ),
      GetPage(
        name: "/reservaPaso1", 
        page: ()=>reservaFormStep1(),
        transition: Transition.leftToRightWithFade
      ),
       GetPage(
        name: "/reservaPaso2", 
        page: ()=>reservaFormStep2(),
        transition: Transition.leftToRightWithFade
      ),
      GetPage(
        name: "/reservaPaso3", 
        page: ()=>reservaFormStep3(),
        transition: Transition.leftToRightWithFade
      ),
      GetPage(
        name: "/reservaPaso4", 
        page: ()=>reservaFormStep4(),
        transition: Transition.leftToRightWithFade
      ),
      GetPage(
        name: "/reservaPaso5", 
        page: ()=>reservaFormStep5(),
        transition: Transition.leftToRightWithFade
      ),
      GetPage(
        name: "/resumenReserva", 
        page: ()=>ResumenReserva(),
        transition: Transition.leftToRightWithFade
        ),

    ],
  ));
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light().copyWith(
        canvasColor: Colors.amber,
        datePickerTheme: const DatePickerThemeData(backgroundColor: Colors.amber,),
        primaryColor: Colors.amber,
        colorScheme: const ColorScheme.light(
          primary: Color.fromARGB(255, 20, 10, 17), // Color del botón "Aceptar"
          onPrimary: Colors.white, // Color del texto del botón "Aceptar"
          surface: Colors.pink, // Color de fondo del encabezado
          onSurface: Colors.white, // Color del texto del encabezado
        ),
        dialogBackgroundColor: mainBackupColor, 
      ),
      home: HomeApp(),
    );
  }
}

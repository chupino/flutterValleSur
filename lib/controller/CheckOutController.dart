import 'package:apitest3/core/constants/backend.dart';
import 'package:apitest3/core/constants/color_palatte.dart';
import 'package:apitest3/models/user.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:pocketbase/pocketbase.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:intl/intl.dart';

class CheckOutController extends GetxController {
  final pb = PocketBase('https://pocket.bjrcode.com');
  Map<String, dynamic>? paymentIntentData;
  Function()? postCompra;
  Future<String> getUIDHuesped()async{
          final prefs = await SharedPreferences.getInstance();
      final UID = prefs.getString("UID")!;
      final token = prefs.getString("token")!;
      final headers = {
        'Authorization': 'Bearer $token',
      };
    final record = await pb.collection('usersValleSur').getOne('$UID',
  expand: 'relField1,relField2.subRelField',headers: headers);
  final UIDHuesped= record.getStringValue("id_huesped");
  prefs.setString("UIDHuesped", UIDHuesped);
  return UIDHuesped; 
  } 
  Future<void> hacerReserva(
      {
      required String dias,
      required String pax,
      required String idHabitacion,
      required String razonHospedaje,
      required String destinatario,
      required String peticionesAdicionales,
      required String horaLlegada,
      required String fecha_checkin,
      required String fecha_checkout
      }) async {
        final url="${Backend.backendURL}/api/reserva";
        final prefs=await SharedPreferences.getInstance();
        const tipoReserva="Aplicativo";
        String? UIDHuesped=await prefs.getString("UIDHuesped");
        UIDHuesped ??= await getUIDHuesped();
        final intentReserva=<String,dynamic>{
          "id_huesped": UIDHuesped,
          "fecha_reserva": DateFormat('dd-MM-yyyy HH:mm')
                              .format(DateTime.now()),
          "cantidad_dias_reserva": dias,
          "pax_reserva": pax,
          "id_habitacion_reserva": idHabitacion,
          "tipo_reserva": tipoReserva,
          "razon_hospedaje": razonHospedaje,
          "destinatario_reserva": destinatario,
          "hora_llegada": horaLlegada,
          "peticiones_adicionales": peticionesAdicionales,
          "fecha_checkin": fecha_checkin.toString(),
          "fecha_checkout": fecha_checkout.toString(),
        };
        final response=await http.post(Uri.parse(url),body: intentReserva);
        print(jsonDecode(response.body));
        //print("dsdasdasd++++++++++++++++++++++++++++++++$intentReserva");
      }
  Future<UserModel> getUserModel() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final UID = prefs.getString("UID")!;
      final token = prefs.getString("token")!;
      final headers = {
        'Authorization': 'Bearer $token',
      };
      final record = await pb.collection('usersValleSur').getOne(UID,
          expand: 'relField1,relField2.subRelField', headers: headers);
      UserModel usuario = UserModel(
          record.getStringValue("nombres"),
          record.getStringValue("apellidos"),
          record.getStringValue("sexo"),
          record.getStringValue("email"),
          record.getStringValue("username"),
          record.getStringValue("fecha_nacimiento"),
          record.getStringValue("region"),
          record.getStringValue("direccion"),
          record.getStringValue("telefono"),
          record.getStringValue("nacionalidad"),
          record.getStringValue("numero_documento"),
          record.getStringValue("tipo_documento"));
      return usuario;
    } catch (e) {
      throw e;
    }
  }

  Future<void> makePayment(
      {required String amount, required String currency}) async {
    try {
      paymentIntentData = await createPaymentIntent(amount, currency);
      if (paymentIntentData != null) {
        await Stripe.instance.initPaymentSheet(
            paymentSheetParameters: SetupPaymentSheetParameters(
          merchantDisplayName: 'Prospects',
          customerId: paymentIntentData!['customer'],
          paymentIntentClientSecret: paymentIntentData!['client_secret'],
          customerEphemeralKeySecret: paymentIntentData!['ephemeralKey'],
        ));
        displayPaymentSheet();
      }
    } catch (e, s) {
      print('exception:$e$s');
    }
  }

  displayPaymentSheet() async {
    try {
      await Stripe.instance.presentPaymentSheet();
      Get.snackbar('Pago', 'Pago realizado con exito',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: ColorPalette.secondColor,
          colorText: Colors.white,
          margin: const EdgeInsets.all(10),
          duration: const Duration(seconds: 2));
      
      Future.delayed(Duration(seconds: 2),(){
        postCompra!.call();
      });
      //Get.toNamed("/resumenReserva",arguments: [{"resumen":resumen,"imagen":imagen}]);
    } on Exception catch (e) {
      if (e is StripeException) {
        print("Error from Stripe: ${e.error.localizedMessage}");
        Get.snackbar('Pago', 'Algo ocurrio mal',
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: ColorPalette.dangerColor,
            colorText: Colors.white,
            margin: const EdgeInsets.all(10),
            duration: const Duration(seconds: 2));
      } else {
        print("Unforeseen error: ${e}");
        Get.snackbar('Error', 'Error Inesperado',
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: ColorPalette.dangerColor,
            colorText: Colors.white,
            margin: const EdgeInsets.all(10),
            duration: const Duration(seconds: 2));
      }
    } catch (e) {
      print("exception:$e");
    }
  }

  createPaymentIntent(String amount, String currency) async {
    try {
      Map<String, dynamic> body = {
        'amount': calculateAmount(amount),
        'currency': currency,
        'payment_method_types[]': 'card'
      };
      var response = await http.post(
          Uri.parse('https://api.stripe.com/v1/payment_intents'),
          body: body,
          headers: {
            'Authorization':
                'Bearer sk_test_51NK8FOH7wjrLNuaBZZGqgnCAGBkvHtXwoBW7jGmX5DPYzdZNPRk6RyR2b3YKuQ4LZG1hUmWIHy0OUNy92N12jCOW00SBuYoJFj',
            'Content-Type': 'application/x-www-form-urlencoded'
          });
      //print("++++++++++++++++++++++${response.body}");
      
      return jsonDecode(response.body);
    } catch (err) {
      print('err charging user: ${err.toString()}');
    }
  }

  String calculateAmount(String amount) {
    final a = (double.parse(amount) * 100).toInt();
    return a.toString();
  }
}

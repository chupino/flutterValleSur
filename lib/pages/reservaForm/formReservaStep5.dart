// ignore_for_file: prefer_interpolation_to_compose_strings, avoid_print, library_private_types_in_public_api

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_stripe/flutter_stripe.dart';

import 'package:apitest3/controller/payment_controller.dart';

class reservaFormStep5 extends StatefulWidget {
  Map resumen;
  String imagen;
  Map reserva;
  reservaFormStep5({Map? resumen,String? imagen,Map? reserva,Key? key}) : 
  resumen=resumen??Get.arguments[0]["resumen"],
  imagen=imagen??Get.arguments[0]["imagen"],
  reserva=reserva??Get.arguments[0]["reserva"],
  super(key: key);

  @override
  _reservaFormStep5State createState() => _reservaFormStep5State();
}

class _reservaFormStep5State extends State<reservaFormStep5> {

  @override
  Widget build(BuildContext context) {
    final resumen=widget.resumen;
    final imagen=widget.imagen;
    final reserva=widget.reserva;
    final amount=reserva["precio"].toString();
    //final PaymentController controller = Get.put(PaymentController(resumen: resumen,imagen: imagen));
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pagar'),
      ),
      body: Center(
        child: ElevatedButton(child: Text("Pagar"),onPressed: (){
          //controller.makePayment(amount: amount, currency: "PEN");
          //print(reserva);
        },)
      ),
    );
  }

 
}
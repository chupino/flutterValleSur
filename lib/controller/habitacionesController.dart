import 'dart:convert';
import 'package:apitest3/core/constants/backend.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';

import '../components/habitacionesList.dart';
import '../components/item_room_widget.dart';
import '../models/room_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:pocketbase/pocketbase.dart';

class HabitacionController extends GetxController {
  List? arguments;
  final pb = PocketBase('https://pocket.bjrcode.com');
  Future<List> getHabitaciones() async {
    String url = "${Backend.backendURL}/api/habitaciones";
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        //print(data["data"]);
        return data["data"];
      } else {
        throw "error en peticion http";
      }
    } catch (e) {
      throw e;
    }
  }

  List<RoomModel> showHabitaciones({required List habitaciones}) {
    final List<RoomModel> listRoom = [];
    habitaciones.forEach((element) {
      RoomModel habitacion = RoomModel(
          id: element["_id"].toString(),
          roomImage: element["imagen"],
          roomName: element["tipo_habitacion"],
          estado: element["estado"],
          features: element["caracteristicas"],
          floorNum: element["nro_piso"].toString(),
          roomNum: element["nro_habitacion"].toString(),
          utility: "No se puede fumar",
          size: 24,
          price: element["precio"]);
      listRoom.add(habitacion);
    });
    return listRoom;
  }

  Future<bool> isVerify() async {
    try{

    final prefs = await SharedPreferences.getInstance();
    final UID = prefs.getString("UID")!;
    final token = prefs.getString("token")!;
        final headers = {
      'Authorization': 'Bearer $token',
    };
    final record = await pb.collection('usersValleSur').getOne(
          UID,
          expand: 'relField1,relField2.subRelField',
          headers:headers 
        );
    final nro_documento=record.getStringValue("numero_documento");
    final uid_huesped=record.getStringValue("id_huesped");

    if(nro_documento!=null&&nro_documento!="" && uid_huesped!=null && uid_huesped!=""){
      prefs.setString("UIDHuesped", uid_huesped);
      return true;
    }else{
      return false;
    }
    }catch(e){
      throw e;
    }
  }
}

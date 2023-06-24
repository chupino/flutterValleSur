import 'dart:convert';

import 'package:apitest3/core/constants/backend.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:pocketbase/pocketbase.dart';

class MySpecificError implements Exception {
  final String message;

  MySpecificError(this.message);

  @override
  String toString() => message;
}

class BookingController extends GetxController {

  final pb = PocketBase('https://pocket.bjrcode.com');

  Future<bool> isAuthenticated() async {
    final prefs = await SharedPreferences.getInstance();
    String UID = prefs.getString("UID")!;
    String token = prefs.getString("token")!;
        final headers = {
      'Authorization': 'Bearer $token',
    };

    try {
      final record = await pb.collection('usersValleSur').getOne(
            UID,
            expand: 'relField1,relField2.subRelField',
            headers: headers
          );
      if(record.getStringValue("id_huesped")==null ||record.getStringValue("id_huesped")==""){
        return false;
      }else{
        prefs.setString("UIDHuesped", record.getStringValue("id_huesped"));
        return true;
      }
    } catch (e) {
      print(e);
      return false;
    }
  }
  
  Future<List<dynamic>> getReservas() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final UIDHuesped = await prefs.getString("UIDHuesped");
      String url = "${Backend.backendURL}/api/reserva/${UIDHuesped ?? '1'}";
      print(url);
      final response = await http.get(Uri.parse(url));
      final bodyDecode = jsonDecode(response.body);
      print(bodyDecode);
      if (response.statusCode == 200) {
        return bodyDecode["data"];
      } else {
        throw "Error esperado, no hay reservas";
      }
    } catch (e) {
      throw MySpecificError("Error esperado, no hay reservas");
    }
  }
}

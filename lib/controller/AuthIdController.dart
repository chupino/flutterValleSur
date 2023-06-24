import 'dart:convert';

import 'package:apitest3/core/constants/backend.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:pocketbase/pocketbase.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:intl/intl.dart';

class AuthIdController extends GetxController {
  final pb = PocketBase('https://pocket.bjrcode.com');
  String token =
      "ce9c64f737107914696992ffa76c9fbd1b997ca5bab5a8d7f46957e3f3c3e1a4";
  Future<Map<String, dynamic>> getDataFromReniec({required String dni}) async {
    try {
      final response = await http
          .get(Uri.parse("https://apiperu.dev/api/dni/$dni?api_token=$token"));
      final data = jsonDecode(response.body);
      print(data.runtimeType);
      if (response.statusCode == 200) {
        print(response.body);
        return data;
      } else {
        throw "Error inesperado";
      }
    } catch (e) {
      throw e;
    }
  }

  Future<Map<String, dynamic>> registerHuesped(
      Map<String, dynamic> form) async {
    try {
      String url = "${Backend.backendURL}/api/huesped";
      final response = await http.post(Uri.parse(url), body: form);
        final jsonDecode2 = jsonDecode(response.body);
      if (response.statusCode == 200) {
        return jsonDecode2;
      } else {
        throw "Error Controlado a medias (Probablemente el backend este apagado): $jsonDecode2";
      }
    } catch (e) {
      throw e;
    }
  }

  Future<Map<String, dynamic>> existHuesped(String tipo, String id) async {
    try {
      if (tipo == "Dni") {
        tipo = "dni";
      } else {
        tipo = "extranjero";
      }
      String url =
          "${Backend.backendURL}/api/huesped?tipo=$tipo&id=$id";

      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw "Error 400";
      }
    } catch (e) {
      throw e;
    }
  }

  Future<Map<String, dynamic>> traerDataUser(String UID, String token) async {
    final headers = {
      'Authorization': 'Bearer $token',
    };
    final record = await pb.collection('usersValleSur').getOne(UID,
        expand: 'relField1,relField2.subRelField', headers: headers);
    return record.data;
  }

  Future<void> authenticateIDUser(
      String tipoDocumento, String numeroDocumento) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final UID = prefs.getString("UID")!;
      final token = prefs.getString("token")!;
      final headers = {
        'Authorization': 'Bearer $token',
      };
      existHuesped(tipoDocumento, numeroDocumento).then(
        (value) async {
          //Cuando el documento introducido ya esta en el registro del backend en laravel
          final body = <String, dynamic>{
            "tipo_documento": tipoDocumento,
            "numero_documento": numeroDocumento,
            "id_huesped": value["data"]["_id"]
          };

          final record = await pb
              .collection('usersValleSur')
              .update(UID, body: body, headers: headers);
          print(value["data"]);
          prefs.setString("UIDHuesped", value["data"]["_id"]);
        },
      ).catchError((e) {
        print("Error controlado $e");
        traerDataUser(UID, token).then((value) {
          print("DATA USER PB $value");
          final String fechaNacimientoFormated = DateFormat('y-MM-dd')
              .format(DateTime.parse(value["fecha_nacimiento"]));
          final intentRegister = <String, dynamic>{
            "nombre_huesped": value["nombres"],
            "apellido_huesped": value["apellidos"],
            "tipo_identificacion_huesped": tipoDocumento,
            "identificacion_huesped": numeroDocumento,
            "sexo_huesped": value["sexo"],
            "fecha_nacimiento_huesped": fechaNacimientoFormated,
            "nacionalidad_huesped": value["nacionalidad"],
            "region_huesped": value["region"],
            "direccion_huesped": value["direccion"],
            "telefono_huesped": value["telefono"].toString(),
            "correo_huesped": value["email"],
          };
          registerHuesped(intentRegister).then((value) async {
            final body = <String, dynamic>{
              "tipo_documento": tipoDocumento,
              "numero_documento": numeroDocumento,
              "id_huesped": value["data"]["_id"]
            };

            final record = await pb
                .collection('usersValleSur')
                .update(UID, body: body, headers: headers);
            print(value["data"]);
            prefs.setString("UIDHuesped", value["data"]["_id"]);
          });
          Get.toNamed("/home");
        });
      });
      //print(record);
    } catch (e) {
      throw e;
    }
  }
}

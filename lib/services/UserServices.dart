import 'dart:convert';

import 'package:http/http.dart' as http;

class UserServices {
  Future<Map> sendHuesped(Map huesped) async {
    String url = "https://0a41-132-157-128-184.ngrok-free.app/api/huesped";
    try {
      final response = await http.post(Uri.parse(url), body: huesped);
      final data = jsonDecode(response.body);
      if (response.statusCode == 200) {
        return data;
      } else {
        return data;
      }
    } catch (e) {
      throw e;
    }
  }

  Future<Map> getHuesped(String tipo, String id) async {
    if (tipo == "DNI") {
      tipo = "dni";
    } else {
      tipo = "extranjero";
    }
    String url =
        "https://0a41-132-157-128-184.ngrok-free.app/api/huesped?tipo=$tipo&id=$id";
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        //print(data["data"]);
        return data;
      } else {
        final data = jsonDecode(response.body);
        //print(data);
        return data;
      }
    } catch (e) {
      throw e;
    }
  }

  Future<List> getHabitaciones() async {
    String url = "https://0a41-132-157-128-184.ngrok-free.app/api/habitaciones";
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

  Future<Map> sendReserva(Map reserva) async {
    String url = "https://0a41-132-157-128-184.ngrok-free.app/api/reserva";
    try {
      final request = http.MultipartRequest(
        'POST',
        Uri.parse(url),
      );
      //print(reserva["fecha_nacimiento_huesped"].toString());
      request.fields["id_huesped"] = reserva["id_huesped"];
      request.fields["tipo_reserva"] = reserva["tipo_reserva"];
      request.fields["razon_hospedaje"] = reserva["razon_hospedaje"];
      request.fields["destinatario_reserva"] = reserva["destinatario_reserva"];
      request.fields["peticiones_adicionales"] =
          reserva["peticiones_adicionales"];
      request.fields["hora_llegada"] = reserva["hora_llegada"];
      request.fields["nombre_huesped"] = reserva["nombre_huesped"].toString();
      request.fields["apellido_huesped"] =
          reserva["apellido_huesped"].toString();
      request.fields["tipo_identificacion_huesped"] =
          reserva["tipo_identificacion_huesped"].toString();
      request.fields["identificacion_huesped"] =
          reserva["identificacion_huesped"].toString();
      request.fields["sexo_huesped"] = reserva["sexo_huesped"].toString();
      request.fields["fecha_nacimiento_huesped"] = "09-04-2005";
      request.fields["nacionalidad_huesped"] =
          reserva["nacionalidad_huesped"].toString();
      request.fields["region_huesped"] = reserva["region_huesped"].toString();
      request.fields["direccion_huesped"] =
          reserva["direccion_huesped"].toString();
      request.fields["telefono_huesped"] =
          reserva["telefono_huesped"].toString();
      request.fields["correo_huesped"] = reserva["correo_huesped"].toString();
      request.fields["fecha_reserva"] = reserva["fecha_reserva"].toString();
      request.fields["cantidad_dias_reserva"] =
          reserva["cantidad_dias_reserva"].toString();
      request.fields["pax_reserva"] = reserva["pax_reserva"].toString();
      request.fields["nro_habitacion_reserva"] =
          reserva["nro_habitacion_reserva"].toString();
      request.fields["tipo_habitacion_reserva"] =
          reserva["tipo_habitacion_reserva"].toString();
      final response = await request.send();
      final stringResponse = await response.stream.bytesToString();
      Map jsonResponse = jsonDecode(stringResponse);
      if (response.statusCode == 200) {
        return jsonResponse;
      } else {
        print(jsonResponse);
        return {"message": "error"};
      } //75844456
    } catch (e) {
      throw e;
    }
  }
}

import 'package:apitest3/pages/home/index.dart';
import 'package:apitest3/services/UserServices.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResumenReserva extends StatefulWidget {
  Map resumen;
  String imagen;
  ResumenReserva({Map? resumen,String? imagen,Key? key}):
    resumen=resumen??Get.arguments[0]["resumen"],
    imagen=imagen??Get.arguments[0]["imagen"],
    super(key:key);

  @override
  State<ResumenReserva> createState() => _ResumenReservaState();
}

class _ResumenReservaState extends State<ResumenReserva> {
  @override
  Widget build(BuildContext context) {
    final resumenMap = widget.resumen;
    final imagenHabitacion = widget.imagen;
    return Scaffold(
      appBar: AppBar(
        title: Text("Resumen"),
        actions: [
          IconButton(
              onPressed: () {
                //print(resumenMap);
                /* UserServices().sendReserva(resumenMap); */
                showDialog(
                  barrierDismissible: false,
                  context: context,
                  builder: (BuildContext context) {
                    return FutureBuilder(
                        future: UserServices().sendReserva(resumenMap),
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            return AlertDialog(
                              title: Text("Reserva Realizada"),
                              content: SingleChildScrollView(
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(snapshot.data!["message"]),
                                  ],
                                ),
                              ),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                    Navigator.pushAndRemoveUntil(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => HomeApp()),
                                      (Route<dynamic> route) => false,
                                    );
                                  },
                                  child: Text("Hecho"),
                                )
                              ],
                            );
                          } else if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return AlertDialog(
                              title: Text("Procesando"),
                              content: SingleChildScrollView(
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Center(
                                      child: CircularProgressIndicator(),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          } else if (snapshot.hasError) {
                            return AlertDialog(
                              title: Text("Error"),
                              content: SingleChildScrollView(
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Center(
                                      child: Text(
                                          "Error Inesperado: ${snapshot.error}"),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          } else {
                            return Container();
                          }
                        });
                  },
                );
              },
              icon: Icon(Icons.send))
        ],
      ),
      body: resumen(resumenMap, imagenHabitacion),
    );
  }

  SingleChildScrollView resumen(Map resumen, String imagenHabitacion) {
    return SingleChildScrollView(
      child: Container(
          child: Card(
        color: Colors.grey[500],
        elevation: 4,
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Card(
                color: Colors.grey[300],
                child: Padding(
                  padding: EdgeInsets.all(16),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Detalles Habitacion",
                      ),
                      SizedBox(
                        width: 500,
                        height: 20,
                      ),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          'Número de habitación: ${resumen['nro_habitacion_reserva']}',
                          textAlign: TextAlign.left,
                        ),
                      ),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                            'Tipo de habitación: ${resumen['tipo_habitacion_reserva']}'),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Image.network(
                        imagenHabitacion,
                        width: 80,
                        height: 80,
                        fit: BoxFit.cover,
                      ),
                    ],
                  ),
                ),
              ),
              Card(
                  color: Colors.grey[300],
                  child: Padding(
                    padding: EdgeInsets.all(16),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Detalles Huesped",
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                              'Nombre: ${resumen['nombre_huesped']} ${resumen['apellido_huesped']}'),
                        ),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                              'Tipo de identificación: ${resumen['tipo_identificacion_huesped']}'),
                        ),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                              'Identificación: ${resumen['identificacion_huesped']}'),
                        ),
                        Align(
                            alignment: Alignment.topLeft,
                            child: Text('Sexo: ${resumen['sexo_huesped']}')),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                              'Fecha de nacimiento: ${resumen['fecha_nacimiento_huesped']}'),
                        ),
                        Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                                'Nacionalidad: ${resumen['nacionalidad_huesped']}')),
                        Align(
                            alignment: Alignment.topLeft,
                            child:
                                Text('Región: ${resumen['region_huesped']}')),
                        Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                                'Dirección: ${resumen['direccion_huesped']}')),
                        Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                                'Teléfono: ${resumen['telefono_huesped']}')),
                        Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                                'Correo electrónico: ${resumen['correo_huesped']}')),
                      ],
                    ),
                  )),
              Card(
                color: Colors.grey[300],
                child: Padding(
                    padding: EdgeInsets.all(16),
                    child: Column(
                      children: [
                        Text(
                          "Detalles Reserva",
                    ),
                        SizedBox(
                          height: 20,
                        ),
                        Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                                'Fecha de reserva: ${resumen['fecha_reserva']}')),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                              'Cantidad de días: ${resumen['cantidad_dias_reserva']}'),
                        ),
                        Align(
                            alignment: Alignment.topLeft,
                            child: Text('Pax: ${resumen['pax_reserva']}')),
                      ],
                    )),
              ),
            ],
          ),
        ),
      )),
    );
  }
}

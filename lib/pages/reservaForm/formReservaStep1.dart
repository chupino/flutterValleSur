
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class reservaFormStep1 extends StatefulWidget {
  
  Map reserva;
  String imagen;

  reservaFormStep1({String? imagen, Map? reserva, Key? key})
      : imagen = imagen ?? Get.arguments[0]['imagen'],
        reserva = reserva ?? Get.arguments[0]['reserva'],
        super(key: key);

  @override
  State<reservaFormStep1> createState() => _reservaFormStep1State();
}

class _reservaFormStep1State extends State<reservaFormStep1> {
  final _formKey1 = GlobalKey<FormState>();
  TextEditingController dateInicio = TextEditingController();
  TextEditingController dateFinal = TextEditingController();
  final ndiasForm = TextEditingController();
  bool nextDate = false;
  DateTime? firstDate;
  Map form1 = {};
  @override
  Widget build(BuildContext context) {
    String imagen=widget.imagen;
    Map reserva = widget.reserva;
    return Scaffold(
      appBar: AppBar(
        title: Text("Fechas"),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: MediaQuery.sizeOf(context).height / 2,
              width: MediaQuery.sizeOf(context).width - 50,
              child: Form(
                key: _formKey1,
                child: Card(
                  color: Colors.grey[300],
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(
                              vertical: 15, horizontal: 10),
                          child: Text(
                            "Selecciona las fechas en las que estaras alojado",
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(
                              vertical: 15, horizontal: 10),
                          child: TextFormField(
                            readOnly: true,
                            controller: dateInicio,
                            decoration: InputDecoration(
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.always,
                              labelText: 'Desde',
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(16)),
                              suffixIcon: Icon(Icons.edit_calendar_rounded),
                            ),
                            onChanged: (value) {
                              setState(() {
                                dateInicio.text = value;
                              });
                            },
                            onTap: () async {
                              DateTime? pickedDate = await showDatePicker(
                                  confirmText: "Aceptar",
                                  cancelText: "Cancelar",
                                  builder:
                                      (BuildContext context, Widget? child) {
                                    return child!;
                                  },
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime.now(),
                                  lastDate: DateTime(2035));
                              if (pickedDate != null) {
                                dateInicio.text =
                                    DateFormat("dd/MM/yyyy").format(pickedDate);
                                setState(() {
                                  dateFinal.text = "";
                                  ndiasForm.text = "";
                                  nextDate = true;
                                  firstDate = pickedDate;
                                });

                                if (dateFinal.text != null &&
                                    dateFinal.text != "" &&
                                    dateFinal.text.isNotEmpty) {
                                  print("datefinal no es nulo");
                                  print(dateFinal.text);
                                  final DateFormat format =
                                      DateFormat('dd/MM/yyyy');
                                  DateTime fechaInicio =
                                      format.parse(dateInicio.text);
                                  DateTime fechaFinal =
                                      format.parse(dateFinal.text);
                                  final diferencia =
                                      fechaFinal.difference(fechaInicio).inDays;
                                  setState(() {
                                    ndiasForm.text = diferencia.toString();
                                  });
                                }
                              }
                            },
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Campo Obligatorio';
                              }
                              return null;
                            },
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(
                              vertical: 15, horizontal: 10),
                          child: TextFormField(
                            enabled: nextDate,
                            readOnly: true,
                            controller: dateFinal,
                            decoration: InputDecoration(
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.always,
                              labelText: 'Hasta',
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(16)),
                              suffixIcon: Icon(Icons.edit_calendar_rounded),
                            ),
                            onChanged: (value) {
                              setState(() {
                                _formKey1.currentState!.validate();
                              });
                            },
                            onTap: () async {
                              DateTime? pickedDate = await showDatePicker(
                                  confirmText: "Aceptar",
                                  cancelText: "Cancelar",
                                  builder:
                                      (BuildContext context, Widget? child) {
                                    return child!;
                                  },
                                  context: context,
                                  initialDate:
                                      firstDate!.add(Duration(days: 1)),
                                  firstDate: firstDate!.add(Duration(days: 1)),
                                  lastDate: DateTime(2035));
                              if (pickedDate != null) {
                                dateFinal.text =
                                    DateFormat("dd/MM/yyyy").format(pickedDate);
                                if (dateInicio.text != null &&
                                    dateInicio.text != "" &&
                                    dateInicio.text.isNotEmpty) {
                                  print("dateinicio no es nulo");
                                  print(dateInicio.text);
                                  print(dateFinal.text);
                                  final DateFormat format =
                                      DateFormat('dd/MM/yyyy');
                                  DateTime fechaInicio =
                                      format.parse(dateInicio.text);
                                  DateTime fechaFinal =
                                      format.parse(dateFinal.text);
                                  final diferencia =
                                      fechaFinal.difference(fechaInicio).inDays;
                                  setState(() {
                                    ndiasForm.text = diferencia.toString();
                                  });
                                }
                              }
                            },
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Campo Obligatorio';
                              }
                              return null;
                            },
                          ),
                        ),
                      ]),
                ),
              ),
            ),
            ElevatedButton(
              child: Text("Siguiente"),
              onPressed: () {
                if (_formKey1.currentState!.validate()) {
                  form1={
                    "cantidad_dias_reserva": ndiasForm.text,
                  };
                  /* Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => reservaFormStep2(
                                imagen: imagen,
                                form1: form1,
                                reserva: reserva,
                              ))); */
                  Get.toNamed("/reservaPaso2",arguments: [{
                    "imagen": imagen,
                    "form1":form1,
                    "reserva":reserva
                  }]);
                } else {}
              },
              style: ElevatedButton.styleFrom(
                  minimumSize: Size(MediaQuery.sizeOf(context).width - 50, 40)),
            ),
          ],
        ),
      ),
    );
  }
}


import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:get/get.dart';

class reservaFormStep2 extends StatefulWidget {
  Map reserva;
  Map form1;
  String imagen;
  reservaFormStep2({Map? reserva, Map? form1, String? imagen, Key? key}):
    imagen=imagen??Get.arguments[0]["imagen"],
    form1=form1??Get.arguments[0]["form1"],
    reserva=reserva??Get.arguments[0]["reserva"],
    super(key: key);
  

  @override
  State<reservaFormStep2> createState() => _reservaFormStep2State();
}

class _reservaFormStep2State extends State<reservaFormStep2> {
  final _formKey2 = GlobalKey<FormState>();
  int _selectedReserva = 1;
  bool existeHuesped = true;

  TextEditingController dateInicio = TextEditingController();
  TextEditingController dateFinal = TextEditingController();
  TextEditingController nombreForm = TextEditingController();
  TextEditingController apellidoForm = TextEditingController();
  TextEditingController emailForm = TextEditingController();
  final ndiasForm = TextEditingController();
  bool nextDate = false;
  DateTime? firstDate;

  String _selectedValuePax = "1";

  TextEditingController nombreCompletoForm = TextEditingController();
  TextEditingController peticionesAdicionalesForm = TextEditingController();
  TextEditingController phoneForm = TextEditingController();
  TextEditingController idForm = TextEditingController();
  TextEditingController sexoForm = TextEditingController();
  TextEditingController fechaNacimientoForm = TextEditingController();
  TextEditingController regionForm = TextEditingController();
  TextEditingController direccionForm = TextEditingController();

  String _selectedValueFechaAprox = "Nose";
  Map reservaResumen = {};

  int _selectedTrabajo = 1;
  @override
  Widget build(BuildContext context) {
    String imagen=widget.imagen;
    Map reserva = widget.reserva;
    Map form1 = widget.form1;
    return Scaffold(
        appBar: AppBar(
          title: Text("Datos Reserva"),
        ),
        body: Form(
          key: _formKey2,
          child: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              child: Column(children: [
                Card(
                  color: Colors.grey[300],
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Algunos Datos",
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(
                              vertical: 25, horizontal: 10),
                          child: Column(children: [
                            Text("Vienes por trabajo?"),
                            Row(
                              children: [
                                Expanded(
                                  child: RadioListTile<int>(
                                    title: const Text('Si'),
                                    value: 1,
                                    groupValue: _selectedTrabajo,
                                    onChanged: (value) {
                                      setState(() {
                                        _selectedTrabajo = value!;
                                      });
                                    },
                                  ),
                                ),
                                Expanded(
                                  child: RadioListTile<int>(
                                    title: const Text('No'),
                                    value: 2,
                                    groupValue: _selectedTrabajo,
                                    onChanged: (value) {
                                      setState(() {
                                        _selectedTrabajo = value!;
                                      });
                                    },
                                  ),
                                ),
                              ],
                            )
                          ]),
                        ),
                        Container(
                          child: Column(children: [
                            Text("Para quien es la reserva?"),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: RadioListTile<int>(
                                    title: Text('Para mi',),
                                    value: 1,
                                    groupValue: _selectedReserva,
                                    onChanged: (value) {
                                      setState(() {
                                        _selectedReserva = value!;
                                      });
                                    },
                                  ),
                                ),
                                Expanded(
                                  child: RadioListTile<int>(
                                    title: Text(
                                      'Para otra persona',
                                      textAlign: TextAlign.center,
                                    ),
                                    value: 2,
                                    groupValue: _selectedReserva,
                                    onChanged: (value) {
                                      setState(() {
                                        _selectedReserva = value!;
                                      });
                                    },
                                  ),
                                ),
                              ],
                            )
                          ]),
                        ),
                      ],
                    ),
                  ),
                ),
                Card(
                    color: Colors.grey[300],
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            reserva["tipo_habitacion"],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Image.network(reserva["imagen"]),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            reserva["caracteristicas"],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          DropdownButtonFormField<String>(
                            value: _selectedValuePax,
                            items: const [
                              DropdownMenuItem(
                                child: Text("1"),
                                value: "1",
                              ),
                              DropdownMenuItem(
                                child: Text("2"),
                                value: "2",
                              )
                            ],
                            onChanged: (value) {
                              setState(() {
                                _selectedValuePax = value!;
                              });
                            },
                            decoration: InputDecoration(
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.always,
                              labelText: 'Nro de Huespedes',
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(16)),
                            ),
                          ),
                        ],
                      ),
                    )),
                Card(
                  color: Colors.grey[300],
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Peticiones Adicionales",
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          controller: peticionesAdicionalesForm,
                          maxLines: null,
                          keyboardType: TextInputType.multiline,
                          textInputAction: TextInputAction.newline,
                          decoration: InputDecoration(
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                            suffixIcon: Icon(Icons.post_add_rounded),
                            labelText: 'Ingresa sus peticiones adicionales',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16)),
                          ),
                          onChanged: (value) {
                            setState(() {
                              _formKey2.currentState!.validate();
                            });
                          },
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Align(
                            child: Text(
                              "Opcional",
                              textAlign: TextAlign.left,
                            ),
                            alignment: Alignment.topLeft),
                      ],
                    ),
                  ),
                ),
                Card(
                  color: Colors.grey[300],
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    child: Column(children: [
                      Text(
                        "Hora de Llegada",
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      DropdownButtonFormField<String>(
                        value: _selectedValueFechaAprox,
                        items: const [
                          DropdownMenuItem(
                            child: Text("No sé"),
                            value: "Nose",
                          ),
                          DropdownMenuItem(
                            child: Text("00:00 - 01:00"),
                            value: "00:00 - 01:00",
                          ),
                          DropdownMenuItem(
                            child: Text("01:00 - 02:00"),
                            value: "01:00 - 02:00",
                          ),
                          DropdownMenuItem(
                            child: Text("02:00 - 03:00"),
                            value: "02:00 - 03:00",
                          ),
                          DropdownMenuItem(
                            child: Text("03:00 - 04:00"),
                            value: "03:00 - 04:00",
                          ),
                          DropdownMenuItem(
                            child: Text("04:00 - 05:00"),
                            value: "04:00 - 05:00",
                          ),
                          DropdownMenuItem(
                            child: Text("05:00 - 06:00"),
                            value: "05:00 - 06:00",
                          ),
                          DropdownMenuItem(
                            child: Text("06:00 - 07:00"),
                            value: "06:00 - 07:00",
                          ),
                          DropdownMenuItem(
                            child: Text("07:00 - 08:00"),
                            value: "07:00 - 08:00",
                          ),
                          DropdownMenuItem(
                            child: Text("08:00 - 09:00"),
                            value: "08:00 - 09:00",
                          ),
                          DropdownMenuItem(
                            child: Text("09:00 - 10:00"),
                            value: "09:00 - 10:00",
                          ),
                          DropdownMenuItem(
                            child: Text("10:00 - 11:00"),
                            value: "10:00 - 11:00",
                          ),
                          DropdownMenuItem(
                            child: Text("11:00 - 12:00"),
                            value: "11:00 - 12:00",
                          ),
                          DropdownMenuItem(
                            child: Text("12:00 - 13:00"),
                            value: "12:00 - 13:00",
                          ),
                          DropdownMenuItem(
                            child: Text("13:00 - 14:00"),
                            value: "13:00 - 14:00",
                          ),
                          DropdownMenuItem(
                            child: Text("14:00 - 15:00"),
                            value: "14:00 - 15:00",
                          ),
                          DropdownMenuItem(
                            child: Text("15:00 - 16:00"),
                            value: "15:00 - 16:00",
                          ),
                          DropdownMenuItem(
                            child: Text("16:00 - 17:00"),
                            value: "16:00 - 17:00",
                          ),
                          DropdownMenuItem(
                            child: Text("17:00 - 18:00"),
                            value: "17:00 - 18:00",
                          ),
                          DropdownMenuItem(
                            child: Text("18:00 - 19:00"),
                            value: "18:00 - 19:00",
                          ),
                          DropdownMenuItem(
                            child: Text("19:00 - 20:00"),
                            value: "19:00 - 20:00",
                          ),
                          DropdownMenuItem(
                            child: Text("20:00 - 21:00"),
                            value: "20:00 - 21:00",
                          ),
                          DropdownMenuItem(
                            child: Text("21:00 - 22:00"),
                            value: "21:00 - 22:00",
                          ),
                          DropdownMenuItem(
                            child: Text("22:00 - 23:00"),
                            value: "22:00 - 23:00",
                          ),
                          DropdownMenuItem(
                            child: Text("23:00 - 00:00"),
                            value: "23:00 - 00:00",
                          ),
                        ],
                        onChanged: (value) {
                          setState(() {
                            _selectedValueFechaAprox = value!;
                          });
                        },
                        decoration: InputDecoration(
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          labelText: 'Añade tu Hora de llegada aproximada',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16)),
                        ),
                      ),
                    ]),
                  ),
                ),
                ElevatedButton(
                  child: Text("Siguiente"),
                  onPressed: () {
                    if (_formKey2.currentState!.validate()) {

                    form1.addAll({
                        "tipo_reserva":"aplicativo",
                        "razon_hospedaje": _selectedTrabajo==1?"trabajo":"personal",
                        "destinatario_reserva": _selectedReserva==1?"personal":"otra persona",
                        "peticiones_adicionales": peticionesAdicionalesForm.text,
                        "hora_llegada": _selectedValueFechaAprox.toString(),
                        "pax_reserva": _selectedValuePax.toString(),
                        "nro_habitacion_reserva":
                            reserva["nro_habitacion"].toString(),
                        "tipo_habitacion_reserva":
                            reserva["tipo_habitacion"].toString()
                    });
                    /* Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => reservaFormStep3(
                              imagen: imagen,
                                form2: form1,
                                ))); */
                        Get.toNamed("/reservaPaso3",arguments: [{
                          "imagen":imagen,
                          "form2":form1,
                          "reserva":reserva,
                        }]);
                    }else{

                    }
                  },
                  style: ElevatedButton.styleFrom(
                      minimumSize:
                          Size(MediaQuery.sizeOf(context).width - 50, 40)),
                ),
              ]),
            ),
          ),
        ));
  }
}

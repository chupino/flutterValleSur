
import 'package:apitest3/pages/reservaForm/resumen.dart';
import 'package:apitest3/services/UserServices.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:get/get.dart';

class reservaFormStep3 extends StatefulWidget {
  Map form2;
  String imagen;
  Map reserva;
  reservaFormStep3({Map? form2,String? imagen,Map? reserva, Key? key}):
    form2=form2??Get.arguments[0]["form2"],
    imagen=imagen??Get.arguments[0]["imagen"],
    reserva=reserva??Get.arguments[0]["reserva"],
    super(key: key);

  @override
  State<reservaFormStep3> createState() => _reservaFormStep3State();
}

class _reservaFormStep3State extends State<reservaFormStep3> {
  final _formKey3 = GlobalKey<FormState>();
  TextEditingController idForm = TextEditingController();
  List<String> _tipoIdentificacion = [
    'DNI',
    'Carnet Extranjeria',
  ];
  String _selectedTipoIdentificacion = "DNI";

  @override
  Widget build(BuildContext context) {
    Map form2 = widget.form2;
    String imagen = widget.imagen;
    Map reserva=widget.reserva;
    return Scaffold(
      appBar: AppBar(
        title: Text("Identificacion"),
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          child: Form(
              key: _formKey3,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Card(
                    color: Colors.grey[300],
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                      child: Column(children: [
                        Text(
                          "Tipo de Identificacion",
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        DropdownButtonFormField<String>(
                          value: _selectedTipoIdentificacion,
                          items: const [
                            DropdownMenuItem(
                              child: Text("DNI"),
                              value: "DNI",
                            ),
                            DropdownMenuItem(
                              child: Text("Identificacion Extranjera"),
                              value: "Carnet Extranjeria",
                            )
                          ],
                          onChanged: (value) {
                            setState(() {
                              _selectedTipoIdentificacion = value!;
                            });
                          },
                          decoration: InputDecoration(
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                            labelText: 'Tipo de Identificación',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16)),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          keyboardType: TextInputType.number,
                          controller: idForm,
                          decoration: InputDecoration(
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.always,
                              labelText: 'Ingresa un ID',
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(16)),
                              suffixIcon: Icon(Icons.email)),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Campo obligatorio';
                            }
                            return null;
                          },
                          onSaved: (value) {
                            // Aquí puedes guardar el valor ingresado por el usuario
                          },
                        ),
                      ]),
                    ),
                  ),
                  ElevatedButton(
                    child: Text("Siguiente"),
                    onPressed: () async {
                      if (_formKey3.currentState!.validate()) {
                        final Map huesped = await UserServices().getHuesped(
                            _selectedTipoIdentificacion, idForm.text);
                        final status = huesped["status"];
                        //print(status);
                        if (status == 200) {
                          /* Navigator.push(context, MaterialPageRoute(builder: (context)=>ResumenReserva(imagen: imagen, resumen: resumen))) */
                          print(huesped);
                          form2.addAll({
                            "id_huesped": huesped["data"]["_id"],
                            "nombre_huesped":huesped["data"]["nombres"],
                            "apellido_huesped":huesped["data"]["apellidos"],
                            "tipo_identificacion_huesped":huesped["data"]["identificacion"]["tipo_identificacion"],
                            "identificacion_huesped":huesped["data"]["identificacion"]["identificacion_huesped"],
                            "sexo_huesped":huesped["data"]["sexo"],
                            "fecha_nacimiento_huesped":huesped["data"]["fecha_nacimiento"],
                            "nacionalidad_huesped":huesped["data"]["nacionalidad"],
                            "region_huesped":huesped["data"]["region"],
                            "direccion_huesped":huesped["data"]["direccion"],
                            "telefono_huesped":huesped["data"]["telefono"],
                            "correo_huesped":huesped["data"]["correo"],
                            "fecha_reserva": DateFormat('dd-MM-yyyy HH:mm')
                                .format(DateTime.now()),
                          });
                          /* Navigator.push(context,MaterialPageRoute(builder: (context)=>reservaFormStep5(form2: form2,))); */
                          Get.toNamed("/reservaPaso5",arguments: [{
                                "resumen":form2,
                                "reserva":reserva,
                                "imagen":imagen
                              }]);
                          /* Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return ResumenReserva(
                              resumen: form2,
                              imagen: imagen,
                            );
                          })); */
                          print(huesped);
                        } else {
                          Map formHuesped={
                            "tipo_identificacion_huesped":_selectedTipoIdentificacion,
                            "identificacion_huesped":idForm.text
                            };
/*                           Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => reservaFormStep4(formHuesped:formHuesped,form2:form2,imagen:imagen))); */
                            Get.toNamed("reservaPaso4",arguments: [{
                              "formHuesped":formHuesped,
                              "form2":form2,
                              "imagen":imagen,
                              "reserva":reserva,
                            }]);
                              
                        }
                      } else {}
                    },
                    style: ElevatedButton.styleFrom(
                        minimumSize:
                            Size(MediaQuery.sizeOf(context).width - 50, 40)),
                  ),
                ],
              )),
        ),
      ),
    );
  }
}

import 'package:apitest3/pages/reservaForm/resumen.dart';
import 'package:apitest3/services/UserServices.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:get/get.dart';

class reservaFormStep4 extends StatefulWidget {
  Map formHuesped;
  String imagen;
  Map form2;
  Map reserva;
  reservaFormStep4({Map? formHuesped, String? imagen, Map? form2, Map? reserva, Key? key}):
    formHuesped=formHuesped??Get.arguments[0]["formHuesped"],
    imagen=imagen??Get.arguments[0]["imagen"],
    form2=form2??Get.arguments[0]["form2"],
    reserva=reserva??Get.arguments[0]["reserva"],
    super(key:key);

  @override
  State<reservaFormStep4> createState() => _reservaFormStep4State();
}

class _reservaFormStep4State extends State<reservaFormStep4> {
  final _formKey4 = GlobalKey<FormState>();

  TextEditingController nombreForm = TextEditingController();
  TextEditingController apellidoForm = TextEditingController();
  TextEditingController emailForm = TextEditingController();
  TextEditingController phoneForm = TextEditingController();
  TextEditingController idForm = TextEditingController();
  TextEditingController sexoForm = TextEditingController();
  TextEditingController fechaNacimientoForm = TextEditingController();
  TextEditingController regionForm = TextEditingController();
  TextEditingController direccionForm = TextEditingController();
  String _selectedPais = "Peru";
  final List<String> _countries = [
    'Peru',
    'United States',
    'Canada',
    'Mexico',
    'United Kingdom',
    'Germany',
    'France',
    'Spain',
    'Italy',
    'Japan',
    'China',
  ];
  final List<String> _tipoIdentificacion = [
    'dni',
    'carnet extranjeria',
  ];
  final List<String> _tipoSexo = [
    'masculino',
    'femenino',
  ];
  String _selectedTipoIdentificacion = "dni";

  String _selectedSexo = "masculino";
  

  @override
  Widget build(BuildContext context) {
    Map reserva=widget.reserva;
    Map formHuesped = widget.formHuesped;
    Map form2 = widget.form2;
    String imagen = widget.imagen;
    return Scaffold(
      appBar: AppBar(
        title: Text("Datos Personales"),
      ),
      body: Form(
          key: _formKey4,
          child: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              child: Column(children: [
                Card(
                  color: Colors.grey[300],
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    child: Column(
                      children: [
                        Text(
                          "Datos Personales",
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          keyboardType: TextInputType.name,
                          controller: nombreForm,
                          decoration: InputDecoration(
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                            labelText: 'Ingresa un nombre',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16)),
                            suffixIcon: Icon(Icons.person),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Campo Obligatorio';
                            }
                            return null;
                          },
                          onSaved: (value) {
                            // Aquí puedes guardar el valor ingresado por el usuario
                          },
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          controller: apellidoForm,
                          keyboardType: TextInputType.name,
                          decoration: InputDecoration(
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.always,
                              labelText: 'Ingresa un apellido',
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(16)),
                              suffixIcon: Icon(Icons.person)),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Campo Obligatorio';
                            }
                            return null;
                          },
                          onSaved: (value) {
                            // Aquí puedes guardar el valor ingresado por el usuario
                          },
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          controller: emailForm,
                          decoration: InputDecoration(
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.always,
                              labelText: 'Ingresa un correo electronico',
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(16)),
                              suffixIcon: Icon(Icons.email)),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Campo obligatorio';
                            }
                            if (!RegExp(
                                    r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$')
                                .hasMatch(value)) {
                              return 'Dirección de correo electrónico no válida';
                            }
                            return null;
                          },
                          onSaved: (value) {
                            // Aquí puedes guardar el valor ingresado por el usuario
                          },
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        DropdownButtonFormField<String>(
                          value: _selectedPais,
                          items: _countries.map((country) {
                            return DropdownMenuItem<String>(
                              value: country,
                              child: Text(country),
                            );
                          }).toList(),
                          onChanged: (value) {
                            setState(() {
                              _selectedPais = value!;
                            });
                          },
                          decoration: InputDecoration(
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                            labelText: 'Pais',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16)),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          keyboardType: TextInputType.phone,
                          controller: phoneForm,
                          decoration: InputDecoration(
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.always,
                              labelText: 'Ingresa un Telefono',
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(16)),
                              suffixIcon: Icon(Icons.phone)),
                          onChanged: (value) {
                            if (value.length > 9) {
                              phoneForm.text = value.substring(0, 9);
                            }
                          },
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Campo obligatorio';
                            }
                            if (value.length != 9) {
                              return 'El número debe tener exactamente 9 dígitos';
                            }
                            // Validación adicional según tus necesidades
                            return null;
                          },
                          onSaved: (value) {
                            // Aquí puedes guardar el valor ingresado por el usuario
                          },
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        DropdownButtonFormField<String>(
                          value: _selectedSexo,
                          items: _tipoSexo.map((sexo) {
                            return DropdownMenuItem<String>(
                              value: sexo,
                              child: Text(sexo),
                            );
                          }).toList(),
                          onChanged: (value) {
                            setState(() {
                              _selectedSexo = value!;
                            });
                          },
                          decoration: InputDecoration(
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                            labelText: 'Sexo',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16)),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          readOnly: true,
                          controller: fechaNacimientoForm,
                          decoration: InputDecoration(
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                            labelText: 'Fecha de Nacimiento',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16)),
                            suffixIcon: Icon(Icons.edit_calendar_rounded),
                          ),
                          onChanged: (value) {
                            setState(() {
                              _formKey4.currentState!.validate();
                            });
                          },
                          onTap: () async {
                            DateTime? pickedDate = await showDatePicker(
                                confirmText: "Aceptar",
                                cancelText: "Cancelar",
                                builder: (BuildContext context, Widget? child) {
                                  return child!;
                                },
                                context: context,
                                initialDate: DateTime(1900),
                                firstDate: DateTime(1900),
                                lastDate: DateTime(2023));
                            if (pickedDate != null) {
                              fechaNacimientoForm.text =
                                  DateFormat("dd-MM-yyyy").format(pickedDate);
                            }
                          },
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Campo Obligatorio';
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          controller: regionForm,
                          decoration: InputDecoration(
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.always,
                              labelText: 'Ingresa tu Region',
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(16)),
                              suffixIcon: Icon(Icons.map)),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Campo Obligatorio';
                            }
                            return null;
                          },
                          onSaved: (value) {
                            // Aquí puedes guardar el valor ingresado por el usuario
                          },
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          controller: direccionForm,
                          decoration: InputDecoration(
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.always,
                              labelText: 'Ingresa tu Direccion',
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(16)),
                              suffixIcon: Icon(Icons.home)),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Campo Obligatorio';
                            }
                            return null;
                          },
                          onSaved: (value) {
                            // Aquí puedes guardar el valor ingresado por el usuario
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () async {
                    if (_formKey4.currentState!.validate()) {
                      DateTime fecha = DateFormat("dd-MM-yyyy")
                          .parse(fechaNacimientoForm.text);
                      String fechaFormateada =
                          DateFormat("yyyy-MM-dd").format(fecha);
                      formHuesped.addAll({
                        "nombre_huesped": nombreForm.text,
                        "apellido_huesped": apellidoForm.text,
                        "sexo_huesped": _selectedSexo.toString(),
                        "fecha_nacimiento_huesped": fechaFormateada,
                        "nacionalidad_huesped": _selectedPais.toString(),
                        "region_huesped": regionForm.text,
                        "direccion_huesped": direccionForm.text,
                        "telefono_huesped": phoneForm.text,
                        "correo_huesped": emailForm.text,
                      });
                      Map responseHuesped =
                          await UserServices().sendHuesped(formHuesped);
                      print(responseHuesped);
                      print("+++++++++++$form2");
                      if (responseHuesped["status"] == 200) {
                        form2.addAll({
                          "id_huesped": responseHuesped["data"]["_id"],
                          "nombre_huesped": responseHuesped["data"]["nombres"],
                          "apellido_huesped": responseHuesped["data"]
                              ["apellidos"],
                          "tipo_identificacion_huesped": responseHuesped["data"]
                              ["identificacion"]["tipo_identificacion"],
                          "identificacion_huesped": responseHuesped["data"]
                              ["identificacion"]["identificacion_huesped"],
                          "sexo_huesped": responseHuesped["data"]["sexo"],
                          "fecha_nacimiento_huesped": responseHuesped["data"]
                              ["fecha_nacimiento"],
                          "nacionalidad_huesped": responseHuesped["data"]
                              ["nacionalidad"],
                          "region_huesped": responseHuesped["data"]["region"],
                          "direccion_huesped": responseHuesped["data"]
                              ["direccion"],
                          "telefono_huesped": responseHuesped["data"]
                              ["telefono"],
                          "correo_huesped": responseHuesped["data"]["correo"],
                          "fecha_reserva": DateFormat('dd-MM-yyyy HH:mm')
                              .format(DateTime.now()),
                        });
                        /* Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return ResumenReserva(
                            resumen: form2,
                            imagen: imagen,
                          );
                        })); */
                        Get.toNamed("/reservaPaso5",arguments: [{
                          "resumen":form2,
                          "imagen":imagen,
                          "reserva":reserva,
                        }]);
                      } else {
                        AlertDialog(
                          title: Text('Error'),
                          content: Text('Ocurrio un error inesperado'),
                          actions: <Widget>[
                            TextButton(
                              child: Text('Aceptar'),
                              onPressed: () {
                                // Acciones a realizar cuando se presiona el botón "Aceptar"
                                Navigator.of(context)
                                    .pop(); // Cerrar el diálogo
                              },
                            ),
                          ],
                        );
                      }
                    } else {}
                  },
                  child: Text("Terminar"),
                  style: ElevatedButton.styleFrom(
                      minimumSize:
                          Size(MediaQuery.sizeOf(context).width - 50, 40)),
                )
              ]),
            ),
          )),
    );
  }
}

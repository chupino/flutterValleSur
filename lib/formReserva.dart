import 'package:apitest3/pages/reservaForm/resumen.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Reserva extends StatefulWidget {
  final Map reserva;
  const Reserva({required this.reserva, super.key});

  @override
  State<Reserva> createState() => _ReservaState();
}

class _ReservaState extends State<Reserva> {
  final _formKey1 = GlobalKey<FormState>();
  final _formKey2 = GlobalKey<FormState>();
  final _formKey3 = GlobalKey<FormState>();
  final _formKey4 = GlobalKey<FormState>();
  int _selectedReserva = 1;
  int _currentStep = 0;
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

  String _selectedPais = "Peru";
  List<String> _countries = [
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
  List<String> _tipoIdentificacion = [
    'dni',
    'carnet extranjeria',
  ];
  List<String> _tipoSexo = [
    'hombre',
    'mujer',
  ];

  String _selectedTipoIdentificacion = "dni";

  String _selectedSexo = "hombre";

  int _selectedTrabajo = 1;

  @override
  Widget build(BuildContext context) {
    final _reserva = widget.reserva;
    return Scaffold(
      appBar: AppBar(title: Text("Reserva")),
      body: formReserva(_reserva),
    );
  }

  SingleChildScrollView formReserva(Map reserva) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Seleccionaste:",
                textAlign: TextAlign.justify),
            Card(
              color: Colors.grey[300],
              child: ListTile(
                title: Text(reserva["tipo_habitacion"]),
                subtitle: Text(reserva["caracteristicas"]),
                leading: Image.network(reserva["imagen"]),
                contentPadding:
                    EdgeInsets.symmetric(vertical: 10, horizontal: 5),
              ),
            ),
            Stepper(
                currentStep: _currentStep,
                controlsBuilder: (context, ControlsDetails controls) {
                  if (_currentStep == 0) {
                    return Container(
                      margin: EdgeInsets.only(top: 50),
                      child: Row(
                        children: [
                          Expanded(
                            child: ElevatedButton(
                              child: Text("Siguiente"),
                              onPressed: () {
                                controls.onStepContinue!();
                              },
                            ),
                          ),
                        ],
                      ),
                    );
                  }
                  if (_currentStep == 1) {
                    return Container(
                      margin: EdgeInsets.only(top: 50),
                      child: Row(children: [
                        Expanded(
                          child: ElevatedButton(
                            child: Text("Siguiente"),
                            onPressed: () {
                              controls.onStepContinue!();
                            },
                          ),
                        ),
                        const SizedBox(
                          width: 12,
                        ),
                        Expanded(
                          child: ElevatedButton(
                            child: Text("Atrás"),
                            onPressed: () {
                              controls.onStepCancel!();
                            },
                          ),
                        ),
                      ]),
                    );
                  }
                  if (_currentStep == 2) {
                    return Container(
                      margin: EdgeInsets.only(top: 50),
                      child: Row(
                        children: [
                          Expanded(
                            child: ElevatedButton(
                              child: Text("Terminar"),
                              onPressed: () {
                                controls.onStepContinue!();
                              },
                            ),
                          ),
                          const SizedBox(
                            width: 12,
                          ),
                          Expanded(
                            child: ElevatedButton(
                              child: Text("Atrás"),
                              onPressed: () {
                                controls.onStepCancel!();
                              },
                            ),
                          ),
                        ],
                      ),
                    );
                  } else {
                    return Container();
                  }
                },
                physics: ScrollPhysics(),
                onStepTapped: (step) {
                  print(step);
                },
                onStepContinue: () {
                  if (_currentStep == 0) {
                    setState(() {
                      print(_currentStep);

                      if (_formKey1.currentState!.validate()) {
                        _currentStep += 1;
                      }
                      print(_currentStep);
                    });
                  } else if (_currentStep == 1) {
                    setState(() {
                      if (_formKey2.currentState!.validate()) {
                        _currentStep += 1;
                      }
                    });
                  } else if (_currentStep == 2) {
                    setState(() {
                      reservaResumen = {
                        "nombre_huesped": nombreForm.text,
                        "apellido_huesped": apellidoForm.text,
                        "tipo_identificacion_huesped":
                            _selectedTipoIdentificacion,
                        "identificacion_huesped": idForm.text,
                        "sexo_huesped": _selectedSexo,
                        "fecha_nacimiento_huesped": fechaNacimientoForm.text,
                        "nacionalidad_huesped": _selectedPais,
                        "region_huesped": regionForm.text,
                        "direccion_huesped": direccionForm.text,
                        "telefono_huesped": phoneForm.text,
                        "correo_huesped": emailForm.text,
                        "fecha_reserva": DateFormat('dd-MM-yyyy HH:mm')
                            .format(DateTime.now()),
                        "cantidad_dias_reserva": ndiasForm.text,
                        "pax_reserva": _selectedValuePax,
                        "nro_habitacion_reserva":
                            reserva["nro_habitacion"].toString(),
                        "tipo_habitacion_reserva":
                            reserva["tipo_habitacion"].toString()
                      };
                      if (_formKey3.currentState!.validate()) {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return ResumenReserva(
                            resumen: reservaResumen,
                            imagen: reserva["imagen"],
                          );
                        }));
                      }

                      print("finish");
                    });
                  }
                },
                onStepCancel: () {
                  setState(() {
                    if (_currentStep > 0) {
                      _currentStep -= 1;
                    } else {
                      // Cancela el formulario
                    }
                  });
                },
                steps: 
                  stepsForm(reserva),
                )
          ],
        ),
      ),
    );
  }
  List<Step> stepsForm(Map reserva){
    return [
      Step(title: Text("Paso 1"), content: step1()),
      Step(title: Text("Paso 2"), content: step2(reserva)),
      Step(title: Text("Paso 3"), content: step3(reserva)),
      if(existeHuesped)
        Step(title: Text("Paso 4"), content: step4(reserva))
    ];
  }
  Container step4(Map reserva) {
    return Container(
      child: Form(
        key: _formKey4,
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
                        floatingLabelBehavior: FloatingLabelBehavior.always,
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
                    value: _selectedTipoIdentificacion,
                    items: _tipoIdentificacion.map((id) {
                      return DropdownMenuItem<String>(
                        value: id,
                        child: Text(id),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        _selectedTipoIdentificacion = value!;
                      });
                    },
                    decoration: InputDecoration(
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      labelText: 'Tipo de Identificacion',
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
                    onChanged: (value) {
                      if (value.length > 8) {
                        idForm.text = value.substring(0, 8);
                      }
                    },
                    decoration: InputDecoration(
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        labelText: 'Ingresa un $_selectedTipoIdentificacion',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16)),
                        suffixIcon: Icon(Icons.perm_identity)),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Campo obligatorio';
                      }
                      if (int.tryParse(value) == null) {
                        return 'Debe ser un número entero';
                      }
                      if (value.length != 8) {
                        return 'El número debe tener exactamente 8 dígitos';
                      }
                      // Validación adicional según tus necesidades
                      return null;
                    },
                    onSaved: (value) {},
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
                        _formKey3.currentState!.validate();
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
                        floatingLabelBehavior: FloatingLabelBehavior.always,
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
                        floatingLabelBehavior: FloatingLabelBehavior.always,
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
          )
        ]),
      ),
    );
  }

  Container step3(Map reserva) {
    return Container(
      child: Form(
          key: _formKey3,
          child: Column(
            children: [
              Card(
                color: Colors.grey[300],
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
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
                          value: "dni",
                        ),
                        DropdownMenuItem(
                          child: Text("Identificacion Extranjera"),
                          value: "Identificacion Extranjera",
                        )
                      ],
                      onChanged: (value) {
                        setState(() {
                          _selectedTipoIdentificacion = value!;
                          if(existeHuesped){
                            existeHuesped=false;
                          }else{
                            existeHuesped=true;
                          }
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
                          floatingLabelBehavior: FloatingLabelBehavior.always,
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
              )
            ],
          )),
    );
  }

  Container step2(Map reserva) {
    return Container(
      child: Form(
        key: _formKey2,
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
                    padding: EdgeInsets.symmetric(vertical: 25, horizontal: 10),
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
                  /* TextFormField(
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
                        floatingLabelBehavior: FloatingLabelBehavior.always,
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
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        labelText: 'Ingresa un correo electronico',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16)),
                        suffixIcon: Icon(Icons.email)),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Campo obligatorio';
                      }
                      if (!RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$')
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
                  ),*/
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
          SizedBox(
            height: 10,
          ),
          Card(
              color: Colors.grey[300],
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
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
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        labelText: 'Nro de Huespedes',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16)),
                      ),
                    ),
                    /* SizedBox(height: 20,),
                    TextFormField(
                      controller: nombreCompletoForm,
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          labelText: 'Ingresa el nombre completo del Cliente',
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
                    ), */
                  ],
                ),
              )),
          SizedBox(
            height: 10,
          ),
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
                    /* validator: (value) {
                      if (value!.isEmpty) {
                        return 'Campo Obligatorio';
                      }
            
                      return null;
                    },
                    onSaved: (value) {
                      // Aquí puedes guardar el valor ingresado por el usuario
                    }, */
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
        ]),
      ),
    );
  }

  Container step1() {
    return Container(
      child: Form(
        key: _formKey1,
        child: Card(
          color: Colors.grey[300],
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                  child: Text(
                    "Selecciona las fechas en las que estaras alojado",
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                  child: TextFormField(
                    readOnly: true,
                    controller: dateInicio,
                    decoration: InputDecoration(
                      floatingLabelBehavior: FloatingLabelBehavior.always,
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
                          builder: (BuildContext context, Widget? child) {
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
                          final DateFormat format = DateFormat('dd/MM/yyyy');
                          DateTime fechaInicio = format.parse(dateInicio.text);
                          DateTime fechaFinal = format.parse(dateFinal.text);
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
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                  child: TextFormField(
                    enabled: nextDate,
                    readOnly: true,
                    controller: dateFinal,
                    decoration: InputDecoration(
                      floatingLabelBehavior: FloatingLabelBehavior.always,
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
                          builder: (BuildContext context, Widget? child) {
                            return child!;
                          },
                          context: context,
                          initialDate: firstDate!.add(Duration(days: 1)),
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
                          final DateFormat format = DateFormat('dd/MM/yyyy');
                          DateTime fechaInicio = format.parse(dateInicio.text);
                          DateTime fechaFinal = format.parse(dateFinal.text);
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
    );
  }
}

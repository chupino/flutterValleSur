import 'package:flutter/material.dart';

class InfoHabitacion extends StatefulWidget {
  Map habitacion;
  InfoHabitacion(
    {
      Key? key,
      required this.habitacion,
    }
    ):super(key:key);

  @override
  State<InfoHabitacion> createState() => _InfoHabitacionState();
}

class _InfoHabitacionState extends State<InfoHabitacion> {
  @override
  Widget build(BuildContext context) {
    Map habitacion=widget.habitacion;
    return Scaffold(
      appBar: AppBar(
        title: Text("Info"),
      ),
      body: Info(habitacion),
    );
  }

  Card Info(Map<dynamic, dynamic> habitacion) {
    return Card();
    /* return Container(
      padding: EdgeInsets.all(2),
      child: Column(children: [
        Image.network(habitacion["imagen"]),
        SizedBox(height: 20,),
        Text(habitacion["tipo_habitacion"],style: TextStyle(fontSize: 41),)
        Text(habitacion)
      ],)
    ); */
    /* return Card(
      child: Column(
        children: [
          Image.network(habitacion["imagen"]),
          ListTile(
            title: Text(habitacion["tipo_habitacion"]),
            subtitle: Text(habitacion["caracteristicas"]),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Precio: \$${habitacion["precio"].toStringAsFixed(2)}'),
                Text('Piso: ${habitacion["nro_piso"]}'),
              ],
            ),
          ),
        ],
      ),
    ); */
  }
}
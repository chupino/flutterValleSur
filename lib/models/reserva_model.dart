class ReservaModel {
  ReservaModel({
    required this.id,
    required this.roomImage,
    required this.roomName,
    required this.utility,
    required this.size,
    required this.price,
    required this.roomNum,
    required this.floorNum,
    required this.estado,
    required this.features,
    required this.nombres,
    required this.apellidos,
    required this.correo,
    required this.idHuesped,
    required this.tipoId,
    required this.telefono,
    required this.nacionalidad,
    required this.fechaReserva,
    required this.cantidadDiasReserva,
    required this.acompaniantes,
    required this.tipoReserva,
    required this.peticionesAdicionales,
    required this.horaLlegadaReserva,
    required this.fecha_checkin,
    required this.fecha_checkout,

  });
  final String horaLlegadaReserva;
  final String peticionesAdicionales;
  final String tipoReserva;
  final String acompaniantes;
  final String cantidadDiasReserva;
  final String fechaReserva;
  final String telefono;
  final String nacionalidad;
  final String tipoId;
  final String idHuesped;
  final String nombres;
  final String apellidos;
  final String correo;
  final String roomImage;
  final String roomName;
  final String utility;
  final int size;
  final String id;
  final int price;
  final String roomNum;
  final String floorNum;
  final String estado;
  final String features;
  final String fecha_checkin;
  final String fecha_checkout;
  
  factory ReservaModel.fromJson(Map<String, dynamic> json) {
  return ReservaModel(
    id: json['_id'].toString(),
    roomImage: json['habitacion']['imagen'].toString(),
    roomName: json['habitacion']['tipo_habitacion'].toString(),
    utility: json['habitacion']['caracteristicas'].toString(),
    size: json['habitacion']['nro_habitacion'],
    price: json['habitacion']['precio'],
    roomNum: json['habitacion']['nro_habitacion'].toString(),
    floorNum: json['habitacion']['nro_piso'].toString(),
    estado: json['habitacion']['estado'].toString(),
    features: json['habitacion']['caracteristicas'].toString(),
    nombres: json['huesped']['nombres'].toString(),
    apellidos: json['huesped']['apellidos'].toString(),
    correo: json['huesped']['correo'].toString(),
    idHuesped: json['id_huesped'].toString(),
    tipoId: json['huesped']['identificacion']['tipo_identificacion'].toString(),
    telefono: json['huesped']['telefono'].toString(),
    nacionalidad: json['huesped']['nacionalidad'].toString(),
    fechaReserva: json['datosReserva']['fecha_reserva'].toString(),
    cantidadDiasReserva: json['datosReserva']['cantidad_dias_reserva'].toString(),
    acompaniantes: json['datosReserva']['pax_reserva'].toString(),
    tipoReserva: json['datosReserva']['tipo_reserva'].toString(),
    peticionesAdicionales: json['datosReserva']['peticiones_adicionales'].toString(),
    horaLlegadaReserva: json['datosReserva']['hora_llegada'].toString(),
    fecha_checkin: json['datosReserva']['fecha_checkin'].toString(),
    fecha_checkout: json['datosReserva']['fecha_checkout'].toString(),
  );
}

}

class RoomModel {
  RoomModel({
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

  });

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
  
}

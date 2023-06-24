import 'package:get/get.dart';
import 'package:pocketbase/pocketbase.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController
  final pb = PocketBase('https://pocket.bjrcode.com');
  final count = 0.obs;
  RxString nombre = RxString('');
  Future<String> getNombre() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString("token");
    final UID=prefs.getString("UID");
    final headers = {
      'Authorization': 'Bearer $token',
    };
    final record = await pb.collection('usersValleSur').getOne(
          '$UID',
          headers: headers,
        );

    nombre.value=record.data["nombres"];
    print("**************************$nombre");
    print(record);
    return nombre.value;
  }

  @override
  void onInit() async {
    super.onInit();
    getNombre();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;
}

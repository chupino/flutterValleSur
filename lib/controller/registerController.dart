import 'package:get/get.dart';
import 'package:pocketbase/pocketbase.dart';
import 'package:shared_preferences/shared_preferences.dart';

class registerController extends GetxController {
  Map? registerIntent;
  final pb = PocketBase('https://pocket.bjrcode.com');
  
  Future<RecordModel> intentRegister(
      {required Map<String, dynamic> registerIntent}) async {
        final prefs=await SharedPreferences.getInstance();
    final Map<String, dynamic> body = registerIntent;
    try {
      print(registerIntent["fecha_nacimiento"]);
      final record = await pb.collection('usersValleSur').create(body: body);
      print(record);
      return record;
    } catch (e) {
      print(e);
      throw e;
    }
  }
}

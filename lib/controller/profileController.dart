import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:pocketbase/pocketbase.dart';

class ProfileController extends GetxController {
  final pb = PocketBase('https://pocket.bjrcode.com');
  Future<Map<String, dynamic>> getUser() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString("token");
    final UID = prefs.getString("UID");
    final headers = {
      'Authorization': 'Bearer $token',
    };
    final record = await pb.collection('usersValleSur').getOne('$UID',
        expand: 'relField1,relField2.subRelField', headers: headers);
    return record.data;
  }

  void logout() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString("UID", "");
    prefs.setString("token", "");
    prefs.setBool("isLoggedIn", false);

    pb.authStore.clear();
  }
}

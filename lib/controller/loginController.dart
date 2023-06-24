import 'package:get/get.dart';
import 'package:pocketbase/pocketbase.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

class LoginController extends GetxController {
  final pb = PocketBase('https://pocket.bjrcode.com');
  Future<RecordAuth> intentLogin(
      {required Map<String, dynamic> intentCredentials}) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final authData = await pb.collection('usersValleSur').authWithPassword(
          intentCredentials["email"], intentCredentials["password"]);
      prefs.setString("UID", authData.record!.id);
      prefs.setString("token", authData.token);
      prefs.setBool("isLoggedIn", true);
      return authData;
    } catch (e) {
      throw e;
    }
  }

  Future<void> intentLoginwithGoogle() async {
    try {
      final authData =
          await pb.collection('usersValleSur').authWithOAuth2('google', (url) async {
        print(url);
        await launchUrl(url, mode: LaunchMode.externalApplication).then((value) {

        Get.toNamed("/home");
        });
      });
    } catch (e) {
      throw e;
    }
  }

  Future<void> intentLoginwithFacebook() async {
    try {
      final authData =
          await pb.collection('users').authWithOAuth2('facebook', (url) async {
        await launchUrl(url,mode: LaunchMode.externalNonBrowserApplication);
      });
      
    } catch (e) {
      rethrow;
    }
  }
}

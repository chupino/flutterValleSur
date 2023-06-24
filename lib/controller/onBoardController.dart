import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnBoardController extends GetxController{

  Future<void> finishOnBoard()async{
    final prefs=await SharedPreferences.getInstance();
    prefs.setBool("onBoardComplete", true);
    Get.toNamed("/welcome");
  }
}
import 'package:shared_preferences/shared_preferences.dart';

class RouteController {
  static Future<String> getInitialRoute()async{
    final prefs=await SharedPreferences.getInstance();
    bool isLoggedIn=prefs.getBool("isLoggedIn")??false;
    bool onBoardComplete=prefs.getBool("onBoardComplete")??false;

    if(onBoardComplete){
      if(isLoggedIn){
        return '/home';
      }else{
        return '/welcome';
      }
    }else{
      return '/';
    }
  }
}
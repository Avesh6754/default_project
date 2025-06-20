import 'package:shared_preferences/shared_preferences.dart';

class SaveStatusData {
  Future<void> setData(bool isLogin) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setBool('login',isLogin);
  }

  Future<bool> getData() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getBool('login') ?? false;
  }
}

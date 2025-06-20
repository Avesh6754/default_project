import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AuthStorageService {
  final _storage = const FlutterSecureStorage();

  Future<void> setLoginStatus(bool isLogin) async {
    await _storage.write(key: 'isLogin', value: isLogin.toString());
  }

  Future<bool> getLoginStatus() async {
    final value = await _storage.read(key: 'isLogin');
    return value == 'true';
  }

  Future<void> logout() async {
    await _storage.deleteAll();
  }
}

import 'package:default_project/core/api_config/client/api_client.dart';
import 'package:default_project/core/api_config/endpoints/endpoints.dart';
import 'package:default_project/features/login/model/login_modal.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class LoginApiRepository {
  final ApiClient apiClient;
  final flutterSecureStorage = FlutterSecureStorage();

  LoginApiRepository(this.apiClient);

  Future<bool> loginWithEmailAndPassword(LoginModal data) async {
    var response = await apiClient.request(
      RequestType.POST,
      ApiEndPoint.loginUrl,
      data: data.toJson(),
    );
    if (response['status'] == true && response['token'] != null) {
      await flutterSecureStorage.write(key: 'token', value: response['token']);
      return true;
    } else {
      return false;
    }
  }
}

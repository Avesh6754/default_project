import 'package:default_project/core/api_config/client/api_client.dart';
import 'package:default_project/core/api_config/endpoints/endpoints.dart';
import 'package:default_project/features/registration/model/registration_modal.dart';
import 'package:dio/dio.dart';

class RegistrationRepository {
  final ApiClient apiClient;

  RegistrationRepository({required this.apiClient});

  Future<bool> registrationApi(RegistrationModal data) async {
    FormData formData = FormData.fromMap({
      'firstName': data.firstName,
      'lastName': data.lastName,
      'gender': data.gender.toString(),
      'hobby': data.hobby.join(','),
      'email': data.emailId,
      'mobile': data.mobile.toString(),
      'password': data.password,
      'image': await MultipartFile.fromFile(
        data.image.path,
        filename: data.image.path.split('/').last,
      ),
    });
    var response = await apiClient.request(
      RequestType.POST,
      ApiEndPoint.signUpUrl,
      data: formData,
    );
    if (response['status'] == true && response['data'] != null) {
      return true;
    } else {
      return false;
    }
  }
}

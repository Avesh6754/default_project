import 'package:default_project/core/api_config/client/api_client.dart';
import 'package:default_project/core/api_config/endpoints/endpoints.dart';
import 'package:default_project/features/registration/model/registration_modal.dart';


class RegistrationRepository {
  final ApiClient apiClient;

  RegistrationRepository({required this.apiClient});

  Future<bool> registrationApi(RegistrationModal data) async {
    Map<String,dynamic> formData = {
      'firstName': data.firstName,
      'lastName': data.lastName,
      'gender': data.gender.toString(),
      'hobby': data.hobby.join(','),
      'email': data.emailId,
      'mobile': data.mobile.toString(),
      'password': data.password,
      'image': [data.image.path],
    };
    var response = await apiClient.request(
      RequestType.MULTIPART_POST,
      ApiEndPoint.signUpUrl,
      multipartData: formData,
    );
    if (response['status'] == true && response['data'] != null) {
      return true;
    } else {
      return false;
    }
  }
}

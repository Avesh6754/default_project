import 'dart:developer';
import 'dart:io';

import 'package:default_project/core/repository/repositiry_api_data.dart';
import 'package:default_project/features/registration/model/registration_modal.dart';
import 'package:dio/dio.dart';

class ApiCalling {
  ApiData apiData = ApiData();

  Future<void> addUserRegistrationData({
    required String firstName,
    required String lastName,
    required String emailId,
    required double mobile,
    required int gender,
    required File image,
    required String password,
    required String confirmPassword,
    required List<String> hobbyList,
  }) async {
    RegistrationModal registrationModal = RegistrationModal(
        firstName: firstName,
        lastName: lastName,
        emailId: emailId,
        mobile: mobile,
        gender: gender,
        password: password,
        confirmPassword: confirmPassword,
        image: image);
    Response response = await apiData.sendRequest.post(
        '/public/auth/register', data: {'data':registrationModal});
    if(response.statusCode==201 || response.statusCode==200)
      {
        log("=============$response");
      }
  }
}

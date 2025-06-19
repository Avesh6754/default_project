

import 'dart:io';

import 'package:equatable/equatable.dart';

class RegistrationState extends Equatable {
  final String firstName;
  final String lastName;
  final String email;
  final double mobile;
  final String password;
  final String confirmPassword;
  final File? image;
  final int gender;
  final bool isPasswordVisible;
  final bool isConfirmPasswordVisible;
  final List<String> hobbyList;

  const RegistrationState({
    this.firstName = '',
    this.lastName = '',
    this.email = '',
    this.mobile = 0.0,
    this.password = '',
    this.confirmPassword = '',
    this.image,
    this.gender = -1,
    this.isPasswordVisible = false,
    this.isConfirmPasswordVisible = false,
    this.hobbyList = const [],
  });

  RegistrationState copyWith({
    String? firstName,
    String? lastName,
    String? email,
    double? mobile,
    String? password,
    String? confirmPassword,
    File? image,
    int? gender,
    bool? isPasswordVisible,
    bool? isConfirmPasswordVisible,
    List<String>? hobbyList,
  }) {
    return RegistrationState(
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      email: email ?? this.email,
      mobile: mobile ?? this.mobile,
      password: password ?? this.password,
      confirmPassword: confirmPassword ?? this.confirmPassword,
      image: image ?? this.image,
      gender: gender ?? this.gender,
      isPasswordVisible: isPasswordVisible ?? this.isPasswordVisible,
      isConfirmPasswordVisible: isConfirmPasswordVisible ?? this.isConfirmPasswordVisible,
      hobbyList: hobbyList ?? this.hobbyList,
    );
  }

  @override
  List<Object?> get props => [
    firstName,
    lastName,
    email,
    mobile,
    password,
    confirmPassword,
    image,
    gender,
    isPasswordVisible,
    isConfirmPasswordVisible,
    hobbyList,
  ];
}

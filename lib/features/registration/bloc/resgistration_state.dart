import 'dart:io';

import 'package:equatable/equatable.dart';

class RegistrationState extends Equatable {
  final File? image;
  final int gender;
  final bool isPasswordVisible;
  final bool isConfirmPasswordVisible;
  final List<String> hobbyList;
  final bool isLogin;

  const RegistrationState({
    this.isLogin = false,

    this.image,
    this.gender = 1,
    this.isPasswordVisible = false,
    this.isConfirmPasswordVisible = false,
    this.hobbyList = const [],
  });

  RegistrationState copyWith({
    bool? isLogin,

    File? image,
    int? gender,
    bool? isPasswordVisible,
    bool? isConfirmPasswordVisible,
    List<String>? hobbyList,
  }) {
    return RegistrationState(
      image: image ?? this.image,
      gender: gender ?? this.gender,
      isPasswordVisible: isPasswordVisible ?? this.isPasswordVisible,
      isConfirmPasswordVisible:
          isConfirmPasswordVisible ?? this.isConfirmPasswordVisible,
      hobbyList: hobbyList ?? this.hobbyList,
    );
  }

  @override
  List<Object?> get props => [
    image,
    gender,
    isPasswordVisible,
    isConfirmPasswordVisible,
    hobbyList,
    isLogin,
  ];
}

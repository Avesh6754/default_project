import 'dart:io';

class RegistrationModal {
  final String firstName;
  final String lastName;
  final String emailId;
  final double mobile;
  final int gender;
  final String password;
  final String confirmPassword;
  final File image;

  RegistrationModal({
    required this.firstName,
    required this.lastName,
    required this.emailId,
    required this.mobile,
    required this.gender,
    required this.password,
    required this.confirmPassword,
    required this.image,
  });

  factory RegistrationModal.fromMap(Map m1) {
    return RegistrationModal(
      firstName: m1['firstName'],
      lastName: m1['lastName'],
      emailId: m1['email'],
      mobile: m1['mobile'],
      gender: m1['gender'],
      password: m1['password'],
      confirmPassword: m1['confirmPassword'],
      image: m1['image'],
    );
  }
}

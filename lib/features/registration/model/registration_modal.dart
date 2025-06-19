import 'dart:io';

class RegistrationModal {
  final String firstName;
  final String lastName;
  final String emailId;
  final double mobile;
  final int gender;
  final String password;
  final List<String> hobby;

  final File image;

  RegistrationModal( {
    required this.hobby,
    required this.firstName,
    required this.lastName,
    required this.emailId,
    required this.mobile,
    required this.gender,
    required this.password,

    required this.image,
  });

  factory RegistrationModal.fromMap(Map m1) {
    return RegistrationModal(
      hobby: m1['hobby'],
      firstName: m1['firstName'],
      lastName: m1['lastName'],
      emailId: m1['email'],
      mobile: m1['mobile'],
      gender: m1['gender'],
      password: m1['password'],

      image: m1['image'],
    );
  }

  Map<String,dynamic> toJson()=>{
    'hobby':hobby,
    'firstName':firstName,
    'lastName':lastName,
    'email':emailId,
    'gender':gender,
    'password':password,
    'mobile':mobile,
    'image':image
  };
}

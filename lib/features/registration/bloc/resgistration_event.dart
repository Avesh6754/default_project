import 'package:default_project/features/registration/model/registration_modal.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

@immutable
abstract class RegistrationEvent extends Equatable {
  const RegistrationEvent();

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class PasswordVisibilityEvent extends RegistrationEvent {}



class ConfirmPasswordVisibilityEvent extends RegistrationEvent {}

class OnChangeGenderEvent extends RegistrationEvent {
  final String gender;

  const OnChangeGenderEvent(this.gender);

  @override
  // TODO: implement props
  List<Object?> get props => [gender];
}

class OnChangeHobbyEvent extends RegistrationEvent {
  final String hobby;

  const OnChangeHobbyEvent(this.hobby);

  @override
  // TODO: implement props
  List<Object?> get props => [hobby];
}

class ImagePickerEvent extends RegistrationEvent {
  const ImagePickerEvent();

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class SignUpButtonEvent extends RegistrationEvent {
  RegistrationModal registrationModal;

  SignUpButtonEvent(this.registrationModal);

  @override
  // TODO: implement props
  List<Object?> get props => [registrationModal];
}

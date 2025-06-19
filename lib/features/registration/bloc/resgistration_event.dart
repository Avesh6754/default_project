import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

@immutable
abstract class RegistrationEvent extends Equatable {
  const RegistrationEvent();

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class PasswordVisibilityEvent extends RegistrationEvent {
  final bool isVisiblePassword;

  const PasswordVisibilityEvent(this.isVisiblePassword);

  @override
  // TODO: implement props
  List<Object?> get props => [isVisiblePassword];
}

class ConfirmPasswordVisibilityEvent extends RegistrationEvent {
  final bool isVisibleConfirmPassword;

  const ConfirmPasswordVisibilityEvent(this.isVisibleConfirmPassword);

  @override
  // TODO: implement props
  List<Object?> get props => [isVisibleConfirmPassword];
}

class OnChangeFirstNameEvent extends RegistrationEvent {
  final String firstName;

  const OnChangeFirstNameEvent(this.firstName);

  @override
  // TODO: implement props
  List<Object?> get props => [firstName];
}

class OnChangeLastNameEvent extends RegistrationEvent {
  final String lastName;

  const OnChangeLastNameEvent(this.lastName);

  @override
  // TODO: implement props
  List<Object?> get props => [lastName];
}

class OnChangeEmailIdEvent extends RegistrationEvent {
  final String email;

  const OnChangeEmailIdEvent(this.email);

  @override
  // TODO: implement props
  List<Object?> get props => [email];
}

class OnChangeMobileEvent extends RegistrationEvent {
  final int mobile;

  const OnChangeMobileEvent(this.mobile);

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

class OnChangeGenderEvent extends RegistrationEvent {
  final int gender;

  const OnChangeGenderEvent(this.gender);

  @override
  // TODO: implement props
  List<Object?> get props => [gender];
}

class OnChangePasswordEvent extends RegistrationEvent {
  final String password;

  const OnChangePasswordEvent(this.password);

  @override
  // TODO: implement props
  List<Object?> get props => [password];
}

class OnChangeConfirmPasswordEvent extends RegistrationEvent {
  final String confirmPassword;

  const OnChangeConfirmPasswordEvent(this.confirmPassword);

  @override
  // TODO: implement props
  List<Object?> get props => [confirmPassword];
}

class OnChangeHobbyEvent extends RegistrationEvent{
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
  const SignUpButtonEvent();

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

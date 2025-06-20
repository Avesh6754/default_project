import 'package:default_project/features/login/model/login_modal.dart';
import 'package:equatable/equatable.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object?> get props => [];
}

class LoginInButtonEvent extends LoginEvent {
  LoginModal loginModal;

   LoginInButtonEvent({required this.loginModal});

  @override
  List<Object?> get props => [loginModal];
}

class LoginPasswordVisibilityEvent extends LoginEvent {}

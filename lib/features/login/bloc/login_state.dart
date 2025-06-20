import 'package:equatable/equatable.dart';



class LoginState extends Equatable {
  final bool isPasswordVisible;
  final bool status;

  const LoginState({
    this.isPasswordVisible = false,
    this.status = false,
  });

  LoginState copyWith({bool? isPasswordVisible, bool? status}) {
    return LoginState(
      status: status ?? this.status,
      isPasswordVisible:isPasswordVisible?? this.isPasswordVisible,
    );
  }

  @override
  List<Object?> get props => [status,isPasswordVisible];
}

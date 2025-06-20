import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:default_project/core/repository/login_api_repository.dart';
import 'package:default_project/core/routes/app_routes.dart';
import 'package:default_project/core/storage/secures_status_login.dart';
import 'package:default_project/core/utils/navigater_service.dart';

import '../../../core/storage/secures_storage.dart';
import 'login_event.dart';
import 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginApiRepository loginApiRepository;
  final authStorageService = AuthStorageService() ;
  final saveInStorage=SaveStatusData();

  LoginBloc(this.loginApiRepository) : super(LoginState()) {
    on<LoginPasswordVisibilityEvent>(_loginPasswordVisibilityEvent);
    on<LoginInButtonEvent>(_loginInButtonEvent);
  }

  FutureOr<void> _loginPasswordVisibilityEvent(
    LoginPasswordVisibilityEvent event,
    Emitter<LoginState> emit,
  ) {
    emit(state.copyWith(isPasswordVisible: !state.isPasswordVisible));
  }

  Future<void> _loginInButtonEvent(
    LoginInButtonEvent event,
    Emitter<LoginState> emit,
  ) async {
    bool status = await loginApiRepository.loginWithEmailAndPassword(
      event.loginModal,
    );
    saveInStorage.setData(status);
    emit(state.copyWith(status: status));
  }
}

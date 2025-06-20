import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:default_project/core/storage/secures_status_login.dart';
import 'package:default_project/core/storage/secures_storage.dart';
import 'package:equatable/equatable.dart';

part 'splash_event.dart';

part 'splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  final AuthStorageService authStorageService;
  final saveInStorage=SaveStatusData();

  SplashBloc(this.authStorageService) : super(SplashState()) {
    on<CheckIsLoginAurNot>(_checkIsLoginAurNot);
  }

  Future<void> _checkIsLoginAurNot(
    CheckIsLoginAurNot event,
    Emitter<SplashState> emit,
  ) async {
    emit(state.copyWith(currentState: SplashStatus.loading));
    await Future.delayed(Duration(seconds: 3));
    bool isLogin=await saveInStorage.getData();
    print("isLogin\\\\\\\\\\\\\\$isLogin");
    if(isLogin==true)
      {
        emit(state.copyWith(currentState: SplashStatus.success));
      }
    else{
      emit(state.copyWith(currentState: SplashStatus.fail));
    }

  }
}

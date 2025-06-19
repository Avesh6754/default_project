import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:default_project/features/registration/bloc/resgistration_event.dart';
import 'package:default_project/features/registration/bloc/resgistration_state.dart';


class RegistrationBloc extends Bloc<RegistrationEvent, RegistrationState> {
  RegistrationBloc() : super(RegistrationState()) {
   on<OnChangeFirstNameEvent>(_onChangeFirstName);
   on<OnChangeLastNameEvent>(_onChangeLastNameEvent);

  }

  FutureOr<void> _onChangeFirstName(OnChangeFirstNameEvent event, Emitter<RegistrationState> emit) {
    emit(state.copyWith(firstName: event.firstName));
  }

  FutureOr<void> _onChangeLastNameEvent(OnChangeLastNameEvent event, Emitter<RegistrationState> emit) {
    emit(state.copyWith(lastName: event.lastName));
  }
}

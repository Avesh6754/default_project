import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:default_project/core/repository/repositiry_api_data.dart';

import 'package:default_project/core/utils/image_picker_section.dart';
import 'package:default_project/features/registration/bloc/resgistration_event.dart';
import 'package:default_project/features/registration/bloc/resgistration_state.dart';

import 'package:logger/logger.dart';

class RegistrationBloc extends Bloc<RegistrationEvent, RegistrationState> {
  final ProfileImage profileImage;
  final RegistrationRepository registrationRepository;

  RegistrationBloc(this.profileImage, this.registrationRepository)
    : super(RegistrationState()) {
    on<OnChangeGenderEvent>(_onChangeGenderEvent);
    on<PasswordVisibilityEvent>(_passwordVisibilityEvent);
    on<ConfirmPasswordVisibilityEvent>(_confirmPasswordVisibilityEvent);
    on<OnChangeHobbyEvent>(_onChangeHobbyEvent);
    on<ImagePickerEvent>(_imagePickerEvent);
    on<SignUpButtonEvent>(_signUpButtonEvent);
  }

  FutureOr<void> _onChangeGenderEvent(
    OnChangeGenderEvent event,
    Emitter<RegistrationState> emit,
  ) {
    int gender = (event.gender == 'Male') ? 1 : 2;
    emit(state.copyWith(gender: gender));
  }

  FutureOr<void> _passwordVisibilityEvent(
    PasswordVisibilityEvent event,
    Emitter<RegistrationState> emit,
  ) {
    emit(state.copyWith(isPasswordVisible: !state.isPasswordVisible));
  }

  FutureOr<void> _confirmPasswordVisibilityEvent(
    ConfirmPasswordVisibilityEvent event,
    Emitter<RegistrationState> emit,
  ) {
    emit(
      state.copyWith(isConfirmPasswordVisible: !state.isConfirmPasswordVisible),
    );
  }

  FutureOr<void> _onChangeHobbyEvent(
    OnChangeHobbyEvent event,
    Emitter<RegistrationState> emit,
  ) {
    List<String> currentHobbyList = List<String>.from(state.hobbyList);
    ;
    if (currentHobbyList.contains(event.hobby)) {
      currentHobbyList.remove(event.hobby);
    } else {
      currentHobbyList.add(event.hobby);
    }
    emit(state.copyWith(hobbyList: currentHobbyList));
  }

  Future<void> _imagePickerEvent(
    ImagePickerEvent event,
    Emitter<RegistrationState> emit,
  ) async {
    File? image = await profileImage.pickImageFromGallery();
    if (image != null) {
      emit(state.copyWith(image: image));
    }
  }

  Future<void> _signUpButtonEvent(
    SignUpButtonEvent event,
    Emitter<RegistrationState> emit,
  ) async {
    Logger logger = Logger(printer: PrettyPrinter());
    logger.d("${event.registrationModal.password}");
    bool isLogin = await registrationRepository.registrationApi(
      event.registrationModal,
    );
    logger.d("${isLogin}");
    emit(state.copyWith(isLogin: isLogin));
  }
}

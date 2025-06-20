import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:default_project/core/api_config/client/api_client.dart';

import 'package:default_project/core/repository/create_product_api_repository.dart';
import 'package:default_project/core/repository/home_product_api_repository.dart';

import 'package:default_project/core/utils/image_picker_section.dart';
import 'package:default_project/features/addproperty/model/add_property_model.dart';
import 'package:default_project/features/home/bloc/home_bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';

part 'addproperty_event.dart';

part 'addproperty_state.dart';

class AddPropertyBloc extends Bloc<AddPropertyEvent, AddPropertyState> {
  final CreateProductApiRepository createProductApiRepository;
  final multiImagePicker = ProfileImage();
  final homeBloc = HomeBloc(HomeProductRepository(ApiClient()));

  AddPropertyBloc(this.createProductApiRepository) : super(AddPropertyState()) {
    on<ClickSubmitButtonAddProduct>(_clickSubmitButtonAddProduct);
    on<MultiImagePickerFromGallery>(_multiImagePickerFromGallery);
    on<ClearAllPickImage>(_clearAllPickImage);
  }

  Future<void> _clickSubmitButtonAddProduct(
    ClickSubmitButtonAddProduct event,
    Emitter<AddPropertyState> emit,
  ) async {
    bool isStatus = await createProductApiRepository.getAllProduct(
      event.addProductModal,
    );

    if (isStatus) {
      emit(
        state.copyWith(
          errorMessage: "Product Add Successful ! ",
          status: Current.success,
        ),
      );
    } else {
      emit(
        state.copyWith(
          errorMessage: "Product Add Fail ! ",
          status: Current.fail,
        ),
      );
    }
  }

  Future<void> _multiImagePickerFromGallery(
    MultiImagePickerFromGallery event,
    Emitter<AddPropertyState> emit,
  ) async {
    List<String> imagePaths = List<String>.from(state.image ?? []);
    List<XFile?> file = await multiImagePicker.multiImagePicker();

    print("///////////////////   [ $file ]");

    if (file.isNotEmpty) {
      for (var i in file) {
        final data = i!.path.toString();
        imagePaths.add(data);
      }

      print("///////////////////   [ $imagePaths ]");
      emit(state.copyWith(image: imagePaths));
    }
  }

  FutureOr<void> _clearAllPickImage(
    ClearAllPickImage event,
    Emitter<AddPropertyState> emit,
  ) {
    emit(state.copyWith(isClear: !state.isClear));
    if (state.isClear) {
      emit(state.copyWith(image: []));
    }
  }
}

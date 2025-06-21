import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:default_project/core/api_config/client/api_client.dart';

import 'package:default_project/core/repository/create_product_api_repository.dart';
import 'package:default_project/core/repository/home_product_api_repository.dart';


import 'package:default_project/core/repository/update_api_repository.dart';
import 'package:default_project/core/storage/secures_storage.dart';

import 'package:default_project/core/utils/image_picker_section.dart';
import 'package:default_project/features/addproperty/model/add_property_model.dart';

import 'package:default_project/features/home/model/product_model.dart';
import 'package:equatable/equatable.dart';

import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';

part 'addproperty_event.dart';

part 'addproperty_state.dart';

class AddPropertyBloc extends Bloc<AddPropertyEvent, AddPropertyState> {
  final CreateProductApiRepository createProductApiRepository;
  final UpdateRepository updateRepository;
  final HomeProductRepository homeProductRepository=HomeProductRepository(ApiClient());
  final multiImagePicker = ProfileImage();

  final appLoaclStorage = AuthStorageService();

  AddPropertyBloc(this.createProductApiRepository, this.updateRepository)
    : super(AddPropertyState()) {
    on<ClickSubmitButtonAddProduct>(_clickSubmitButtonAddProduct);
    on<MultiImagePickerFromGallery>(_multiImagePickerFromGallery);
    on<ClearAllPickImage>(_clearAllPickImage);
    on<ClickSubmitButtonUpdateProduct>(_clickSubmitButtonUpdateProduct);
  }

  Future<void> _clickSubmitButtonAddProduct(
    ClickSubmitButtonAddProduct event,
    Emitter<AddPropertyState> emit,
  ) async {

    bool isStatus = await createProductApiRepository.getAllProduct(
      event.addProductModal,
    );
    print("///////////////////   [ ${event.addProductModal.title} ]");
    if (isStatus) {
      await homeProductRepository.fetchProductData('house');
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
      if (file != null) {
        List<String> savedImagePaths = await appLoaclStorage
            .saveAllImagesPermanently(imagePaths);

        emit(state.copyWith(image: imagePaths));
      }
      print("///////////////////   [ $imagePaths ]");
    }
  }

  FutureOr<void> _clearAllPickImage(
    ClearAllPickImage event,
    Emitter<AddPropertyState> emit,
  ) {
    emit(state.copyWith(image: []));
  }

  Future<void> _clickSubmitButtonUpdateProduct(
    ClickSubmitButtonUpdateProduct event,
    Emitter<AddPropertyState> emit,
  ) async {
    print("///////////////////   [ ${event.addProductModal.title} ]");
    print("///////////////////   [ ${event.productId} ]");

    final ProductModel data = await updateRepository.updateProductData(
      event.productId,
      event.addProductModal,
    );

    if (data != null) {
      await homeProductRepository.fetchProductData('house');
      emit(
        state.copyWith(
          errorMessage: "Product Update Successful ! ",
          status: Current.success,
        ),
      );
    } else {
      emit(
        state.copyWith(
          errorMessage: "Product Update Fail ! ",
          status: Current.fail,
        ),
      );
    }
  }
}

import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:default_project/core/api_config/client/api_client.dart';
import 'package:default_project/core/repository/delete_api_repository.dart';
import 'package:default_project/core/repository/details_api.dart';
import 'package:default_project/core/repository/home_product_api_repository.dart';
import 'package:default_project/features/home/model/product_model.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../../core/utils/status.dart';

part 'home_event.dart';

part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final HomeProductRepository homeProductRepository;
  final details = DetailsApi(ApiClient());
  final deleteProduct = DeleteApiRepository(ApiClient());
  final repository = HomeProductRepository(ApiClient());

  HomeBloc(this.homeProductRepository) : super(HomeState()) {
    on<InitialiseEvent>(_initialiseEvent);
    // on<ClickDeletedButtonProductId>(_clickDeletedButtonProductId);
    on<ClickDeletedButtonProductId>((event, emit) async {
      emit(state.copyWith(currentStatus: Status.loading));
      final isDeleted = await deleteProduct.deleteApi(event.id);

      if (isDeleted) {
        final updatedList = await repository.fetchProductData(event.type);
        emit(
          state.copyWith(
            currentStatus: Status.success,
            productList: updatedList,
          ),
        );
      } else {
        emit(state.copyWith(currentStatus: Status.error));
      }
    });
  }

  Future<void> _initialiseEvent(
    InitialiseEvent event,
    Emitter<HomeState> emit,
  ) async {
    emit(state.copyWith(currentStatus: Status.loading));
    final data = await homeProductRepository.fetchProductData(event.type);
    if (data == null) {
      emit(
        state.copyWith(currentStatus: Status.loading, errorMessage: 'Loading'),
      );
    } else if (data != null) {
      emit(state.copyWith(currentStatus: Status.success, productList: data));
    } else {
      emit(
        state.copyWith(
          currentStatus: Status.error,
          errorMessage: 'Get Api request Fail ',
        ),
      );
    }
  }
  //
  // Future<void> _clickDeletedButtonProductId(ClickDeletedButtonProductId event, Emitter<HomeState> emit) async {
  //   bool status = await deleteProduct.deleteApi(event.id);
  //   if(status==true)
  //     {
  //       emit(state.copyWith(errorMessage: 'Product Deleted Successfully', currentStatus: Status.success));
  //     }
  //   else
  //     {
  //       emit(state.copyWith(errorMessage: 'Product Deleted Failed', currentStatus: Status.error));
  //     }
  // }
}

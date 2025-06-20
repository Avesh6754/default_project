import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:default_project/core/api_config/client/api_client.dart';
import 'package:default_project/core/repository/details_api.dart';
import 'package:default_project/core/repository/home_product_api_repository.dart';
import 'package:default_project/features/home/model/product_model.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'home_event.dart';

part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final HomeProductRepository homeProductRepository;
final details =DetailsApi(ApiClient());
  HomeBloc(this.homeProductRepository) : super(HomeState()) {
    on<InitialiseEvent>(_initialiseEvent);

  }

  Future<void> _initialiseEvent(
    InitialiseEvent event,
    Emitter<HomeState> emit,
  ) async {
    final  data = await homeProductRepository.fetchProductData();
    if (data==null) {
      emit(
        state.copyWith(currentStatus: Status.loading, errorMessage: 'Loading'),
      );
    } else if (data!=null) {
      emit(
        state.copyWith(
          currentStatus: Status.success,
          productList: data,
        ),
      );
    } else {
      emit(
        state.copyWith(
          currentStatus: Status.fail,
          errorMessage: 'Get Api request Fail ',
        ),
      );
    }
  }
}

import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:default_project/core/repository/delete_api_repository.dart';
import 'package:default_project/core/repository/details_api.dart';
import 'package:default_project/features/detail/model/details_modal.dart';
import 'package:default_project/features/home/model/product_model.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../../core/utils/status.dart';

part 'details_event.dart';
part 'details_state.dart';

class DetailsBloc extends Bloc<DetailsEvent, DetailsState> {
final DetailsApi detailsApi;
  DetailsBloc(this.detailsApi) : super(DetailsState()) {
   on<InitialisationEvent>(_initialisationEvent);
   on<ChangeImageIndexEvent>(_changeImageIndexEvent);
  }

  Future<void> _initialisationEvent(InitialisationEvent event, Emitter<DetailsState> emit) async {
    emit(
      state.copyWith(
        currentStatus: Status.loading
      ),
    );
    final DetailsSelectedModel response= await detailsApi.getSelectedIndex(event.id);
    print("////////////////////////////////${response.images}");
    if (response != null) {
      emit(
        state.copyWith(
          productDetailsModel: response,
              errorMessage: "Product Details Fetch Successful ! ",
          currentStatus: Status.success,
        ),
      );
    } else {
      emit(
        state.copyWith(
        errorMessage: "Product Details Fetch Fail ! ",
          currentStatus: Status.error,
        ),
      );
    }
  }

  FutureOr<void> _changeImageIndexEvent(ChangeImageIndexEvent event, Emitter<DetailsState> emit) {
    emit(state.copyWith(currentIndex: event.index));
  }
}

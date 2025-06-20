import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:default_project/features/home/model/product_model.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'details_event.dart';
part 'details_state.dart';

class DetailsBloc extends Bloc<DetailsEvent, DetailsState> {

  DetailsBloc() : super(DetailsState()) {
   on<InitialisationEvent>(_initialisationEvent);
  }

  FutureOr<void> _initialisationEvent(InitialisationEvent event, Emitter<DetailsState> emit) {

  }
}

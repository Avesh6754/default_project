import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'resgistration_event.dart';
part 'resgistration_state.dart';

class ResgistrationBloc extends Bloc<ResgistrationEvent, ResgistrationState> {
  ResgistrationBloc() : super(ResgistrationInitial()) {
    on<ResgistrationEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}

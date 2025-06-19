import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'addproperty_event.dart';
part 'addproperty_state.dart';

class AddpropertyBloc extends Bloc<AddpropertyEvent, AddpropertyState> {
  AddpropertyBloc() : super(AddpropertyInitial()) {
    on<AddpropertyEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}

part of 'details_bloc.dart';

@immutable
abstract class DetailsEvent extends Equatable{
  const DetailsEvent();
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

class InitialisationEvent extends DetailsEvent{
final String id;

  const InitialisationEvent(this.id);
  @override
  List<Object?> get props => [id];
}

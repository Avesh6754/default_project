part of 'home_bloc.dart';

@immutable
abstract class HomeEvent extends Equatable{
  const HomeEvent();
  @override
  List<Object?> get props => [];

}

class InitialiseEvent extends HomeEvent{
  final String type;

  const InitialiseEvent(this.type);
  @override
  List<Object?> get props => [type];

}

class ClickDeletedButtonProductId extends HomeEvent{
 final  String id;
 final String type;

  const ClickDeletedButtonProductId(this.id,this.type);
  @override
  List<Object?> get props => [id];
}



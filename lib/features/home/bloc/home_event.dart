part of 'home_bloc.dart';

@immutable
abstract class HomeEvent extends Equatable{
  const HomeEvent();
  @override
  List<Object?> get props => [];

}

class InitialiseEvent extends HomeEvent{

}

class SelectedProductId extends HomeEvent{
 final  String id;

  const SelectedProductId(this.id);
  @override
  List<Object?> get props => [id];
}

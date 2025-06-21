part of 'home_bloc.dart';

@immutable

enum Status { loading, success, error }
class HomeState extends Equatable {
  final String errorMessage;
  final Status currentStatus;
  final ProductListResponse? productList;

  const HomeState({
    this.errorMessage = '',
    this.currentStatus = Status.loading,
    this.productList,

  });

  HomeState copyWith({
    String? errorMessage,
    Status? currentStatus,
    ProductListResponse? productList,
  }) {
    return HomeState(

      errorMessage: errorMessage ?? this.errorMessage,
      currentStatus: currentStatus ?? this.currentStatus,
      productList: productList ?? this.productList,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [errorMessage, currentStatus, productList];
}

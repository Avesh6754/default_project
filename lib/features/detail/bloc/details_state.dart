part of 'details_bloc.dart';

@immutable
class DetailsState extends Equatable {
  @override
  final DetailsSelectedModel? productDetailsModel;
  final Status currentStatus;
  final String errorMessage;
  final int currentIndex;

  const DetailsState({
    this.productDetailsModel,
    this.errorMessage = " ",
    this.currentIndex = 0,
    this.currentStatus = Status.init,
  });

  DetailsState copyWith({
    DetailsSelectedModel? productDetailsModel,
    String? errorMessage,
    int? currentIndex,
    Status? currentStatus,
  }) {
    return DetailsState(
      productDetailsModel: productDetailsModel ?? this.productDetailsModel,
      errorMessage: errorMessage ?? this.errorMessage,
      currentIndex: currentIndex ?? this.currentIndex,
      currentStatus: currentStatus ?? this.currentStatus,
    );
  }

  @override
  List<Object?> get props => [productDetailsModel, errorMessage,currentIndex,currentStatus];
}

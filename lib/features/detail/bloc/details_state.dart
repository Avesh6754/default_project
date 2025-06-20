part of 'details_bloc.dart';

@immutable
class DetailsState extends Equatable {
  @override
  final ProductModel? productModel;

  const DetailsState({this.productModel});

  DetailsState copyWith({ProductModel? productModel}) {
    return DetailsState(productModel: productModel ?? this.productModel);
  }

  List<Object?> get props => [productModel];
}

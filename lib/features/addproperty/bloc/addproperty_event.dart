part of 'addproperty_bloc.dart';

@immutable
abstract class AddPropertyEvent extends Equatable{
  const AddPropertyEvent();
  @override
  List<Object?> get props => [];
}


class ClickSubmitButtonAddProduct extends AddPropertyEvent{
  final AddProductModal addProductModal;
  const ClickSubmitButtonAddProduct({required this.addProductModal});
  @override
  List<Object?> get props => [addProductModal];
}
class ClickSubmitButtonUpdateProduct extends AddPropertyEvent{
  final AddProductModal addProductModal;
  final String productId;
  const ClickSubmitButtonUpdateProduct({required this.addProductModal,required this.productId});
  @override
  List<Object?> get props => [addProductModal,productId];
}

class MultiImagePickerFromGallery extends AddPropertyEvent{}
class ClearAllPickImage extends AddPropertyEvent{}

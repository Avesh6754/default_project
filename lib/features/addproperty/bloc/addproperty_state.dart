part of 'addproperty_bloc.dart';

@immutable
enum Current { success, fail, init }

class AddPropertyState extends Equatable {
  final String errorMessage;
  final Current status;
  final List<String> image;
  final bool isClear;

  const AddPropertyState({
    this.isClear = false,
    this.image = const <String>[],
    this.errorMessage = '',
    this.status = Current.init,
  });

  AddPropertyState copyWith({
    String? errorMessage,
    Current? status,
    List<String>? image,
    bool? isClear,
  }) {
    return AddPropertyState(
      image: image ?? this.image,
      status: status ?? this.status,
      isClear: isClear ?? this.isClear,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [errorMessage, status, image, isClear];
}

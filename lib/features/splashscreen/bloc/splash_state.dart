part of 'splash_bloc.dart';

enum SplashStatus {loading,success,init,fail}
class SplashState extends Equatable{
  final bool isLogin;
  final SplashStatus currentState;

  SplashState({this.isLogin=false,this.currentState=SplashStatus.init});
  SplashState copyWith({bool? isLogin,SplashStatus? currentState})
  {
    return SplashState(
      isLogin: isLogin?? this.isLogin,
          currentState: currentState??this.currentState

    );
  }
  @override

  List<Object?> get props => [isLogin,currentState];

}

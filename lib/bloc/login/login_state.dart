part of 'login_bloc.dart';

abstract class LoginState extends Equatable {
  const LoginState();
}

class LoginUnInitiated extends LoginState {
  @override
  List<Object> get props => [];
}

class LoginInitiated extends LoginState {
  @override
  List<Object> get props => [];
}

// ignore: must_be_immutable
class LoginSuccessful extends LoginState {
  String message;

  LoginSuccessful(this.message);

  @override
  List<Object> get props => [message];
}

// ignore: must_be_immutable
class LoginFailed extends LoginState {
  String errorMessage, errorCode;

  LoginFailed(this.errorCode, this.errorMessage);

  @override
  List<Object> get props => [errorCode, errorMessage];
}

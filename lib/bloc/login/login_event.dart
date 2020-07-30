part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();
}

// ignore: must_be_immutable
class LoginAuthentication extends LoginEvent {
  String email, password;

  LoginAuthentication(this.email, this.password);

  @override
  List<Object> get props => [email, password];
}
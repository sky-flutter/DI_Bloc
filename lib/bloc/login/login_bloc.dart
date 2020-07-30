import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dependency_injection/data/entities/login_model.dart';
import 'package:dependency_injection/data/repo/remote_repo.dart';
import 'package:dependency_injection/di/inject.dart';
import 'package:equatable/equatable.dart';

part 'login_event.dart';

part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginUnInitiated());

  @override
  Stream<LoginState> mapEventToState(
    LoginEvent event,
  ) async* {
    if (event is LoginAuthentication) {
      yield* doLogin(event);
    }
  }

  Stream<LoginState> doLogin(event) async* {
    yield LoginInitiated();
    RemoteRepo loginRepo = getIt.get<RemoteRepo>(instanceName: "remote_repo");
    LoginModel loginModel = await loginRepo.doLogin(
        (event as LoginAuthentication).email,
        (event as LoginAuthentication).password,
        "Sample Token");
    if (loginModel.success && loginModel.statusCode == 200) {
      yield LoginSuccessful(loginModel.message);
    } else {
      yield LoginFailed(loginModel.statusCode.toString(), loginModel.message);
    }
  }
}

import 'package:dependency_injection/data/entities/login_model.dart';
import 'package:dependency_injection/di/inject.dart';
import 'package:dependency_injection/services/restclient.dart';

class RemoteRepo {
  Future<LoginModel> doLogin(
      String email, String password, String token) async {
    RestClient restClient = getIt.get(instanceName: "rest_client");
    return await restClient.doLogin(email, password, token);
  }
}

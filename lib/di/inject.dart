import 'package:dependency_injection/data/repo/remote_repo.dart';
import 'package:dependency_injection/services/restclient.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';

GetIt getIt = GetIt.instance;
Logger logger = Logger(printer: PrettyPrinter());

setUpInjection() {
  getIt.registerLazySingleton<RestClient>(() => RestClient(setUpApiClient()),
      instanceName: "rest_client");
  getIt.registerLazySingleton<RemoteRepo>(() => RemoteRepo(),
      instanceName: "remote_repo");
}

setUpApiClient() {
  Dio dio = Dio();
  dio.interceptors.add(InterceptorsWrapper(onRequest: (request) async {
    logger
        .d("Request : URL : ${request.uri.toString()} DATA : ${request.data}");
  }, onResponse: (response) async {
    logger.d("Response : ${response.data}");
  }, onError: (error) async {
    logger.d("Error : ${error.error}");
  }));
  return dio;
}

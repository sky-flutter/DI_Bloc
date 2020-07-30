import 'package:dependency_injection/data/entities/login_model.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

import 'api_constant.dart';

part "restclient.g.dart";

@RestApi(baseUrl: ApiConstant.API_URL)
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @POST("login.php")
  @FormUrlEncoded()
  Future<LoginModel> doLogin(@Field("mobile_number") String mobileNumber,
      @Field("password") String password, @Field("token") String token);
}

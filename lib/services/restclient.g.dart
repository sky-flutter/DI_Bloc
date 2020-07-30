// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'restclient.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _RestClient implements RestClient {
  _RestClient(this._dio, {this.baseUrl}) {
    ArgumentError.checkNotNull(_dio, '_dio');
    this.baseUrl ??= 'http://arnikafashionstore.com/shreeji/';
  }

  final Dio _dio;

  String baseUrl;

  @override
  doLogin(mobileNumber, password, token) async {
    ArgumentError.checkNotNull(mobileNumber, 'mobile_number');
    ArgumentError.checkNotNull(password, 'password');
    ArgumentError.checkNotNull(token, 'token');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = {
      'mobile_number': mobileNumber,
      'password': password,
      'token': token
    };
    final Response<Map<String, dynamic>> _result = await _dio.request(
        'login.php',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            contentType: 'application/x-www-form-urlencoded',
            baseUrl: baseUrl),
        data: _data);
    final value = LoginModel.fromJson(_result.data);
    return value;
  }
}

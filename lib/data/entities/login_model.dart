import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class LoginModel {
  String userId;
  String name;
  String mobileNumber;
  int isAdmin;
  String password, profilePic, appVersionCode;

  int statusCode;
  String message;
  bool success;

  LoginModel(this.statusCode, this.message, this.success,
      {this.userId,
        this.name,
        this.mobileNumber,
        this.profilePic,
        this.isAdmin,
        this.appVersionCode});

  factory LoginModel.fromJson(Map<String, dynamic> data) {
    var statusCode = data["status_code"];
    var message = data["message"];
    var success = data["success"];
    if (data.containsKey('data') && data['data'] != null) {
      return LoginModel(statusCode, message, success,
          userId: data.containsKey('data') ? data['data']['user_id'] : null,
          name: data.containsKey('data') ? data['data']['name'] : null,
          mobileNumber:
          (data.containsKey('data')) ? data['data']['mobile_number'] : null,
          profilePic:
          (data.containsKey('data')) ? data['data']['profile_pic'] : null,
          isAdmin: (data['data'].containsKey('is_admin') && data['data']['is_admin'] != null)
              ? int.parse(data['data']['is_admin'])
              : null,
          appVersionCode: (data.containsKey('data'))
              ? data['data']['app_version_code']
              : null);
    } else {
      return LoginModel(statusCode, message, success);
    }
  }
}

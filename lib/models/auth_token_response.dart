import 'package:city_influencers_app/models/login/login_data.dart';

class AuthTokenResponse {

  AuthTokenResponse({
    required this.code,
    required this.message,
    required this.error,
    required this.data,
  });

  int code;
  String message;
  String error;
  LoginData data;



  factory AuthTokenResponse.fromJson(Map<String, dynamic> json) => AuthTokenResponse(
    code: json["code"],
    message: json["message"],
    data: json["data"], 
    error: json['error'],
  );

  Map<String, dynamic> toJson() => {
    "code": code,
    "message": message,
    "data": data,
    "error": error
  };

}
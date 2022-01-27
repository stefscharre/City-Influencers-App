import 'package:city_influencers_app/models/login/login_data.dart';
import 'package:city_influencers_app/models/login/tokenvalidation.dart';

class TokenValidationResponse {

  TokenValidationResponse({
    required this.code,
    required this.message,
    required this.error,
    required this.data,
  });

  int code;
  String message;
  String error;
  TokenValidation data;



  factory TokenValidationResponse.fromJson(Map<String, dynamic> json) => TokenValidationResponse(
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

import 'dart:convert';

import 'city.dart';

class CityApiResponse {
  CityApiResponse({
    required this.code,
    required this.message,
    required this.data,
  });

  int code;
  String message;
  List<City> data;

  factory CityApiResponse.fromJson(Map<String, dynamic> json) => CityApiResponse(
    code: json["code"],
    message: json["message"],
    data: json["data"],
  );

  Map<String, dynamic> toJson() => {
    "code": code,
    "message": message,
    "data": data,
  };

}

import 'dart:convert';

import 'package:http/http.dart';

import 'city.dart';

class CityApiResponse {
  final int code;
  final String message;
  final List<City> data;

  CityApiResponse({required this.code, required this.message, required this.data});
  factory CityApiResponse.fromJson(Map<String, dynamic> responseData){
  var cityArray = responseData['data'] as List;
  List<City> cities = cityArray.map((e) => City.fromJson(e)).toList();

       return CityApiResponse(code: responseData['code'],message: responseData['message'],data: cities);
             
  }

}
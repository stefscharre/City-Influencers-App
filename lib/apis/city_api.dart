import 'package:city_influencers_app/models/city.dart';
import 'package:city_influencers_app/models/city_api_response.dart';
import 'package:city_influencers_app/models/influencer.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'dart:developer';
import 'dart:convert';
class CityApi{
  static Future<List<City>> fetchCities() async {
    
    final response = await http.get(Uri.parse('http://api-ci.westeurope.cloudapp.azure.com:8080/api/cities'));
    if (response.statusCode == 200) {
    final parsed = json.decode(response.body)<Map<String, dynamic>>();
log(response.toString());
    return parsed.map<CityApiResponse>((json) => CityApiResponse.fromJson(json)).toList();
  } else {
    throw Exception('Failed to load album');
  }}
  static Future<City> fetchCity(int id) async {
    final response = await http.get(Uri.parse('http://api-ci.westeurope.cloudapp.azure.com:8080/api/cities/'+id.toString()));
  

    if (response.statusCode == 200) {
      return City.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load user');
    }
  }
  }
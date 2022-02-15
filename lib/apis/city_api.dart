import 'package:city_influencers_app/models/city.dart';
import 'package:city_influencers_app/models/city_api_response.dart';
import 'package:city_influencers_app/models/influencer.dart';
import 'package:flutter/cupertino.dart';
import 'dart:developer';
import 'dart:convert';

import 'package:http/http.dart';
class CityApi{

    static Future<List<City>> fetchCities() async {
    
      Response res = await get(Uri.parse("http://api-cityinfluencers.westeurope.cloudapp.azure.com:8080/api/cities"));
      if (res.statusCode == 200) {
        //CityApiResponse body = jsonDecode(res.body);
        Map<String, dynamic> map = json.decode(res.body);

        // ignore: unused_local_variable
        List<dynamic> data = map["data"];

        List<City> cities = data.map((dynamic item) => City.fromJson(item),
        ).toList();

        return cities;

      } else {
        throw "Unable to retrieve cities.";
      }
    }
  }
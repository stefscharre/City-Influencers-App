import 'dart:io';

import 'package:city_influencers_app/models/auth_token_response.dart';
import 'package:flutter/cupertino.dart';
import 'dart:convert';

import 'package:http/http.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class InfluencerApi {
  final storage = const FlutterSecureStorage();
  Future<AuthTokenResponse> postLogin(String username, String password) async {
    final login = {
      'username': username,
      'password': password,
      'type': "influencer"
    };

    Response res = await post(
      Uri.parse("http://api-ci.westeurope.cloudapp.azure.com:8080/api/login"),
      body: login,
    );
    debugPrint(res.body);
    if (res.statusCode == 200) {
      //CityApiResponse body = jsonDecode(res.body);
      Map<String, dynamic> map = json.decode(res.body);

      AuthTokenResponse data = map["data"];
      await storage.write(key: 'token', value: data.data.token);
      return data;
    } else {
      throw "Unable to retrieve influencer.";
    }
  }

  Future<AuthTokenResponse> getInfluencer(String id) async {
    var token = await storage.read(key: 'token');
  if(token!=null){Response res = await post(
      Uri.parse(
          "http://api-ci.westeurope.cloudapp.azure.com:8080/api/influencers/" +
              id),
      headers: {
        'Authorization': token,
      },
    );
    debugPrint(res.body);
    if (res.statusCode == 200) {
      //CityApiResponse body = jsonDecode(res.body);
      Map<String, dynamic> map = json.decode(res.body);

      AuthTokenResponse data = map["data"];
      return data;
    } else {
      throw "Unable to retrieve influencer.";
    }}
    else{throw "no token";}
    
  }
}

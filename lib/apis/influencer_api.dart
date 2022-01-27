import 'dart:io';

import 'package:city_influencers_app/models/auth_token_response.dart';
import 'package:city_influencers_app/models/influencer.dart';
import 'package:city_influencers_app/models/login/token_validation_response.dart';
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
debugPrint(map.toString());
      AuthTokenResponse data = AuthTokenResponse.fromJson(map.map((model) => AuthTokenResponse.fromJson(model)));
      
      await storage.write(key: 'token', value: data.data.token);
      return data;
    } else {
      throw "Unable to retrieve influencer.";
    }
  }

  Future<Influencer?> getInfluencer() async {
    var token = await storage.read(key: 'token');
    if (token != null) {
      Response res = await post(
        Uri.parse("http://api-ci.westeurope.cloudapp.azure.com:8080/api/me"),
        headers: {
          'Authorization': token,
        },
      );
      debugPrint(res.body);
      if (res.statusCode == 200) {
        //CityApiResponse body = jsonDecode(res.body);
        Map<String, dynamic> map = json.decode(res.body);

        TokenValidationResponse data = map["data"];
        String influencerid = data.data.id;

        if (influencerid != "") {
          Response res = await post(
            Uri.parse(
                "http://api-ci.westeurope.cloudapp.azure.com:8080/api/influencers/" +
                    influencerid),
            headers: {
              'Authorization': token,
            },
          );
          debugPrint(res.body);
          if (res.statusCode == 200) {
            Map<String, dynamic> map = json.decode(res.body);

            Influencer influencer = map["data"];

            return influencer;
          } else {
            throw "Unable to retrieve influencer.";
          }
          
        }
      } else {
        throw "Unable to retrieve influencer.";
      }
    } else {
      throw "no token";
    }
    throw "no token ";
  }
}

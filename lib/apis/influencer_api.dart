import 'dart:io';

import 'package:city_influencers_app/models/auth_token_response.dart';
import 'package:city_influencers_app/models/influencer.dart';
import 'package:city_influencers_app/models/login/login_data.dart';
import 'package:city_influencers_app/models/login/token_validation_response.dart';
import 'package:city_influencers_app/models/login/tokenvalidation.dart';
import 'package:flutter/cupertino.dart';
import 'dart:convert';

import 'package:http/http.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class InfluencerApi {
  final secureStorage = new FlutterSecureStorage();

  IOSOptions _getIOSOptions() => const IOSOptions(
    accessibility: IOSAccessibility.first_unlock,
  );

  AndroidOptions _getAndroidOptions() => const AndroidOptions(
    encryptedSharedPreferences: true,
  );

  Future<LoginData> postLogin(String username, String password) async {
    final login = {
      'username': username,
      'password': password,
      'type': "influencer"
    };

    Response res = await post(
      Uri.parse("http://api-ci.westeurope.cloudapp.azure.com:8080/api/login"),
      body: login,
    );
    if (res.statusCode == 200) {
      //CityApiResponse body = jsonDecode(res.body);
      Map<String, dynamic> map = json.decode(res.body);
      debugPrint(map.toString());

      map.forEach((k, v) => debugPrint('$k: $v'));

      debugPrint("testing map value: " + map.values.toString());
      LoginData data = LoginData.fromJson(map.values.last);

      debugPrint("token: " + data.token);
      await secureStorage.write(key: 'token', value: data.token, iOptions: _getIOSOptions(), aOptions: _getAndroidOptions());
      
      return data;
    } else {
      throw "Unable to retrieve influencer.";
    }
  }

  Future<String> readSecureToken() async {

  

    String value = "";
    try {
      value = (await secureStorage.read(key: 'token', iOptions: _getIOSOptions(), aOptions: _getAndroidOptions()))??"test";
      debugPrint("value: " + value);
    } catch (e) {
      print(e);
    }

    return value;
  }

  Future<Influencer?> getInfluencer() async {

     await readSecureToken().then((String result) async {
      String token = result;

      debugPrint("secure token: " + token);

if (token != null) {

      Map<String, String> headers = {
        "Authorization": "Bearer $token",
      };
      
      Response res = await get(        
        Uri.parse("http://api-ci.westeurope.cloudapp.azure.com:8080/api/me"),
        headers: headers
      );
      if (res.statusCode == 200) {
        //CityApiResponse body = jsonDecode(res.body);
        Map<String, dynamic> map = json.decode(res.body);

        map.forEach((k, v) => debugPrint('$k: $v'));

        TokenValidation data = TokenValidation.fromJson(map["data"]);
        String influencerid = data.id;


        if (influencerid != "") {
          Response res = await get(
            Uri.parse(
                "http://api-ci.westeurope.cloudapp.azure.com:8080/api/influencers/" +
                    influencerid),
            headers: headers
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

    });
    
  }
}

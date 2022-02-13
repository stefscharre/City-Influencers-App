import 'package:city_influencers_app/models/campaign.dart';
import 'package:city_influencers_app/models/city.dart';
import 'package:city_influencers_app/models/city_api_response.dart';
import 'package:city_influencers_app/models/influencer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'dart:developer';
import 'dart:convert';

import 'package:http/http.dart';

class CampaignApi{
   final secureStorage = const FlutterSecureStorage();
  IOSOptions _getIOSOptions() => const IOSOptions(
        accessibility: IOSAccessibility.first_unlock,
      );

  AndroidOptions _getAndroidOptions() => const AndroidOptions(
        encryptedSharedPreferences: true,
      );
Future<String> readSecureToken() async {
    String value = "";
    try {
      value = (await secureStorage.read(
              key: 'token',
              iOptions: _getIOSOptions(),
              aOptions: _getAndroidOptions())) ??
          "test";
    } catch (e) {
      print(e);
    }

    return value;
  }
     Future<List<Campaign>> fetchCampaigns(){
  return readSecureToken().then((String result) async {
      try {
        String token = result;
        if (token != null) {
          Map<String, String> headers = {
            "Authorization": "Bearer $token",
          };
      Response res = await get(Uri.parse("http://api-ci.westeurope.cloudapp.azure.com:8080/api/tasks"));
      if (res.statusCode == 200) {
        //CityApiResponse body = jsonDecode(res.body);
        Map<String, dynamic> map = json.decode(res.body);

        // ignore: unused_local_variable
        List<dynamic> data = map["data"];

        List<Campaign> campaigns = data.map((dynamic item) => Campaign.fromJson(item),
        ).toList();

        return campaigns;

      } else {
        throw "Unable to retrieve campaigns.";
      }
    }
    
  } catch (e) {
        print("this catch");
        print(e);
        rethrow;
      }throw "Latest throw";});}}
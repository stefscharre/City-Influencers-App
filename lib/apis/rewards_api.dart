import 'dart:convert';

import 'package:city_influencers_app/models/rewardApiResponse.dart';
import 'package:city_influencers_app/models/login/tokenvalidation.dart';
import 'package:city_influencers_app/models/reward.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart';

class RewardsApi {
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
          "no token";
    } catch (e) {
      print(e);
    }

    return value;
  }

  Future<List<RewardInfo>?> getInfluencerRewards() {
    return readSecureToken().then((String result) async {
      try {
        String token = result;

        if (token != null) {
          Map<String, String> headers = {
            "Authorization": "Bearer $token",
          };

          Response res = await get(
              Uri.parse(
                  "http://api-ci.westeurope.cloudapp.azure.com:8080/api/rewards"),
              headers: headers);

          if (res.statusCode == 200) {
            final jsonRes = json.decode(res.body);
            print(jsonRes);

            RewardApiResponse data = RewardApiResponse.fromJson(jsonRes);

            print("got here");
            print("or heerrerr hahha");
            print(data.data[0]);

            List<RewardInfo> rewards = [];

            for (var element in data.data) {
              print(element);
              final reward = RewardInfo.fromJson(element);
              rewards.add(reward);
            }

            print(rewards);

            return rewards;
          }
        }
      } catch (e) {
        rethrow;
      }
    });
  }

  Future<String?> claimReward(String id) async {
    try {
      readSecureToken().then((String result) async {
        String token = result;

        Map<String, String> headers = {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token",
        };

        final rewardUpdate = {'rewardid': id, 'type': 'claim'};

        Response res = await put(
            Uri.parse(
                "http://api-ci.westeurope.cloudapp.azure.com:8080/api/rewards"),
            body: jsonEncode(rewardUpdate),
            headers: headers);

        if (res.statusCode == 200) {
          return "Reward succesfully claimed";
        }
      });
    } catch (e) {
      rethrow;
    }
  }
}

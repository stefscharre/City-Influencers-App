import 'package:city_influencers_app/models/auth_token_response.dart';
import 'package:city_influencers_app/models/influencer.dart';
import 'package:city_influencers_app/models/influencerApiResponse.dart';
import 'package:city_influencers_app/models/login/login_data.dart';
import 'package:city_influencers_app/models/login/token_validation_response.dart';
import 'package:city_influencers_app/models/login/tokenvalidation.dart';
import 'package:city_influencers_app/pages/login.dart';
import 'package:city_influencers_app/pages/signup.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:convert';

import 'package:http/http.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class InfluencerApi {
  final secureStorage = const FlutterSecureStorage();
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
    print(res.body);
    if (res.statusCode == 200) {
      Map<String, dynamic> map = json.decode(res.body);
      print(map.values);
      if (map.values.last == "AuthCredsInvalid") {
        print("wrond login provided");
        return LoginData(token: "", creationtime: "", expiretime: "");
      } else {
        LoginData data = LoginData.fromJson(map.values.last);

        await secureStorage.write(
            key: 'token',
            value: data.token,
            iOptions: _getIOSOptions(),
            aOptions: _getAndroidOptions());

        return data;
      }
    } else {
      throw "Unable to retrieve influencer.";
    }
  }

  Future<Influencer> postInfluencer(
      String email, String username, String password) async {
    final signup = {
      'type': "influencer",
      'username': username,
      'password': password,
      'email': email,
    };

    Response res = await post(
      Uri.parse(
          "http://api-ci.westeurope.cloudapp.azure.com:8080/api/register"),
      body: signup,
    );
    print(res.body);
    if (res.statusCode == 200) {
     return postLogin(username, password).then((value) =>  Influencer.fromJson(jsonDecode(res.body)));
      
    } else {
      throw "Unable to make influencer.";
    }
  }

  Future<Influencer?> updateInfluencer(Influencer influencer) {
    print("updating...");
    final update = {
      'id': influencer.id,
      'wachtwoord': influencer.wachtwoord,
      'username': influencer.gebruikersnaam,
      'firstname': influencer.voornaam,
      'lastname': influencer.familienaam,
      'adress': influencer.adres,
      'postcode':influencer.postcode,
      'city': influencer.stad,
      'dateofbirth': influencer.geboortedatum,
      'phonenumber': influencer.telefoonnummer,
      'email': influencer.emailadres,
      'gender': influencer.geslacht,
      'usernameinstagram':influencer.gebruikersnaaminstagram,
      'usernamefacebook': influencer.gebruikersnaamfacebook,
      'totalfollowersinstagram':influencer.aantalvolgersinstagram,
      'totalfollowersfacebook': influencer.aantalvolgersfacebook,
      'totalfollowerstiktok': influencer.aantalvolgerstiktok,
      'infoaboutfollowers': influencer.infoovervolgers,
      'badge': influencer.badge,
      'totalpoints': influencer.aantalpunten,
      'profilepicture': influencer.profielfoto

    };
    print(update);
    return readSecureToken().then((String result) async {
      try {
        String token = result;
        if (token != null) {
          Map<String, String> headers = {
            "Content-Type":"application/json",
            "Authorization": "Bearer $token",
          };
        print(token);
        print(update['id']);
        print(influencer.adres);
          Response res = await put(
            Uri.parse(
                "http://api-ci.westeurope.cloudapp.azure.com:8080/api/accounts"),
                body:jsonEncode(update),
            headers: headers
            
          );
          if (res.statusCode == 200) {  
            print(res.body);    
           
          } else {
            throw Exception('Failed to update user');
          }
        }
      } catch (e) {
        print("this catch");
        print(e);
        rethrow;
      }
    });
  }

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

  Future<Influencer?> getInfluencer() {
    return readSecureToken().then((String result) async {
      try {
        String token = result;
        if (token != null) {
          Map<String, String> headers = {
            "Authorization": "Bearer $token",
          };

          Response res = await get(
              Uri.parse(
                  "http://api-ci.westeurope.cloudapp.azure.com:8080/api/me"),
              headers: headers);
          if (res.statusCode == 200) {
            Map<String, dynamic> map = json.decode(res.body);

            //map.forEach((k, v) => debugPrint('$k: $v'));

            TokenValidation data = TokenValidation.fromJson(map["data"]);
            String influencerid = data.id;

            if (influencerid != "") {
              Response res = await get(
                  Uri.parse(
                      "http://api-ci.westeurope.cloudapp.azure.com:8080/api/influencers/" +
                          influencerid),
                  headers: headers);
              if (res.statusCode == 200) {
                final responseJson = json.decode(res.body);
                InfluencerApiResponse influencer =
                    InfluencerApiResponse.fromJson(responseJson);
                Influencer influencerData = Influencer(
                    id: influencer.data[0]["id"],
                    wachtwoord: influencer.data[0]["wachtwoord"],
                    voornaam: influencer.data[0]["voornaam"],
                    familienaam: influencer.data[0]["familienaam"],
                    geslacht: influencer.data[0]["geslacht"],
                    gebruikersnaam: influencer.data[0]["gebruikersnaam"],
                    profielfoto: influencer.data[0]["profielfoto"],
                    adres: influencer.data[0]["adres"],
                    postcode: influencer.data[0]["postcode"],
                    stad: influencer.data[0]["stad"],
                    geboortedatum: influencer.data[0]["geboortedatum"],
                    telefoonnummer: influencer.data[0]["telefoonnummer"],
                    emailadres: influencer.data[0]["emailadres"],
                    gebruikersnaaminstagram: influencer.data[0]
                        ["gebruikersnaaminstagram"],
                    gebruikersnaamfacebook: influencer.data[0]
                        ["gebruikersnaamfacebook"],
                    gebruikersnaamtiktok: influencer.data[0]
                        ["gebruikersnaamtiktok"],
                    aantalvolgersinstagram: influencer.data[0]
                        ["aantalvolgersinstagram"],
                    aantalvolgersfacebook: influencer.data[0]
                        ["aantalvolgersfacebook"],
                    aantalvolgerstiktok: influencer.data[0]
                        ["aantalvolgerstiktok"],
                    infoovervolgers: influencer.data[0]["infoovervolgers"],
                    badge: influencer.data[0]["badge"],
                    aantalpunten: influencer.data[0]["aantalpunten"],
                    categories: []);
                return influencerData;
              }
            }
          }
        }
      } catch (e) {
        print("this catch");
        print(e);
        rethrow;
      }
    });
  }

  Future<Influencer> fetchInfluencerData() {
    try {} catch (e) {
      print(e);

      Future<Influencer> inf = Influencer(
          id: "",
          wachtwoord: "",
          voornaam: "",
          familienaam: "",
          geslacht: "",
          gebruikersnaam: "",
          profielfoto: "",
          adres: "",
          postcode: "",
          stad: "",
          geboortedatum: "",
          telefoonnummer: "",
          emailadres: "",
          gebruikersnaaminstagram: "",
          gebruikersnaamfacebook: "",
          gebruikersnaamtiktok: "",
          aantalvolgersinstagram: "",
          aantalvolgersfacebook: "",
          aantalvolgerstiktok: "",
          infoovervolgers: "",
          badge: "",
          aantalpunten: "",
          categories: []) as Future<Influencer>;

      return inf;
    }

    throw "Latest throw";
  }
}

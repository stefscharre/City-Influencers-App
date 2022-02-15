import 'dart:convert';

import 'package:city_influencers_app/models/apiResponse.dart';
import 'package:city_influencers_app/models/login/tokenvalidation.dart';
import 'package:city_influencers_app/models/post.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart';

class PostsApi {

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

  Future<List<PostData>?> getPosts() async {
  return readSecureToken().then((String result) async {
      try {
        String token = result;

        if (token != null) {
          Map<String, String> headers = {
            "Authorization": "Bearer $token",
          };

          Response res = await get(
              Uri.parse(
                  "http://api-cityinfluencers.westeurope.cloudapp.azure.com:8080/api/me"),
              headers: headers);

          if (res.statusCode == 200) {
            Map<String, dynamic> map = json.decode(res.body);

            //map.forEach((k, v) => debugPrint('$k: $v'));

            TokenValidation data = TokenValidation.fromJson(map["data"]);
            String influencerid = data.id;

          Response res2 = await get(
              Uri.parse(
                  "http://api-cityinfluencers.westeurope.cloudapp.azure.com:8080/api/influencers/" + influencerid + "/posts"),
              headers: headers);

          if (res.statusCode == 200) {
            final jsonRes = json.decode(res2.body);
            print(jsonRes);

            ApiResponse data = ApiResponse.fromJson(jsonRes);

            print(data.data[0]);

            List<PostData> posts = [];

            for (var post in data.data) {
              print(post);
              final postData = PostData.fromJson(post);
              posts.add(postData);
            }

            print(posts);

            return posts;
          }
        }
        }
      } catch (e) {
        rethrow;
      }
    });
  }

  Future<String?> createPosts(PostData postData) async {
     try {
      readSecureToken().then((String result) async {
        String token = result;

        Map<String, String> headers = {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token",
        };

        final createPost = {
          'taskid': postData.opdrachtid, 
          'description': postData.beschrijving,
          'picture': postData.foto
          };

        Response res = await post(
            Uri.parse(
                "http://api-cityinfluencers.westeurope.cloudapp.azure.com:8080/api/posts"),
            body: jsonEncode(createPost),
            headers: headers);

        if (res.statusCode == 200) {
        }
      });
      return "Post succesfully created";

    } catch (e) {
      rethrow;
    }
  }

}
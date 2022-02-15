import 'dart:convert';

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
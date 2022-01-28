// ignore_for_file: file_names

import 'dart:convert';

import 'package:city_influencers_app/models/influencer.dart';

class InfluencerApiResponse {
  InfluencerApiResponse({
    required this.code,
    required this.message,
    required this.data,
  });

  final int code;
  final String message;
  final List<dynamic> data;

  factory InfluencerApiResponse.fromJson(Map<String, dynamic> json) {


    //var list = json['data'] as List;
    //List<Influencer> influencerList = list.map((i) => Influencer.fromJson(i)).toList();

    return InfluencerApiResponse(
      code: json['code'],
      message: json['message'],
      data: json['data']
    );

    
}}
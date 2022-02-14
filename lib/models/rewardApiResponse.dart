// ignore_for_file: file_names

import 'dart:convert';

import 'package:city_influencers_app/models/influencer.dart';
import 'package:city_influencers_app/models/reward.dart';

class RewardApiResponse {
  RewardApiResponse({
    required this.code,
    required this.message,
    required this.data,
  });

  final int code;
  final String message;
  final List<dynamic> data;

  factory RewardApiResponse.fromJson(Map<String, dynamic> json) {


    //var list = json['data'] as List;
    //List<Influencer> influencerList = list.map((i) => Influencer.fromJson(i)).toList();

    return RewardApiResponse(
      code: json['code'],
      message: json['message'],
      data: json['data']
    );

    
}}
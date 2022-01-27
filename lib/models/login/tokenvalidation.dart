import 'package:city_influencers_app/models/login/login_data.dart';

class TokenValidation {

  TokenValidation({
    required this.id,
    required this.type,
  });

  String id;
  String type;



  factory TokenValidation.fromJson(Map<String, dynamic> json) => TokenValidation(
    id: json["id"],
    type: json["type"],

  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "type": type,

  };
}
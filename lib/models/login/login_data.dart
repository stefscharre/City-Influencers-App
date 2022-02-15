class LoginData {

  LoginData({
    required this.token,
    required this.creationtime,
    required this.expiretime,
  });
  String token;
  String creationtime;
  String expiretime;


  factory LoginData.fromJson(Map<String, dynamic> json) => LoginData(
    token: json["token"],
    creationtime: json["creationtime"],
    expiretime: json["expiretime"], 
  );

  Map<String, dynamic> toJson() => {
    "token": token,
    "creationtime": creationtime,
    "expiretime": expiretime,

  };



}
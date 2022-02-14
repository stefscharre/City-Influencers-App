class RewardInfo {

  String? id;
  String? titel;
  String? omschrijving;
  String? tegoed;
  String? isclaimed;

  RewardInfo({this.id, this.titel, this.omschrijving, this.tegoed, this.isclaimed});

  factory RewardInfo.fromJson(Map<String, dynamic> json) {
    return RewardInfo(
      id: json['id'],
      titel: json['titel'],
      omschrijving: json['omschrijving'],
      tegoed: json['tegoed'],
      isclaimed: json['isclaimed']
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'titel': titel,
    'omschrijving': omschrijving,
    'tegoed': tegoed,
    'isclaimed': isclaimed
  };



}

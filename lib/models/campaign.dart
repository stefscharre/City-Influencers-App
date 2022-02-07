class Campaign {
  final String id;
  final String winnaarid;
  final String stadid;
  final String titel;
  final String omschrijving;
  final String aantalpuntenwaard;
  final String isuitgevoerd;
  final String datumopgegeven;
  final String datumuitgevoerd;
  final String foto;
  final List<String> categories;




  Campaign({required this.id, required this.winnaarid, required this.stadid, required this.titel, required this.omschrijving, required this.aantalpuntenwaard, required this.isuitgevoerd, 
  required this.datumopgegeven, required this.datumuitgevoerd, required this.foto, required this.categories});
  
  factory Campaign.fromJson(Map<String, dynamic> json) {
    return Campaign(
      id: json['id'],
      winnaarid: json['winnaarid'],
      stadid: json['stadid'],
      titel: json['titel'],
      omschrijving: json['omschrijving'],
      aantalpuntenwaard: json['aantalpuntenwaard'],
      isuitgevoerd: json['isuitgevoerd'],
      datumopgegeven: json['datumopgegeven'],
      datumuitgevoerd: json['datumuitgevoerd'],
      foto: json['foto'],
      categories: json['categories']
    );
  }

  Map<String, dynamic> toJson() =>
    {
      'id': id,
      'winnaarid': winnaarid,
      'stadid': stadid,
      'titel': titel,
      'omschrijving': omschrijving,
      'aantalpuntenwaard': aantalpuntenwaard,
      'isuitgevoerd': isuitgevoerd,
      'datumopgegeven': datumopgegeven,
      'datumuitgevoerd': datumuitgevoerd,
      'foto': foto,
      'categories': categories,
    };
}
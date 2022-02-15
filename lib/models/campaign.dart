class Campaign {
  final String? id;
  final String? winnaarid;
  final String? stadid;
  final String? titel;
  final String? omschrijving;
  final String? aantalpuntenwaard;
  final String? isuitgevoerd;
  final String? datumopgegeven;
  final String? datumuitgevoerd;
  final String? foto;
  final List<dynamic>? categories;




  Campaign({this.id, this.winnaarid, this.stadid, this.titel, this.omschrijving, this.aantalpuntenwaard, this.isuitgevoerd, 
  this.datumopgegeven, this.datumuitgevoerd, this.foto, this.categories});
  
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
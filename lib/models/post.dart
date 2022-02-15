class PostData {

  String? id;
  String? influencerid;
  String? foto;
  String? beschrijving;
  String? isgoedgekeurd;
  String? commentaarstad;
  String? aantallikes;
  String? aantalcomments;
  String? bereik;
  String? opdrachtid;

  PostData({this.id, this.influencerid, this.foto, this.beschrijving, this.isgoedgekeurd, this.commentaarstad, this.aantalcomments, this.aantallikes, this.bereik, this.opdrachtid});

  factory PostData.fromJson(Map<String, dynamic> json) {
    return PostData(
      id: json['id'],
      influencerid: json['influencerid'],
      foto: json['foto'],
      beschrijving: json['beschrijving'],
      isgoedgekeurd: json['isgoedgekeurd'],
      commentaarstad: json['commentaarstad'],
      aantallikes: json['aantallikes'],
      aantalcomments: json['aantalcomments'],
      bereik: json['bereik'],
      opdrachtid: json['opdrachtid'],
    );
  }
}

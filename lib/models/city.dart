class City {
  final String id;
  final String naam;
  final String postcode;

  City({required this.id, required this.naam, required this.postcode});
  
  factory City.fromJson(Map<String, dynamic> json) {
    return City(
      id: json['id'],
      naam: json['naam'],
      postcode: json['postcode'],
    );
  }

  Map<String, dynamic> toJson() =>
    {
      'id': id,
      'naam': naam,
      'postcode': postcode,

    };
}
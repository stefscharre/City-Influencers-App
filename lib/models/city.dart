class City {
  final int id;
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
      'naam': naam,
      'postcode': postcode,

    };
}
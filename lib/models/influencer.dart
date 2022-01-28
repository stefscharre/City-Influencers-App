import 'package:flutter/foundation.dart';

class Influencer {
  final String id;
  final String? voornaam;
  final String? familienaam;
  final String? geslacht;
  final String gebruikersnaam;
  final String? profielfoto;
  final String? adres;
  final String? postcode;
  final String? stad;
  final String? geboortedatum;
  final String? telefoonnummer;
  final String emailadres;
  final String? gebruikersnaaminstagram;
    final String? gebruikersnaamfacebook;
      final String? gebruikersnaamtiktok;
  final String? aantalvolgersinstagram;
  final String? aantalvolgersfacebook;
  final String? aantalvolgerstiktok;

  final String? infoovervolgers;
  final String badge;
  final String aantalpunten;
  final List<String> categories;


  Influencer({required this.id, required this.voornaam,
  this.familienaam, 
  this.geslacht, 
  required this.gebruikersnaam, 
  this.profielfoto, 
  this.adres, 
  this.postcode, 
  this.stad, 
  this.geboortedatum, 
  this.telefoonnummer, 
  required this.emailadres, 
  this.gebruikersnaaminstagram, 
  this.gebruikersnaamfacebook, 
  this.gebruikersnaamtiktok, 
  this.aantalvolgersinstagram, 
  this.aantalvolgersfacebook, 
  this.aantalvolgerstiktok, 
  this.infoovervolgers, 
  required this.badge, 
  required this.aantalpunten, 
  required this.categories, 
});
  
  factory Influencer.fromJson(Map<String, dynamic> json) {
    return Influencer(
      id: json['id'],
      voornaam: json['voornaam'],
      familienaam: json['familienaam'],
      geslacht: json['geslacht'],
      gebruikersnaam: json['gebruikersnaam'],
      profielfoto: json['profielfoto'],
      adres: json['adres'],
      postcode: json['postcode'],
      stad: json['stad'],
      geboortedatum: json['geboortedatum'],
      telefoonnummer: json['telefoonnummer'],
      emailadres: json['emailadres'],
      gebruikersnaaminstagram: json['gebruikersnaaminstagram'],
      gebruikersnaamfacebook: json['gebruikersnaamfacebook'],
      gebruikersnaamtiktok: json['gebruikersnaamtiktok'],
      aantalvolgersinstagram: json['aantalvolgersinstagram'],
      aantalvolgersfacebook: json['aantalvolgersfacebook'],
      aantalvolgerstiktok: json['aantalvolgerstiktok'],
      infoovervolgers: json['infoovervolgers'],
      badge: json['badge'],
      aantalpunten: json['aantalpunten'],
      categories: json['categories'],
    );
  }

  Map<String, dynamic> toJson() =>
    {
      'id': id,
      'voornaam': voornaam,
      'familienaam': familienaam,
      'geslacht': geslacht,
      'gebruikersnaam': gebruikersnaam,
      'profielfoto': profielfoto,
      'adres': adres,
      'postcode':postcode,
      'stad': stad,
      'geboortedatum': geboortedatum,
      'telefoonnummer': telefoonnummer,
      'emailadres': emailadres,
      'gebruikersnaaminstagram':gebruikersnaaminstagram,
      'gebruikersnaamfacebook': gebruikersnaamfacebook,
      'gebruikersnaamtiktok': gebruikersnaamtiktok,
      'aantalvolgersinstagram': aantalvolgersinstagram,
      'aantalvolgersfacebook': aantalvolgersfacebook,
      'aantalvolgerstiktok':aantalvolgerstiktok,
      'infoovervolgers': infoovervolgers,
      'badge': badge,
      'aantalpunten': aantalpunten,
      'categories': categories,

    };
}
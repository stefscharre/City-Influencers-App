import 'package:flutter/foundation.dart';

class Influencer {
  final String? id;
    String? wachtwoord;
   String? voornaam;
  
   String? familienaam;
   String? geslacht;
   String? gebruikersnaam;
   String? profielfoto;
  String? adres;
   String? postcode;
   String? stad;
   String? geboortedatum;
   String? telefoonnummer;
  String? emailadres;
   String? gebruikersnaaminstagram;
     String? gebruikersnaamfacebook;
       String? gebruikersnaamtiktok;
   String? aantalvolgersinstagram;
   String? aantalvolgersfacebook;
   String? aantalvolgerstiktok;

   String? infoovervolgers;
   String? badge;
   String aantalpunten;
   List<String>? categories;


  Influencer({ this.id,  this.wachtwoord, this.voornaam,
  this.familienaam, 
  this.geslacht, 
   this.gebruikersnaam, 
  this.profielfoto, 
  this.adres, 
  this.postcode, 
  this.stad, 
  this.geboortedatum, 
  this.telefoonnummer, 
   this.emailadres, 
  this.gebruikersnaaminstagram, 
  this.gebruikersnaamfacebook, 
  this.gebruikersnaamtiktok, 
  this.aantalvolgersinstagram, 
  this.aantalvolgersfacebook, 
  this.aantalvolgerstiktok, 
  this.infoovervolgers, 
   this.badge, 
  required this.aantalpunten, 
   this.categories, 
});
  
  factory Influencer.fromJson(Map<String, dynamic> json) {
    return Influencer(
      id: json['id'],
      wachtwoord: json['wachtwoord'],
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
       'wachtwoord': wachtwoord,
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
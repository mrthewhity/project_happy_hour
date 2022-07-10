import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:json_annotation/json_annotation.dart';
import 'package:flutter/services.dart' show rootBundle;



class Name {
  String common;
  String official;

  Name({required this.common, required this.official});

  factory Name.fromJson(Map<String, dynamic> json) {
    return Name(
      common: json["common"] as String,
      official: json["official"] as String,
    );
  }
}


class Coordinates {
  double lat;
  double lng;

  Coordinates({required this.lat, required this.lng});

  factory Coordinates.fromJson(List<double> json) {
    return Coordinates(
      lat: json[0] as double,
      lng: json[1] as double,
    );
  }
}



class Country {
  
  Name name;
  String region;
  String subregion;
  double area;
  int population;
  List<String> capital;
  Map<String, dynamic> currencies;
  Map<String, dynamic> languages;
  Coordinates coordinates_capital;
  String flag_link;


  Country({
   required this.name,
   required this.region,
   required this.subregion,
   required this.area,
   required this.population,
   required this.capital,
   required this.currencies,
   required this.languages,
   required this.coordinates_capital,
   required this.flag_link,

  });

  factory Country.fromJson(Map<String, dynamic> json) {

    return Country(
      name: Name.fromJson(json["name"]),
      region: json["region"],
      subregion: json["subregion"],
      area: json["area"],
      population: json["population"],
      capital: json["capital"].cast<String>(),
      currencies: json["currencies"],
      languages: json["languages"],
      coordinates_capital: Coordinates.fromJson(json["capitalInfo"]["latlng"].cast<double>()),
      flag_link: json["flags"]["png"],

    );
  }


}





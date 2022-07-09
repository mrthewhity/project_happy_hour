import 'dart:async';
import 'dart:core';
import 'package:http/http.dart' as http;
import 'package:project_hp/models/countries.dart';
import 'dart:convert';



Future<List<Country>> fetchCountries() async { 
  const String country_europa_api = 'https://restcountries.com/v3.1/region/europe';

  final response = await http
      .get(Uri.parse(country_europa_api));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.

    Iterable l = json.decode(response.body);

    return  List<Country>.from(l.map((model)=> Country.fromJson(model)));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}



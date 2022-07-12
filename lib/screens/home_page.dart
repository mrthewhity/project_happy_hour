import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'package:project_hp/models/countries.dart';
import 'package:project_hp/datas/RestCountriesApi.dart';
import 'package:project_hp/screens/details_page.dart';



class MapCountry extends StatefulWidget {
  @override
  _MapCountryState createState() => _MapCountryState();
}

class _MapCountryState extends State<MapCountry> {

  final String _region = "europe";
  final Map<String, Marker> _markers = {};
  LatLng _initialcameraposition = LatLng(50.0,0.0);
  
  void updateMarkers(List<Country>? countries){

    /*
    *  update the markers of the flutter google maps
    *  params: List<Country> (countries)
    *  returns: Void 
    */

    setState(() {
      _markers.clear();
      if(countries!=null){
        for (final country in countries) {
          final marker = Marker(
            markerId: MarkerId(country.name.common),
            position: LatLng(country.coordinates_capital.lat, country.coordinates_capital.lng),
            onTap: () { 
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => detailsCountry(country)),
              );
            },
          );
          _markers[country.name.common] = marker;
        }
      }
    });
  }


  @override
  Widget build(BuildContext context) {

    return 
    FutureBuilder<List<Country>>(
      future: fetchCountries(_region),
      builder: (context, AsyncSnapshot<List<Country>>snapshot){
        if (snapshot.hasData) {
          return Scaffold(
            body: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Stack(
                children: [
                  GoogleMap(
                    initialCameraPosition: CameraPosition(target: _initialcameraposition,zoom: 5.0,),
                    mapType: MapType.normal,
                    onMapCreated: (GoogleMapController _cntlr) {
                      updateMarkers(snapshot.data);
                    },
                    myLocationEnabled: true,
                    zoomControlsEnabled: true,
                    zoomGesturesEnabled: true,
                    scrollGesturesEnabled: true,
                    compassEnabled: true,
                    markers: _markers.values.toSet(),
                  ),
                ],
              ),
            ),
          );     
        } 
        else {
          return 
          Container(
            decoration: BoxDecoration(
                color: Colors.white
             ),
            child: Center(
              child: SpinKitWave(
                color: Colors.blue,
                size: 70.0,
              )
            )
          );
        }
      }
    );
  }
}

import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:flutter/material.dart';
import 'package:project_hp/models/countries.dart';
import 'package:project_hp/datas/RestCountriesApi.dart';
import 'dart:convert';


class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  final Map<String, Marker> _markers = {};
  LatLng _initialcameraposition = LatLng(50.72896305256767, 4.396040084657892);
  Future<void>  _onMapCreated(GoogleMapController _cntlr) async
    {
      
      final countries = await fetchCountries();
      setState(() {
        _markers.clear();
        for (final country in countries) {
          final marker = Marker(
            markerId: MarkerId(country.name.common),
            position: LatLng(country.coordinates_capital.lat, country.coordinates_capital.lng),
            infoWindow: InfoWindow(
              title: country.name.common,
              snippet: country.subregion,
            ),
          );
          _markers[country.name.common] = marker;
          
        }
        
      });

    }



    @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            GoogleMap(
              initialCameraPosition: CameraPosition(target: _initialcameraposition,zoom: 5.0,),
              mapType: MapType.normal,
              onMapCreated: _onMapCreated,
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
}

import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:project_hp/models/countries.dart';
import 'package:project_hp/utils/amount_fct.dart';
import 'package:project_hp/utils/themes.dart';


class detailsCountry extends StatelessWidget {

  final Country country;
   detailsCountry(this.country,{super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: kWhiteColor,
        appBar: DetailCountryAppBar(),
        body: DetailCountryBody(
          country:country
        )
      ),
    );
  }
}


class DetailCountryAppBar extends StatefulWidget implements PreferredSizeWidget {
  
  DetailCountryAppBar({Key? key}) : super(key: key);
 
  @override
  Size get preferredSize => Size.fromHeight(70);

  @override
  _DetailCountryState createState() => _DetailCountryState();
  }

class _DetailCountryState extends State<DetailCountryAppBar>{
  
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: kWhiteColor,
      elevation: 0.0,
      leading: Container(
        padding: const EdgeInsets.only(left: 10.0),
        alignment: Alignment.center,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            elevation: 0,
              padding: EdgeInsets.zero,
              primary:  kTransparentColor,
              onPrimary: kRedAppBarColor,
              shape: CircleBorder(),
          ),
          onPressed: () {Navigator.of(context ,rootNavigator: true).pop();},
          child: const Icon(
            Icons.arrow_back_ios,
            size: 20,
          ),
        )
      ),
    );
  }
}



class DetailCountryBody extends StatefulWidget {
  final Country? country;
  const DetailCountryBody({Key? key,this.country}) : super(key: key);

  @override
  State<DetailCountryBody> createState() => _DetailCountryBodyState();
}

class _DetailCountryBodyState extends State<DetailCountryBody> {

  @override
  Widget build(BuildContext context) {


    return 
    Container(
      decoration: BoxDecoration(
        color: kWhiteColor
      ),
      child: SingleChildScrollView( 
        scrollDirection: Axis.vertical,
        child: SafeArea(  
          child: Column(
            children: <Widget>[ 
              Container (
                width: double.infinity,
                padding: EdgeInsets.only(left:MediaQuery.of(context).size.width/20),
                child: Row(
                  children:[
                    Text("Country",
                      style: TextStyle(
                      color: Colors.grey,
                      fontSize: 15,
                      fontWeight: FontWeight.bold
                      )
                    )
                  ]
                )
              ),
              Container(
                width: double.infinity,
                padding:  EdgeInsets.only(
                  left:MediaQuery.of(context).size.width/20,
                  right: MediaQuery.of(context).size.width/30,
                  bottom: MediaQuery.of(context).size.height/60,
                  top: MediaQuery.of(context).size.height/60
                ),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(width: 1.0, 
                    color: Colors.blue.shade50
                    ),
                  ),                       
                ),
                child: Row(
                  children: [ 
                    Container( 
                      margin: EdgeInsets.only(right: MediaQuery.of(context).size.width/40),
                      height: MediaQuery.of(context).size.height/50,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black, width: 1 ),
                      ),
                      child: Image.network(widget.country!.flag_link) 
                    ),
                    Text(widget.country!.name.common,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 25,
                        fontWeight: FontWeight.bold
                      )
                    )
                  ]
                )          
              ),
              Container(
                width: double.infinity,
                padding: EdgeInsets.only(
                  left:MediaQuery.of(context).size.width/20,
                  top:MediaQuery.of(context).size.height/60,
                ),
                child: Row(
                  children:[
                    Text("Region and Subregion",
                      style: TextStyle(
                      color: Colors.grey,
                      fontSize: 15,
                      fontWeight: FontWeight.bold
                      )
                    ) 
                  ]
                )
              ),
              Container(
                width: double.infinity,
                padding: EdgeInsets.only(
                  left:MediaQuery.of(context).size.width/20,
                  right: MediaQuery.of(context).size.width/30,
                  bottom: MediaQuery.of(context).size.height/60,
                  top: MediaQuery.of(context).size.height/60
                ),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(width: 1.0, 
                    color: Colors.blue.shade50
                    ),
                  ),                        
                ),
                child: Row(
                  children: [ 
                    Text(widget.country!.subregion,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.bold
                      )
                    ),
                  ]
                )          
              ),
              Container (
                width: double.infinity,
                padding: EdgeInsets.only(
                  left:MediaQuery.of(context).size.width/20,
                  top:MediaQuery.of(context).size.height/60,
                ),
                child: Row(
                  children:[
                    Text("Languages",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 15,
                        fontWeight: FontWeight.bold
                      )
                    )                     
                  ]
                )
              ),
              Container(
                width: double.infinity,
                padding:  EdgeInsets.only(
                  left:MediaQuery.of(context).size.width/20,
                  right: MediaQuery.of(context).size.width/30,
                  bottom: MediaQuery.of(context).size.height/60,
                  top: MediaQuery.of(context).size.height/60),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(width: 1.0, 
                      color: Colors.blue.shade50
                    ),
                  ),    
                ),
                child: Column(
                  children:
                    widget.country!.languages.entries.map((entry) {
                    var w = Row(
                      children:[
                        const Icon(
                          IconData(0xef51,
                            fontFamily: 'MaterialIcons'
                          ),
                          size: 20.0
                        ),
                        Container(
                          padding: EdgeInsets.only(
                            left:MediaQuery.of(context).size.width/40
                          ), 
                          child: Text(entry.value,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,                          
                            )
                          )
                        )
                      ]
                    );
                    return w;
                  }).toList()
                )
              ),
              Container (
                width: double.infinity,
                padding: EdgeInsets.only(
                  left:MediaQuery.of(context).size.width/20,
                  top:MediaQuery.of(context).size.height/60,
                ),
                child: Row(
                  children:[
                    Text("Currencies",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 15,
                        fontWeight: FontWeight.bold
                      )
                    )                        
                  ]
                )
              ),
              Container(
                width: double.infinity,
                padding:  EdgeInsets.only(
                  left:MediaQuery.of(context).size.width/20,
                  right: MediaQuery.of(context).size.width/30,
                  bottom: MediaQuery.of(context).size.height/60,
                  top: MediaQuery.of(context).size.height/60
                ),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(width: 1.0, 
                      color: Colors.blue.shade50
                    ),
                  ),
                ),
                child: Column(
                  children:
                  widget.country!.currencies.entries.map((entry) {
                    var w = Row(
                      children:[
                        const Icon(
                          IconData(0xf04dc, fontFamily: 'MaterialIcons'),
                          size: 20.0
                        ),
                        Container(
                          padding:EdgeInsets.only(
                            left:MediaQuery.of(context).size.width/40
                          ), 
                          child: Text(entry.value["name"],
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,                                 
                            )
                          )
                        )
                      ]
                    );
                    return w;  
                  }).toList()
                )
              ),
              Container (
                width: double.infinity,
                padding: EdgeInsets.only(
                  left:MediaQuery.of(context).size.width/20,
                  top:MediaQuery.of(context).size.height/60,
                ),
                child: Row(
                  children:[
                    Text("Area",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 15,
                        fontWeight: FontWeight.bold
                      )
                    )  
                  ]
                )
              ),
              Container(
                width: double.infinity,
                padding:  EdgeInsets.only(
                  left:MediaQuery.of(context).size.width/20,
                  right: MediaQuery.of(context).size.width/30,
                  bottom: MediaQuery.of(context).size.height/60,
                  top: MediaQuery.of(context).size.height/60
                ),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(width: 1.0, 
                      color: Colors.blue.shade50
                    ),
                  ),    
                ),
                child: Row(
                  children: [ 
                    const Icon(
                      IconData(0xf05bb, fontFamily: 'MaterialIcons'),
                      size: 23.0
                    ),
                    Container(        
                      padding: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width/40
                      ), 
                      child: Text(formatAmount(widget.country!.area.toString())+ " kms square",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                        )
                      )
                    )
                  ]
                )     
              ),
              Container (
                width: double.infinity,
                padding: EdgeInsets.only(
                  left:MediaQuery.of(context).size.width/20,
                  top:MediaQuery.of(context).size.height/60,
                ),
                child: Row(
                  children:[
                    Text("Population",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 15,
                        fontWeight: FontWeight.bold
                      )
                    )
                  ]
                )
              ),
              Container(
                width: double.infinity,
                padding:  EdgeInsets.only(
                  left:MediaQuery.of(context).size.width/20,
                  right: MediaQuery.of(context).size.width/30,
                  bottom: MediaQuery.of(context).size.height/60,
                  top: MediaQuery.of(context).size.height/60
                ),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(width: 1.0, 
                      color: Colors.blue.shade50
                    ),
                  ),    
                ),
                child: Row(
                  children: [ 
                    const Icon(
                      IconData(0xeb8d, fontFamily: 'MaterialIcons'),
                      size: 23.0
                    ),
                    Container(
                      padding:EdgeInsets.only(
                        left:MediaQuery.of(context).size.width/40
                      ), 
                      child: Text(formatAmount(widget.country!.population.toString())+ " citizens",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,   
                        )
                      )
                    )
                  ]
                )     
              ),
              Container (
                width: double.infinity,
                padding: EdgeInsets.only(
                  left:MediaQuery.of(context).size.width/20,
                  top:MediaQuery.of(context).size.height/60,
                ),
                child: Row(
                  children:[
                    Text("Capital",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 15,
                        fontWeight: FontWeight.bold
                      )
                    ) 
                  ]
                )
              ),
              Container(
                width: double.infinity,
                padding:  EdgeInsets.only(
                  left: MediaQuery.of(context).size.width/20,
                  right: MediaQuery.of(context).size.width/30,
                  bottom: MediaQuery.of(context).size.height/60,
                  top: MediaQuery.of(context).size.height/60
                ),
                child: Column(
                  children: <Widget> [
                    Row(
                      children: [ 
                        const Icon(
                          IconData(0xf1af, fontFamily: 'MaterialIcons'),
                          size: 23.0
                        ),
                        Container(
                          padding: EdgeInsets.only(
                            left: MediaQuery.of(context).size.width/40
                          ), 
                          child: Text(widget.country!.capital[0],
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                            )
                          )
                        )
                      ]
                    ),
                    Row(
                      children: [ 
                        const Icon(
                          IconData(0xf885, fontFamily: 'MaterialIcons'),
                          size: 23.0
                        ),
                        Container(
                          padding: EdgeInsets.only(
                            left:MediaQuery.of(context).size.width/40
                          ), 
                          child: Text("Lat : "+widget.country!.coordinates_capital.lat.toString()+ " | Lng : " + widget.country!.coordinates_capital.lng.toString() ,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                            )
                          )
                        )
                      ]
                    )     
                  ]
                )
              ),
            ],
          ),
        ) 
      ) 
    );  
  }
}






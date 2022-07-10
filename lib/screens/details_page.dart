import 'package:flutter/material.dart';
import 'package:project_hp/models/countries.dart';


class details_countries extends StatelessWidget {

  final Country country;
   details_countries(this.country,{super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Welcome to the country finder',
      home: Scaffold(
        appBar: CustomAppBar(country:country),
        body: const Center(
          child: Text('Hello World'),
        ),
      ),
    );
  }
}


class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {

  
  final Country? country;
  CustomAppBar({Key? key,this.country}) : super(key: key);
 

  @override
  Size get preferredSize => Size.fromHeight(70);

  @override
  _CustomAppBarState createState() => _CustomAppBarState();
  }


class _CustomAppBarState extends State<CustomAppBar>{
  
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      leading: 
        Container(
          padding: const EdgeInsets.only(left: 10.0),
            alignment: Alignment.center,
            child: 
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                   elevation: 0,
                   padding: EdgeInsets.zero,
                   primary:  Colors.transparent,
                   onPrimary: Color(0xFFEF5350),
                   shape: CircleBorder(),
                ),
                
                onPressed: () {Navigator.of(context ,rootNavigator: true).pop();},
                child: Icon(
                  Icons.arrow_back_ios,
                  size: 20,
                ),
              )
       ),
    );
  }
}






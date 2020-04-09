import 'package:covidntn/utils/covid_country.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:responsive_container/responsive_container.dart';

class LoadedCovidCountryDisplay extends StatelessWidget
{
  final CovidCountry covidCountry;
  final formatter = new NumberFormat("#,###");
  
  LoadedCovidCountryDisplay({Key key, @required this.covidCountry}) : super(key:key);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ResponsiveContainer(
        padding: EdgeInsets.only(top: 10, bottom: 10),
        heightPercent: 90.0,
        widthPercent: 100.0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          ListTile(
            title: Text(covidCountry.getCountry.toString().toUpperCase(), style: TextStyle(
            fontSize: 18.0,fontFamily: 'Cynzia', fontWeight: FontWeight.bold, color: Colors.green
            ),
            ),
            trailing: Image.network(this.covidCountry.getImageUrl, width: 48, height: 48.0),
          ),
          Divider(
            color: Theme.of(context).accentColor,
          ),
          SizedBox(height: 3.0,),
          ListTile(
              trailing: Icon(FontAwesomeIcons.headSideVirus, size: 20.0,color: Colors.yellow,),
              title: Text("Total Cases", style: TextStyle(color: Colors.white,fontFamily: 'Cynzia', fontSize: 14.0)),
              subtitle: Text(formatter.format(covidCountry.getCases).toString(), style: TextStyle(color: Colors.yellow, fontSize: 22.0)),
          ),
             ListTile(
              trailing: Icon(FontAwesomeIcons.ambulance, size: 20.0,color: Colors.blue,),
              title: Text("Today Cases", style: TextStyle(color: Colors.white,fontFamily: 'Cynzia', fontSize: 14.0)),
              subtitle: Text(formatter.format(covidCountry.getTodayCases).toString(), style: TextStyle(color: Colors.blue, fontSize: 22.0)),
             ),
            ListTile(
              trailing: Icon(FontAwesomeIcons.shieldAlt, size: 20.0,color: Colors.green,),
              title: Text("Total Recovered", style: TextStyle(color: Colors.white,fontFamily: 'Cynzia', fontSize: 14.0)),
              subtitle: Text(formatter.format(covidCountry.getRecovered).toString(), style: TextStyle(color: Colors.green, fontSize: 22.0)),  
            ),
             ListTile(
              trailing: Icon(FontAwesomeIcons.shieldAlt, size: 20.0,color: Colors.red,),
              title: Text("Total Deaths", style: TextStyle(color: Colors.white,fontFamily: 'Cynzia', fontSize: 14.0)),
              subtitle: Text(formatter.format(covidCountry.getDeaths).toString(), style: TextStyle(color: Colors.red, fontSize: 22.0)),  
            ),
             ListTile(
              trailing: Icon(FontAwesomeIcons.diagnoses, size: 20.0,color: Colors.orange,),
              title: Text("Total Active", style: TextStyle(color: Colors.white,fontFamily: 'Cynzia', fontSize: 14.0)),
              subtitle: Text(formatter.format(covidCountry.getActive).toString(), style: TextStyle(color: Colors.orange, fontSize: 22.0)),  
            ),
             ListTile(
              trailing: Icon(FontAwesomeIcons.procedures, size: 20.0,color: const Color(0xffeeff41),),
              title: Text("Total Critical", style: TextStyle(color: Colors.white,fontFamily: 'Cynzia', fontSize: 14.0)),
              subtitle: Text(formatter.format(covidCountry.getCritical).toString(), style: TextStyle(color: const Color(0xffeeff41), fontSize: 22.0)),  
            ),
      ],),
    );
  }
  
}
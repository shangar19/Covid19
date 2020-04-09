import 'dart:convert';

import 'package:covidntn/bloc/condid_bloc.dart';
import 'package:covidntn/bloc/covid_event.dart';
import 'package:covidntn/models/CountryList.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;

class CovidControl  extends StatefulWidget
{
  @override
  _CovidControlState createState() => _CovidControlState();
  
}

class _CovidControlState extends State<CovidControl>
{
  String _selectedCountry;
  Color _selectedColor = Colors.white;
 List countryList = List();

    Future<String> loadCountriesFromFile() async {
    return await rootBundle.loadString('lib/json/countries.json');
  }

  Future<String> _populateDropdown() async {
    String getCountries= await loadCountriesFromFile();
    final jsonResponse = json.decode(getCountries);

    CountryList places = new CountryList.fromJson(jsonResponse);

    setState(() {
      countryList = places.country;
      //print(places.country);
    });

    //return countryList.toString();
  }


  void initState(){
    super.initState();
  this. _populateDropdown();
  }



  /*Future<List<Countries>> _fetchCountries() async
  {
    var response = await http.get('https://covid19.mathdro.id/api/countries/');
    print(response.body);
     if (response.statusCode == 200) {
        
      final items = json.decode(response.body)['countries'];

      print(items);

      for(var c in items )
      { 
         // print(c['name']);
           Countries countries = Countries(c["name"],c["iso2"],c["iso3"]);
          _countries.add(countries);
      }
     // print(_countries.length);
      return _countries;
    } else {
      throw Exception('Failed to load');
    }
  }*/

  @override
  Widget build(BuildContext context) {

    // TODO: implement build
    return Column(
      children: <Widget>[
        Container(
            child:Form(
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: DropdownButtonFormField(
                  decoration: InputDecoration(
                    labelStyle: TextStyle(color: Colors.white),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(
                        color: Colors.green.withOpacity(0.5)
                      )
                    ),
                    contentPadding: const EdgeInsets.all(12.0),
                   ),
                  isExpanded: false,
                  isDense: true,
                  style: TextStyle(color: _selectedColor),
                  icon: Icon(FontAwesomeIcons.globe, color: Colors.green,),
                  items: countryList.map((item){
                    return new DropdownMenuItem(
                      child: Text(item.name, style: TextStyle(color: Colors.green,fontFamily: 'Cynzia',),),
                      value: item.iso2.toString(),);

                  }).toList(),
                  onChanged: (neVal){
                    setState(() {
                      _selectedCountry = neVal;
                      _selectedColor = Colors.white;
                    });
                  },
                  value: _selectedCountry,
                  hint: Text("Please choose a location", style: TextStyle(color:Colors.green,fontFamily: 'Cynzia',))
              ),
                ),
            ),
            ),
        Padding(padding: EdgeInsets.only(top:5.0)),
        Row(
          children: <Widget>[
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 50.0,
                  child: RaisedButton(
                    elevation: 2.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(10.0),
                      side: BorderSide(color:Theme.of(context).accentColor)
                    ),
                    color:  Theme.of(context).accentColor,
                    child: Text('Search', style: TextStyle(color:Colors.green,fontFamily: 'Cynzia', fontSize: 20.0,fontWeight: FontWeight.bold)),
                    onPressed: (){
                      BlocProvider.of<CovidBloc>(context).dispatch(
                                GetCountrySpecificCovidInfoEvent(country: _selectedCountry));
                    }),
                ),
              ),
            )
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(
            top: 5,
            bottom: 5,
          ),)
      ]
    );
  }
}

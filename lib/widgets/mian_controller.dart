import 'package:covidntn/bloc/condid_bloc.dart';
import 'package:covidntn/bloc/covid_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MainController extends StatelessWidget
{

  MainController({Key key}) : super(key : key);

  
  
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Chip(
          avatar: Icon(FontAwesomeIcons.globe, color: Colors.white),
          backgroundColor: Theme.of(context).accentColor,
          label: Text("WORLD", style:TextStyle(fontSize: 24.0, fontFamily: 'Cynzia', color: Colors.white, fontWeight: FontWeight.bold,
          letterSpacing: 3,)),
        ),

            Padding(
          padding: EdgeInsets.only(
            left: 15,
            right: 15,
          ),
        ),
        RaisedButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50.0),
            side: BorderSide(color: Colors.green)
          ),
          color: Colors.green,
          child: Icon(Icons.refresh, color: Colors.white,),
          onPressed: (){
            BlocProvider.of<CovidBloc>(context).dispatch(GetAllCovidInfoEvent());
          },
        )
      ],
    );
  }

}
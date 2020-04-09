import 'package:covidntn/bloc/condid_bloc.dart';
import 'package:covidntn/bloc/covid_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_sim_country_code/flutter_sim_country_code.dart';
import 'package:flutter/services.dart';
//import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LocalController extends StatefulWidget
{

  LocalController({Key key}) : super(key : key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _LocalControllerState();
  }

}

class _LocalControllerState extends State<LocalController>
{
  String _platformVersion = 'lk';
  String imageExt = ".png";
    @override

  void initState() {
    super.initState();
    initPlatformState();
  }

  Widget build(BuildContext context) {
    // TODO: implement build
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Chip(
          avatar: Container(
            width: 24.0,
            height: 24.0,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                fit: BoxFit.fill,
                image: NetworkImage('https://raw.githubusercontent.com/NovelCOVID/API/master/assets/flags/$_platformVersion$imageExt')
                )
            )),
           backgroundColor: Theme.of(context).accentColor,
           label: Text("LOCAL", style:TextStyle(fontSize: 24.0, fontFamily: 'Cynzia',color: Colors.white, fontWeight: FontWeight.bold,
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
            BlocProvider.of<CovidBloc>(context).dispatch(GetLocalSpecificCovidInfoEvent());
          },
        )
      ],
    );
  }

  Future<void> initPlatformState() async {
    String platformVersion;
    try {
      platformVersion = await FlutterSimCountryCode.simCountryCode;
    } on PlatformException {
      platformVersion = 'Failed to get platform version.';
    }
    if (!mounted) return;

    setState(() {
      _platformVersion = platformVersion.toLowerCase();
    });
  }
}
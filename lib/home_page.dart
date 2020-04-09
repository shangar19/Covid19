import 'package:covidntn/bloc/condid_bloc.dart';
import 'package:covidntn/bloc/covid_state.dart';
import 'package:covidntn/widgets/CovidControl.dart';
import 'package:covidntn/widgets/CustomDialog.dart';
import 'package:covidntn/widgets/ErrorStateDisplay.dart';
import 'package:covidntn/widgets/empty_state_display.dart';
import 'package:covidntn/widgets/get_LoadedCovidCountry_display.dart';
import 'package:covidntn/widgets/get_LoadingStateDisplayGetLocalEventDispatch.dart';
import 'package:covidntn/widgets/get_LodededDipalyCovidAll.dart';
import 'package:covidntn/widgets/get_loadingStateDisplayGetAllEventDispatch.dart';
import 'package:covidntn/widgets/get_local_covifinfodisplay.dart';
import 'package:covidntn/widgets/loading_state_display.dart';
import 'package:covidntn/widgets/local_control.dart';
import 'package:covidntn/widgets/mian_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:covidntn/injection.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomePage extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        elevation: 2.0,
        automaticallyImplyLeading: false,
        backgroundColor: Theme.of(context).accentColor,
        title: Image.asset('lib/images/header_logo.png', height: 25.0,),
        actions: <Widget>[
          IconButton(icon: Icon(FontAwesomeIcons.infoCircle, color: Colors.green), onPressed: (){
            _showDialog(context);
          })
          /*PopupMenuButton(
            elevation: 10.0,
            offset: Offset(0, 55),
            onSelected: (val){
              if(val == 'About')
              {
                  _showDialog(context);
              }
            },
            itemBuilder: (BuildContext context) {
             return [
               PopupMenuItem(child: Text("About", style: TextStyle(color:  Colors.black),), value: "About",),
               //PopupMenuItem(child: Text("About Developer", style: TextStyle(color:  Colors.black),), value: "ADS",),
             ];
          })*/
        ],
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(child: Padding(
          padding: EdgeInsets.all(12.0),
            child: Column(
              children: <Widget>[
                _buildHeader(context),
                Padding(padding: EdgeInsets.only(top: 12.0, bottom: 12.0)),
                _localHeader(context),
                 Padding(padding: EdgeInsets.only(top: 12.0, bottom: 12.0)),
                 _countrylHeader(context)
              ],
            ),
          ),
          ),
      ),
    );
  }

  _showDialog(BuildContext context)
  {
     return showDialog(
       context: context,
       builder: (BuildContext context) => CustomDialog(title: 'COVID19 V1.0', description: 'COVID19 News App with Latest Updates', buttonText: 'Close')
       );
  }

  BlocProvider<CovidBloc> _buildHeader(BuildContext context)
  {
     return BlocProvider(
        builder: (context) => cv<CovidBloc>(),
        child: Column(
          children: <Widget>[
            SizedBox(height: 12.0,),
           MainController(),
            Padding(padding: 
            EdgeInsets.only(top:12.0, bottom: 12.0 ),
            ),

            BlocBuilder<CovidBloc, CovidState>(builder: (context, state){
              if(state is Empty)
              {
                 return new LoadingStateDisplayGetAllEventDispatch() ;
              }
              else if(state is LoadedCovidAll)
              {
                  return new LodededDipalyCovidAll(covidProp: state.coviProp,);
              }
              else if(state is ErrorAll)
              {
                  return ErrorStateDisplay(errorMessage: state.message,);
              }
              else {
                  return Text(state.toString());
              }
            },)
          ],
        ),
     );
  }

  BlocProvider<CovidBloc> _localHeader(BuildContext context)
  {
     return BlocProvider(
        builder: (context) => cv<CovidBloc>(),
        child: Column(
          children: <Widget>[
            SizedBox(height: 12.0,),
           LocalController(),
            Padding(padding: 
            EdgeInsets.only(top:12.0, bottom: 12.0 ),
            ),

            BlocBuilder<CovidBloc, CovidState>(builder: (context, state){
              if(state is Empty)
              {
                 return new LoadingStateDisplayGetLocalEventDispatch() ;
              }
              else if(state is LoadedCovidLocal)
              {
                  return new LodededDipalyCovidLocal(localCovid: state.covidlocal);
              }
              else if(state is ErrorLocal)
              {
                  return ErrorStateDisplay(errorMessage: state.localmessage,);
              }
              else {
                  return Text(state.toString());
              }
            },)
          ],
        ),
     );
  }

   BlocProvider<CovidBloc> _countrylHeader(BuildContext context)
  {
     return BlocProvider(
        builder: (context) => cv<CovidBloc>(),
        child: Column(
          children: <Widget>[
            
            Text('Update of Country COVID19', style: TextStyle(
              color: Colors.white,fontFamily: 'Cynzia',
              fontSize: 20.0, fontWeight: FontWeight.bold
            ),),
              Padding(
            padding: EdgeInsets.only(
              top: 2.5,
              bottom: 2.5,
            ),
          ),

            BlocBuilder<CovidBloc, CovidState>(builder: (context, state){
              if(state is Empty)
              {
                 return EmptyStateDisplay(message: 'Select country and get details', messageColor: Colors.green,) ;
              }
              else if(state is Loading)
              {
                  return LoadingStateDisplay();
              }
              else if(state is Error)
              {
                  return ErrorStateDisplay(errorMessage: state.message,);
              }
              else if(state is LoadedCovidCountry)
              {
                 return LoadedCovidCountryDisplay(covidCountry: state.covidCountry,);
              }
              else {
                  return Text(state.toString());
              }
            },
            ),
            CovidControl(),
          ],
        ),
     );
  }

}
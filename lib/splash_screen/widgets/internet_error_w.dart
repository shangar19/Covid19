import 'package:covidntn/splash_screen/bloc/splash_screen_bloc.dart';
import 'package:covidntn/splash_screen/bloc/splash_screen_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class InternetErrorWidget extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Center(
        child: Column(
           mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Center(
                child:Image.asset('lib/images/no_internet.png',height: 250, width: 250,)
            ),
            SizedBox(height: 25),
            Center(
                child:Text('Whoops!', style: TextStyle(color: Colors.white, letterSpacing: 3.0, fontSize: 24.0, decoration: TextDecoration.none)),
            ),
            SizedBox(height: 6),
            Center(
                child:Text('NO INTERNET ACCESS', style: TextStyle(color: Colors.white, letterSpacing: 3.0, fontSize: 18.0, decoration: TextDecoration.none)),
            ),
            SizedBox(height: MediaQuery.of(context).size.height *0.15,),
            /*RaisedButton(
                    elevation: 2.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(10.0),
                      side: BorderSide(color:Theme.of(context).accentColor)
                    ),
                    color:  Theme.of(context).accentColor,
                    child: Text('CONNECT TO INTERNET', style: TextStyle(color:Colors.green,fontFamily: 'Cynzia', letterSpacing: 2.0, fontSize: 20.0,fontWeight: FontWeight.bold)),
                    onPressed: (){
                       BlocProvider.of<SplashScreenBloc>(context).dispatch(
                  NavigateToMainScreenEvent());
                    }
            )*/
            FloatingActionButton(
              elevation: 2.0,
              backgroundColor: Colors.green,
              child: Center(
                child: Icon(
                  Icons.wifi,
                  color: Theme.of(context).primaryColor,
                  size: 30,
                ),
              ),
              onPressed: (){
                       BlocProvider.of<SplashScreenBloc>(context).dispatch(
                  NavigateToMainScreenEvent());
                    }
              
            )
          ],
        ),
      ),
    );
  }
}
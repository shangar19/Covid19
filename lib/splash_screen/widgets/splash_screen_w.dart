import 'package:covidntn/splash_screen/bloc/splash_screen_bloc.dart';
import 'package:covidntn/splash_screen/bloc/splash_screen_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';

class SplashScreenWidget extends StatefulWidget
{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _SplashScreenWidgetState();
  }

}

class _SplashScreenWidgetState extends State<SplashScreenWidget>
{
  void initState()
  {
    super.initState();
    this._dispatchEvent(context);
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
           /* Center(
              /*child: Text(
                'COVID-19', style:TextStyle(color: Colors.green, letterSpacing: 2.0, fontSize: 48.0, decoration: TextDecoration.none) ,
              ),*/
              child: Image.asset('lib/images/header_logo.png', height: 60, width: 200,)
            ),
             Padding(
              padding: EdgeInsets.only(
                top: 10,
                bottom: 10,
              ),
            ),
             Center(
              child: Text(
                'UPDATES', style:TextStyle(color: Colors.green, letterSpacing: 2.0, fontSize: 30.0, decoration: TextDecoration.none) ,
              ),
            ),
              Padding(
              padding: EdgeInsets.only(
                top: 40,
                bottom: 10,
              ),
            ),*/
            ClipPath(
              clipper: DiagonalPathClipperTwo(),
              child: Container(
               // color: Colors.pink,
                decoration: BoxDecoration(
                  image: DecorationImage(image: AssetImage('lib/images/background.jpg'),
                  fit: BoxFit.fill
                  ),
                  color: Colors.transparent
                ),
                height: MediaQuery.of(context).size.height / 2 - 10,
              ),
            ),
            SizedBox(height: 50,),
            Center(
              /*child: Text(
                'COVID-19', style:TextStyle(color: Colors.green, letterSpacing: 3.0, fontSize: 44.0, decoration: TextDecoration.none) ,
              ),*/
              child: Image.asset('lib/images/header_text.png', height: 96, width: 286,)
            ),
             SizedBox(height: 4,),
               Center(
              child: Image.asset('lib/images/sub_header.png', height: 44, width: 108,)
            ),
            SizedBox(height: 35,),
            Center(
              child: CircularProgressIndicator(
                backgroundColor: Colors.green,
              ),
            )
          ],
        ),
    );
  }
void _dispatchEvent(BuildContext context) {
    BlocProvider.of<SplashScreenBloc>(context).dispatch(
      NavigateToMainScreenEvent(),
    );
  }
}
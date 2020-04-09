import 'package:covidntn/utils/covi_prop.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';

class LodededDipalyCovidAll extends StatelessWidget
{
  final CoviProp covidProp;
  final formatter = new NumberFormat("#,###");
  
  LodededDipalyCovidAll({@required this.covidProp});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
       height: MediaQuery.of(context).size.height/ 4.5,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          Row(
            children: <Widget>[
              //Total Case Container
              Container(
                height: MediaQuery.of(context).size.height / 3.6,
                width:MediaQuery.of(context).size.height / 3.6,
                child: Card(
                  color: Theme.of(context).accentColor ,
                   margin: EdgeInsets.all(5),
                   elevation: 2.0,
                   shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text("Confirmed" ,
                        style: TextStyle(
                          color: Colors.white,
                          letterSpacing: 2,
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Cynzia'
                        ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            top: 10,
                            bottom: 5,
                          ),
                        ),
                         Text(formatter.format(covidProp.getCases).toString(),
                        style: TextStyle(
                          color: Colors.yellow,
                          letterSpacing: 2,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                        ),
                        ),
                        Padding(padding: EdgeInsets.only(top:10, bottom: 5.0)),
                        Icon(FontAwesomeIcons.headSideVirus, color: Colors.yellow, size: 20.0,)
                      ],
                    ),
                  ),
                ),
              ),
              //Total Recorver Cases
              Container(
                  height: MediaQuery.of(context).size.height / 3.6,
                width:MediaQuery.of(context).size.height / 3.6,
                child: Card(
                  color: Theme.of(context).accentColor ,
                   margin: EdgeInsets.all(5),
                   elevation: 2.0,
                   shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text("Recorvered" ,
                        style: TextStyle(
                          color: Colors.white,
                          letterSpacing: 2,
                          fontFamily: 'Cynzia',
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                        ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            top: 10,
                            bottom: 5,
                          ),
                        ),
                         Text(formatter.format(covidProp.getRecovered).toString(),
                        style: TextStyle(
                          color: Colors.green,
                          letterSpacing: 2,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                        ),
                        ),
                        Padding(padding: EdgeInsets.only(top:10, bottom: 5.0)),
                        Icon(FontAwesomeIcons.shieldAlt, color: Colors.green, size: 20.0,)
                      ],
                    ),
                  ),
                ),
              ),
              //Total Death Cases
              Container(
                  height: MediaQuery.of(context).size.height / 3.6,
                width:MediaQuery.of(context).size.height / 3.6,
                child: Card(
                  color: Theme.of(context).accentColor ,
                   margin: EdgeInsets.all(5),
                   elevation: 2.0,
                   shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text("Deaths" ,
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Cynzia',
                          letterSpacing: 2,
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                        ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            top: 10,
                            bottom: 5,
                          ),
                        ),
                         Text(formatter.format(covidProp.getDeaths).toString(),
                        style: TextStyle(
                          color: Colors.red,
                          letterSpacing: 2,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                        ),
                        ),
                        Padding(padding: EdgeInsets.only(top:10, bottom: 5.0)),
                        Icon(FontAwesomeIcons.procedures, color: Colors.red, size: 20.0,)
                      ],
                    ),
                  ),
                ),
              ),
              //Active Cases
              Container(
                  height: MediaQuery.of(context).size.height / 3.6,
                width:MediaQuery.of(context).size.height / 3.6,
                child: Card(
                  color: Theme.of(context).accentColor ,
                   margin: EdgeInsets.all(5),
                   elevation: 2.0,
                   shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text("Active" ,
                        style: TextStyle(
                          fontFamily: 'Cynzia',
                          color: Colors.white,
                          letterSpacing: 2,
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                        ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            top: 10,
                            bottom: 5,
                          ),
                        ),
                         Text(formatter.format((this.covidProp.getCases -
                                  this.covidProp.getDeaths -
                                  this.covidProp.getRecovered)).toString(),
                        style: TextStyle(
                          color: Colors.orange,
                          letterSpacing: 2,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                        ),
                        ),
                        Padding(padding: EdgeInsets.only(top:10, bottom: 5.0)),
                        Icon(FontAwesomeIcons.diagnoses, color: Colors.orange, size: 20.0,)
                      ],
                    ),
                  ),
                ),
              )
            ],
          )
        ]
      
      ,)
    );
  }
}
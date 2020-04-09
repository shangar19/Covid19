import 'package:covidntn/utils/covi_prop.dart';
import 'package:covidntn/utils/covid_country.dart';
import 'package:flutter/material.dart';

abstract class CovidState {}

class Empty extends CovidState {}

class Loading extends CovidState {}

class LoadingAll extends CovidState {}

class LoadedCovidAll extends CovidState {

  final CoviProp coviProp;

  LoadedCovidAll({@required this.coviProp});

}

class LoadedCovidCountry extends CovidState {

  final CovidCountry covidCountry;

  LoadedCovidCountry({@required this.covidCountry});

}

class LoadedCovidLocal extends CovidState
{
   final CovidCountry covidlocal;
   LoadedCovidLocal({@required this.covidlocal});
}

class Error extends CovidState {

  final String message;

  Error({@required this.message});

}

class ErrorAll extends CovidState {

  final String message;

  ErrorAll({@required this.message});

}

class ErrorLocal extends CovidState {

  final String localmessage;

  ErrorLocal({@required this.localmessage});

}
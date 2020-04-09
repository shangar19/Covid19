import 'package:flutter/material.dart';

abstract class CovidEvent {
}

class GetAllCovidInfoEvent extends CovidEvent{}

class GetCountrySpecificCovidInfoEvent extends CovidEvent{
  final String country;

  GetCountrySpecificCovidInfoEvent({@required this.country});
  
}

class GetLocalSpecificCovidInfoEvent extends CovidEvent{}
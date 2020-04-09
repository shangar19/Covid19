import 'dart:convert';

import 'package:covidntn/models/covd_country_model.dart';
import 'package:covidntn/models/covid_all_model.dart';
import 'package:covidntn/services/error.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

abstract class CovidRemoteData
{
    Future<CovidAllModel> getAllCovidInfo();

    Future<CovidCountryModel> getCountrySpecificInfo(String country);
}

class CovidRemoteDataImpl extends CovidRemoteData
{

  http.Client _httpClient;

  CovidRemoteDataImpl({@required http.Client httpClient})
  {
     this._httpClient = httpClient;
  }

  @override
  Future<CovidAllModel> getAllCovidInfo() async {
    // TODO: implement getAllCovidInfo
    final response = await this. _httpClient.get('https://corona.lmao.ninja/all');
    if(response.statusCode == 200)
    {
      return CovidAllModel.fromJson(json.decode(response.body));
    }
    else
    {
       throw ServerException();
    }
  }

  @override
  Future<CovidCountryModel> getCountrySpecificInfo(String country) async {
    // TODO: implement getCountrySpecificInfo

     final response = await this. _httpClient.get('https://corona.lmao.ninja/countries/$country');
    if(response.statusCode == 200)
    {
      //print(json.decode(response.body));
      return CovidCountryModel.fromJson(json.decode(response.body));
    }
    else
    {
       throw ServerException();
    }
  }
  
}
import 'dart:convert';

import 'package:covidntn/models/covd_country_model.dart';
import 'package:covidntn/models/covid_all_model.dart';
import 'package:covidntn/services/error.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class CovidLocadata{

  Future<CovidCountryModel> getLstCountrySpecficInfo();

  Future<CovidAllModel> getLastCovidAllinfo();

  Future<void> cacheCovidAllinfo(CovidAllModel covidAllModel);

  Future<void> cacheCountryCovidinfo(CovidCountryModel covidCountryModel);

}

class CovidLocaDataImpl implements CovidLocadata
{
  SharedPreferences _sharedPref;


    CovidLocaDataImpl({@required SharedPreferences sharedPreferences})
    {
        this._sharedPref = sharedPreferences;
    }
  @override
  Future<void> cacheCountryCovidinfo(CovidCountryModel covidCountryModel) {
    // TODO: implement cacheCountryCovidinfo
    return this._sharedPref.setString('CACHED_COUNTRY_INFO', json.encode(covidCountryModel.toJson()));
  }

  @override
  Future<void> cacheCovidAllinfo(CovidAllModel covidAllModel) {
    // TODO: implement cacheCovidAllinfo
    return this._sharedPref.setString('CACHED_CVALL', json.encode(covidAllModel.toJson()));
  }

  @override
  Future<CovidAllModel> getLastCovidAllinfo() {
    // TODO: implement getLastCovidAllinfo
    final String cacheCovidAll = this._sharedPref.getString("CACHED_CVALL");
    if(cacheCovidAll != null)
    {
       return Future.value(CovidAllModel.fromJson(json.decode(cacheCovidAll)));
    }
    else
    {
      throw CacheException();
    }
  }

  @override
  Future<CovidCountryModel> getLstCountrySpecficInfo() {
    // TODO: implement getLstCountrySpecficInfo
    final String cacheCountryInfo= this._sharedPref.getString("CACHED_COUNTRY_INFO");
    if(cacheCountryInfo != null)
    {
       return Future.value(CovidCountryModel.fromJson(json.decode(cacheCountryInfo)));
    }
    else
    {
      throw CacheException();
    }
  }
  
}
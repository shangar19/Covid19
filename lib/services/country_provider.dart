import 'package:covidntn/models/countries.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CountryProvider  with ChangeNotifier
{
    CountryModel countryModel;

    Future<CountryModel> getCountryProvider() async
    {
        CountryModel countryModel;
        final response = await http.get("https://covid19.mathdro.id/api/countries/");
        print(response.statusCode);
        if(response.statusCode == 200)
        {
            var res = countryModelFromJson(response.body);
            countryModel = res;
           return countryModel;
        }
        else
        {
          return null;
        }

    }
}
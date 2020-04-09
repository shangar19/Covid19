import 'package:covidntn/services/covid_repo.dart';
import 'package:covidntn/services/failure.dart';
import 'package:covidntn/utils/covid_country.dart';
import 'package:covidntn/utils/use_cases.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

class GetCountrySpecificInfo implements UseCase<CovidCountry, String>
{
    CovidRepo _covidRepo;

    GetCountrySpecificInfo({@required CovidRepo covidRepo})
    {
        this._covidRepo = covidRepo;
    }

  @override
  Future<Either<Failure, CovidCountry>> call(String country) async {
    // TODO: implement call
    return await this._covidRepo.getCountrySpecificInfo(country);
  }


}
import 'package:covidntn/services/covid_repo.dart';
import 'package:covidntn/services/failure.dart';
import 'package:covidntn/utils/covid_country.dart';
import 'package:covidntn/utils/use_cases.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

class GetLocalSpecificInfo implements UseCase<CovidCountry, NoParams>
{
    CovidRepo _covidRepo;

    GetLocalSpecificInfo({@required CovidRepo covidRepo})
    {
        this._covidRepo = covidRepo;
    }

  @override
  Future<Either<Failure, CovidCountry>> call(NoParams params) async {
    // TODO: implement call
    return await this._covidRepo.getAllCovidLocalInfo();
  }

}
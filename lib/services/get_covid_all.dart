import 'package:covidntn/services/covid_repo.dart';
import 'package:covidntn/services/failure.dart';
import 'package:covidntn/utils/covi_prop.dart';
import 'package:covidntn/utils/use_cases.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

class GetAllCovidInfo implements UseCase<CoviProp, NoParams>
{
    CovidRepo _covidRepo;

    GetAllCovidInfo({@required CovidRepo covidRepo})
    {
        this._covidRepo = covidRepo;
    }

  @override
  Future<Either<Failure, CoviProp>> call(NoParams params) async {
    // TODO: implement call
    return await this._covidRepo.getAllCovidInfo();
  }
}
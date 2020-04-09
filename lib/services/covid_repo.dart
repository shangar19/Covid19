import 'package:covidntn/services/failure.dart';
import 'package:covidntn/utils/covi_prop.dart';
import 'package:covidntn/utils/covid_country.dart';
import 'package:dartz/dartz.dart';

abstract class CovidRepo
{

  Future<Either<Failure,CoviProp>> getAllCovidInfo();
  Future<Either<Failure,CovidCountry>> getCountrySpecificInfo(String country);
  Future<Either<Failure,CovidCountry>> getAllCovidLocalInfo();
}



import 'package:covidntn/services/api_local_service.dart';
import 'package:covidntn/services/api_remote_service.dart';
import 'package:covidntn/services/error.dart';
import 'package:covidntn/services/failure.dart';
import 'package:covidntn/services/network_info.dart';
import 'package:covidntn/utils/covi_prop.dart';
import 'package:covidntn/utils/covid_country.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

import 'covid_repo.dart';

class CovidRepoImpl implements CovidRepo {

  CovidRemoteData _covidRemoteDataSource;
  CovidLocadata _covidLocalDataSource;
  NetworkInfo _networkInfo;

  CovidRepoImpl(
      {@required CovidRemoteData covidRemoteDataSource,
      @required CovidLocadata covidLocalDataSource,
      @required NetworkInfo networkInfo})
       {
    this._covidLocalDataSource = covidLocalDataSource;
    this._covidRemoteDataSource = covidRemoteDataSource;
    this._networkInfo = networkInfo;
  }

  @override
  Future<Either<Failure, CoviProp>> getAllCovidInfo() async {
    // TODO: implement getAllCovidInfo
    if (await _networkInfo.isConnected) {
      try {
        final _finalCovidAllModel =
            await _covidRemoteDataSource.getAllCovidInfo();
        await _covidLocalDataSource.cacheCovidAllinfo(_finalCovidAllModel);
        return Right(_finalCovidAllModel);
      } on ServerException {
        return (Left(ServerFaliure()));
      }
    } else {
      try {
        final _finalCovidAllModel =
            await _covidLocalDataSource.getLastCovidAllinfo();
        return Right(_finalCovidAllModel);
      } on CacheException {
        return (Left(CacheFaliure()));
      }
    }
  }

  @override
  Future<Either<Failure, CovidCountry>> getCountrySpecificInfo(String country) async {
    // TODO: implement getCountrySpecificInfo
     if (await _networkInfo.isConnected) {

        try {
        final _finalCovidCountryModel =
            await _covidRemoteDataSource.getCountrySpecificInfo(country);
        await _covidLocalDataSource.cacheCountryCovidinfo(_finalCovidCountryModel);
        return Right(_finalCovidCountryModel);
      } on ServerException {
        return (Left(ServerFaliure()));
      } 
    } else {
      try {
        final _finalCovidCountryModel =
            await _covidLocalDataSource.getLstCountrySpecficInfo();
        return Right(_finalCovidCountryModel);
      } on CacheException {
        return (Left(CacheFaliure()));
      }
     }
  }

  @override
  Future<Either<Failure, CovidCountry>> getAllCovidLocalInfo() {
    // TODO: implement getAllCovidLocalInfo
    return this.getCountrySpecificInfo('LK');
  }

}
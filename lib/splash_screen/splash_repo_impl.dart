import 'package:covidntn/services/failure.dart';
import 'package:covidntn/services/network_info.dart';
import 'package:covidntn/splash_screen/entity.dart';
import 'package:covidntn/splash_screen/splash_screen_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

class SplashScreenRepoImpl implements SplashScreenRepo {
  NetworkInfo _networkInfo;

  SplashScreenRepoImpl({@required NetworkInfo networkInfo}) {
    this._networkInfo = networkInfo;
  }

  @override
  Future<Either<Failure, EmptyEntity>> navigateToMainScreen() async {
    await Future.delayed(
      Duration(seconds: 4),
    );
    if (await this._networkInfo.isConnected) {
      return Right(EmptyEntity());
    } else {
      return Left(InternetConnectionFaliure());
    }
  }
}
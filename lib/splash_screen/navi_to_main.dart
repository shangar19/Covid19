import 'package:covidntn/services/failure.dart';
import 'package:covidntn/splash_screen/entity.dart';
import 'package:covidntn/splash_screen/splash_screen_repo.dart';
import 'package:covidntn/utils/use_cases.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

class NavigateToMainScreen implements UseCase<EmptyEntity,NoParams>{
  SplashScreenRepo _splashScreenRepo;

  NavigateToMainScreen({@required SplashScreenRepo splashScreenRepo}) {
    this._splashScreenRepo = splashScreenRepo;
  }

  @override
  Future<Either<Failure, EmptyEntity>> call(NoParams params) async {
    return await this._splashScreenRepo.navigateToMainScreen();
  }


}
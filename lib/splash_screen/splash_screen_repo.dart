import 'package:covidntn/services/failure.dart';
import 'package:dartz/dartz.dart';

import 'entity.dart';

abstract class SplashScreenRepo {
  Future<Either<Failure,EmptyEntity>> navigateToMainScreen();
}
import 'package:covidntn/services/failure.dart';
import 'package:dartz/dartz.dart';

abstract class UseCase<Type,Params> {
  Future<Either<Failure,Type>> call(Params params);
}

class NoParams {}
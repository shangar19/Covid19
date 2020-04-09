import 'package:covidntn/services/failure.dart';
import 'package:dartz/dartz.dart';

class InputConverter {
  Either<Failure, String> check(String str) {
    try {
      if (str.isEmpty) throw FormatException();
      final alphanumeric = RegExp('[a-zA-Z]');
      final response = alphanumeric.hasMatch(str);
      if (!response) throw FormatException();
      return Right(str);
    } on FormatException {
      return Left(InvalidInputFaliure());
    }
  }
}
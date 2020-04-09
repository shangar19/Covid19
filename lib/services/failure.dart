import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  Failure([List props = const <dynamic>[]]) : super(props);
}

//General Faliures

class ServerFaliure extends Failure {}

class CacheFaliure extends Failure {}

class InvalidInputFaliure extends Failure{}

class InternetConnectionFaliure extends Failure{}
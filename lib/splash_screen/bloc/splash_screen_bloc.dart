import 'package:covidntn/splash_screen/bloc/splash_screen_event.dart';
import 'package:covidntn/splash_screen/bloc/splash_screen_state.dart';
import 'package:covidntn/splash_screen/navi_to_main.dart';
import 'package:covidntn/utils/use_cases.dart';
import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashScreenBloc extends Bloc<SplashScreenEvent, SplashScreenState> {
  NavigateToMainScreen _navigateToMainScreen;

  SplashScreenBloc({@required NavigateToMainScreen navigateToMainScreen}) {
    this._navigateToMainScreen = navigateToMainScreen;
  }

  @override
  SplashScreenState get initialState => Initial();


  @override
  Stream<SplashScreenState> mapEventToState(
    SplashScreenEvent event,
  ) async* {
    if (event is NavigateToMainScreenEvent) {
      yield Loading();
      final response = await this._navigateToMainScreen.call(
            NoParams(),
          );
      yield response.fold(
        (faliure) => InternetError(),
        (_) => Loaded(),
      );
    }
  }
}
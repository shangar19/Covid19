import 'package:covidntn/home_page.dart';
import 'package:covidntn/splash_screen/bloc/splash_screen_bloc.dart';
import 'package:covidntn/splash_screen/bloc/splash_screen_state.dart';
import 'package:covidntn/splash_screen/widgets/internet_error_w.dart';
import 'package:covidntn/splash_screen/widgets/splash_screen_w.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../injection.dart';

class SplashScreen extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return _buildBody(context);
  }

  BlocProvider<SplashScreenBloc> _buildBody(BuildContext context) {
    return BlocProvider(
      builder: (context) => cv<SplashScreenBloc>(),
      child: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
        ),
        child: Center(
          child: BlocBuilder<SplashScreenBloc, SplashScreenState>(
            condition: (prev, cur) {
              if ((prev == Loading()) && (cur == Loaded())) {
                return false;
              }
              return true;
            },
            builder: (context, state) {
              if ((state is Initial) || (state is Loading)) {
                return SplashScreenWidget();
              } else if (state is Loaded) {
                return HomePage();
              } else if (state is InternetError) {
                return InternetErrorWidget();
              }
            },
          ),
        ),
      ),
    );
  }
  
}
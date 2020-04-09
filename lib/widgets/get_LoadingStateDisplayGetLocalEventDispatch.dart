import 'package:covidntn/bloc/condid_bloc.dart';
import 'package:covidntn/bloc/covid_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoadingStateDisplayGetLocalEventDispatch extends StatefulWidget
{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _LoadingStateDisplayGetLocalEventDispatch();
  }

}

class _LoadingStateDisplayGetLocalEventDispatch extends State<LoadingStateDisplayGetLocalEventDispatch>
{

  void initState()
  {
    super.initState();
    BlocProvider.of<CovidBloc>(context).dispatch(GetLocalSpecificCovidInfoEvent());
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      padding: EdgeInsets.only(top: 10, bottom: 20),
      height: (MediaQuery.of(context).size.height) / 4.5,
      child: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
  
}
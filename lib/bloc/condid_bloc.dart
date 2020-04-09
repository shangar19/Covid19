import 'package:covidntn/bloc/covid_event.dart';
import 'package:covidntn/bloc/covid_state.dart';
import 'package:covidntn/services/failure.dart';
import 'package:covidntn/services/get_country_specific.dart';
import 'package:covidntn/services/get_covid_all.dart';
import 'package:covidntn/services/get_local_info.dart';
import 'package:covidntn/utils/input_converter.dart';
import 'package:covidntn/utils/use_cases.dart';
import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';

const String SERVER_FALIURE_MESSAGE = 'Server Faliure';
const String CACHE_FALIURE_MESSAGE = 'Cache Faliure';
const String INVALID_INPUT_FALIURE_MESSAGE = 'Invalid Input Faliure';
const String COUNTRY_NOT_FOUND_FALIURE_MESSAGE = 'Country not Found';
const String UNEXPECTED_ERROR_MESSAGE = 'Unexpected Error';

class CovidBloc extends Bloc<CovidEvent,CovidState>
{

  final GetAllCovidInfo getAllCovidInfo;
  final GetCountrySpecificInfo getCountrySpecificInfo;
  final InputConverter inputConverter;
  final GetLocalSpecificInfo getLocalSpecificInfo;

  CovidBloc(
    {
    @required this.inputConverter,
    @required this.getAllCovidInfo,
    @required this.getCountrySpecificInfo,
    @required this.getLocalSpecificInfo
  });

  @override
  // TODO: implement initialState
  CovidState get initialState => Empty();

  @override
  Stream<CovidState> mapEventToState(CovidEvent event)  async*{
    // TODO: implement mapEventToState
    if(event is GetAllCovidInfoEvent)
    {
       yield Empty();
       final response = await getAllCovidInfo(NoParams());
       yield response.fold( (faliure) => ErrorAll(message: _mapFaliureToMessage(faliure)), (covidProp) => LoadedCovidAll(coviProp: covidProp));
    }
    else if(event is GetCountrySpecificCovidInfoEvent)
    {
      final country = inputConverter.check(event.country);
      yield* country.fold(
        (faliure) async* {
          yield Error(message: INVALID_INPUT_FALIURE_MESSAGE);
        },
       (coun) async*
       {
          yield Loading();
          final response = await getCountrySpecificInfo(coun);
          yield response.fold(
            (faliure) => Error(message: _mapFaliureToMessage(faliure)),
            (covidCountry) => LoadedCovidCountry(covidCountry: covidCountry),
          );
       },
      );
    }
    else if(event is GetLocalSpecificCovidInfoEvent)
    {
        yield Empty();
        final response = await getLocalSpecificInfo(NoParams());
        yield response.fold(
          (faliure) => Error(message: _mapFaliureToMessage(faliure)),
          (colvidLocal) => LoadedCovidLocal(covidlocal: colvidLocal)
        );

    }
    
    }
  String _mapFaliureToMessage(Failure faliure) {
    switch (faliure.runtimeType) {
      case ServerFaliure:
        return SERVER_FALIURE_MESSAGE;

      case CacheFaliure:
        return CACHE_FALIURE_MESSAGE;

      default:
        return UNEXPECTED_ERROR_MESSAGE;
    }
  }
}

import 'package:covidntn/bloc/condid_bloc.dart';
import 'package:covidntn/services/CovidRepoImpl.dart';
import 'package:covidntn/services/api_local_service.dart';
import 'package:covidntn/services/api_remote_service.dart';
import 'package:covidntn/services/country_provider.dart';
import 'package:covidntn/services/covid_repo.dart';
import 'package:covidntn/services/get_country_specific.dart';
import 'package:covidntn/services/get_covid_all.dart';
import 'package:covidntn/services/get_local_info.dart';
import 'package:covidntn/services/network_info.dart';
import 'package:covidntn/splash_screen/bloc/splash_screen_bloc.dart';
import 'package:covidntn/splash_screen/navi_to_main.dart';
import 'package:covidntn/splash_screen/splash_repo_impl.dart';
import 'package:covidntn/splash_screen/splash_screen_repo.dart';
import 'package:covidntn/utils/input_converter.dart';
import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

final cv = GetIt.instance;

Future<void> init() async
{
      cv.registerFactory(
    () => SplashScreenBloc(
      navigateToMainScreen: cv(),
    ),
  );

  cv.registerLazySingleton(
    () => NavigateToMainScreen(
      splashScreenRepo: cv(),
    ),
  );

    cv.registerLazySingleton<SplashScreenRepo>(
    () => SplashScreenRepoImpl(
      networkInfo: cv(),
    ),
  );

     cv.registerFactory(() => CovidBloc(
       getAllCovidInfo: cv(), 
       getCountrySpecificInfo: cv(), inputConverter: cv(), getLocalSpecificInfo: cv(),
       
     ));

     cv.registerLazySingleton(() => GetAllCovidInfo(covidRepo: cv() ));
     cv.registerLazySingleton(() => GetCountrySpecificInfo(covidRepo: cv()));
     cv.registerLazySingleton(() => GetLocalSpecificInfo(covidRepo: cv()));

     cv.registerLazySingleton<CovidRepo>(
    () => CovidRepoImpl(
        covidRemoteDataSource: cv(),
        covidLocalDataSource: cv(),
        networkInfo: cv()),
  );

    cv.registerLazySingleton<CovidLocadata>(
    () => CovidLocaDataImpl(sharedPreferences: cv()),
  );
  cv.registerLazySingleton<CovidRemoteData>(
    () => CovidRemoteDataImpl(httpClient: cv()),
  );

  cv.registerLazySingleton(() => InputConverter());
  cv.registerLazySingleton(() => CountryProvider());
  cv.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(cv()));

  final sharedPreferences = await SharedPreferences.getInstance();
  cv.registerLazySingleton<SharedPreferences>(() => sharedPreferences);
  cv.registerLazySingleton(() => http.Client());
  cv.registerLazySingleton(() => DataConnectionChecker());
}

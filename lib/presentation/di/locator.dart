import 'package:get_it/get_it.dart';
import 'package:weather_app_prv/data/sources/local/preference_manager.dart';
import 'package:weather_app_prv/data/sources/remote/weather_service.dart';
import 'package:weather_app_prv/presentation/ui/about_app/about_as_vm.dart';
import 'package:weather_app_prv/presentation/ui/main/main_vm.dart';
import 'package:weather_app_prv/presentation/ui/splash/splash_vm.dart';
import 'package:weather_app_prv/shared/core/network/dio_manager.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => PreferenceManager());
  locator.registerLazySingleton(() => DioManager());
  locator.registerLazySingleton(() => WeatherService());
  locator.registerFactory(() => SplashViewModel());
  locator.registerFactory(() => MainViewModel());
  locator.registerFactory(() => AboutAsViewModel());
}

import 'package:get_it/get_it.dart';
import 'package:weather_app_prv/data/sources/local/preference_manager.dart';
import 'package:weather_app_prv/data/sources/remote/repositories/weather_repository.dart';
import 'package:weather_app_prv/domain/repositories/weather_repository_impl.dart';
import 'package:weather_app_prv/presentation/ui/about_app/about_as_vm.dart';
import 'package:weather_app_prv/presentation/ui/main/main_vm.dart';
import 'package:weather_app_prv/presentation/ui/splash/splash_vm.dart';
import 'package:weather_app_prv/shared/core/network/dio_manager.dart';

final GetIt getIt = GetIt.instance;

void setup() {
  getIt.registerLazySingleton(
    () => PreferenceManager(),
  );
  getIt.registerLazySingleton(
    () => DioManager(),
  );
  setupRepositories();
  setupViewModels();
}

void setupRepositories() {
  getIt.registerSingleton<WeatherRepository>(
    WeatherRepositoryImpl(
      getIt.get<DioManager>(),
    ),
  );
}

void setupViewModels() {
  getIt.registerFactory(
    () => SplashViewModel(
      getIt.get<PreferenceManager>(),
      getIt.get<WeatherRepository>(),
    ),
  );
  getIt.registerFactory(
    () => MainViewModel(
      getIt.get<PreferenceManager>(),
    ),
  );
  getIt.registerFactory(
    () => AboutAsViewModel(),
  );
}

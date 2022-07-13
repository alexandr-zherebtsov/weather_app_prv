import 'package:weather_app_prv/domain/requests/location_request.dart';
import 'package:weather_app_prv/domain/requests/weather_request.dart';
import 'package:weather_app_prv/domain/responses/location_response.dart';
import 'package:weather_app_prv/domain/responses/weather_response.dart';

abstract class WeatherRepository {
  Future<WeatherResponse?> getWeather(final WeatherRequest data);

  Future<LocationResponse?> getLocation(final LocationRequest data);
}

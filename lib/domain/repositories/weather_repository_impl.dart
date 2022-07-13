import 'dart:developer';

import 'package:weather_app_prv/data/sources/remote/repositories/weather_repository.dart';
import 'package:weather_app_prv/domain/requests/location_request.dart';
import 'package:weather_app_prv/domain/requests/weather_request.dart';
import 'package:weather_app_prv/domain/responses/location_response.dart';
import 'package:weather_app_prv/domain/responses/weather_response.dart';
import 'package:weather_app_prv/shared/core/network/dio_manager.dart';

class WeatherRepositoryImpl extends WeatherRepository {
  final DioManager _dio;
  WeatherRepositoryImpl(this._dio);

  @override
  Future<WeatherResponse?> getWeather(final WeatherRequest data) async {
    WeatherResponse? res;
    try {
      await _dio.get(
        '/data/2.5/onecall',
        json: data.toJson(),
      ).then((response) {
        if (response.data != null) {
          res = WeatherResponse.fromJson(response.data);
        } else {
          log('response.data == null');
        }
      });
    } catch (e) {
      log(e.toString());
    }
    return res;
  }

  @override
  Future<LocationResponse?> getLocation(final LocationRequest data) async {
    LocationResponse? res;
    try {
      await _dio.get(
        '/geo/1.0/reverse',
        json: data.toJson(),
      ).then((response) {
        if (response.data != null) {
          res = (response.data as List).map((e) => LocationResponse.fromJson(e)).toList()[0];
        } else {
          log('response.data == null');
        }
      });
    } catch (e) {
      log(e.toString());
    }
    return res;
  }
}

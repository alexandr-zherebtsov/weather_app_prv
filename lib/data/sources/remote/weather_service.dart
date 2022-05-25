import 'dart:developer';

import 'package:weather_app_prv/domain/requests/location_request.dart';
import 'package:weather_app_prv/domain/requests/weather_request.dart';
import 'package:weather_app_prv/domain/responses/location_response.dart';
import 'package:weather_app_prv/domain/responses/weather_response.dart';
import 'package:weather_app_prv/presentation/di/locator.dart';
import 'package:weather_app_prv/shared/core/base/base_service.dart';
import 'package:weather_app_prv/shared/core/network/dio_manager.dart';

class WeatherService extends BaseService {
  final DioManager _dio = locator<DioManager>();

  Future<WeatherResponse?> getWeather(WeatherRequest data) async {
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

  Future<LocationResponse?> getLocation(LocationRequest data) async {
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

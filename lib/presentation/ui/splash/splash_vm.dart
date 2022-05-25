import 'dart:convert';
import 'dart:developer';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:go_router/go_router.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:weather_app_prv/data/sources/local/preference_manager.dart';
import 'package:weather_app_prv/data/sources/remote/weather_service.dart';
import 'package:weather_app_prv/domain/models/location_model.dart';
import 'package:weather_app_prv/domain/requests/location_request.dart';
import 'package:weather_app_prv/domain/requests/weather_request.dart';
import 'package:weather_app_prv/domain/responses/location_response.dart';
import 'package:weather_app_prv/domain/responses/weather_response.dart';
import 'package:weather_app_prv/presentation/di/locator.dart';
import 'package:weather_app_prv/presentation/router/routes.dart';
import 'package:weather_app_prv/shared/constants/app_values.dart';
import 'package:weather_app_prv/shared/core/base/base_view_model.dart';
import 'package:weather_app_prv/shared/utils/utils.dart';

class SplashViewModel extends BaseViewModel {
  final PreferenceManager _pref = locator<PreferenceManager>();
  final WeatherService _weatherService = locator<WeatherService>();

  void onInit(BuildContext context) async {
    final ConnectivityResult conRes = await (Connectivity().checkConnectivity());
    if (conRes == ConnectivityResult.mobile || conRes == ConnectivityResult.wifi) {
      await getCurrentLocation();
      await getWeather();
    } else {
      await futureDelayed(milliseconds: 400);
    }
    navToMain(context);
  }

  Future<void> getCurrentLocation() async {
    LocationModel? location;
    try {
      final bool enabled;
      if (kIsWeb) {
        LocationPermission permission = await Geolocator.checkPermission();
        if (permission != LocationPermission.always || permission != LocationPermission.whileInUse) {
          permission = await Geolocator.requestPermission();
        }
        enabled = permission != LocationPermission.denied && permission != LocationPermission.deniedForever;
      } else {
        enabled = await Permission.location.request().isGranted;
      }
      if (enabled) {
        final Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high,
        );
        final double latitude = position.latitude;
        final double longitude = position.longitude;
        if (!kIsWeb) {
          final List<Placemark> placeMarks = await placemarkFromCoordinates(
            latitude,
            longitude,
            localeIdentifier: getLangCode(),
          );
          if (placeMarks.isNotEmpty) {
            location = LocationModel(
              country: placeMarks[0].country ?? '',
              city: placeMarks[0].locality ?? '',
              latitude: latitude,
              longitude: longitude,
            );
          } else {
            location = LocationModel(
              country: '',
              city: '',
              latitude: latitude,
              longitude: longitude,
            );
          }
        } else {
          final LocationResponse? lct = await _weatherService.getLocation(
            LocationRequest(
              lat: latitude,
              lon: longitude,
              lang: getLangCode(),
              limit: 1,
              appid: AppValues.apiKey,
            ),
          );
          if (lct?.localNames != null) {
            location = LocationModel(
              country: '',
              city: _getCityByLang(lct!.localNames!),
              latitude: latitude,
              longitude: longitude,
            );
          } else {
            location = LocationModel(
              country: '',
              city: '',
              latitude: latitude,
              longitude: longitude,
            );
          }
       }
      }
    } catch (e) {
      log(e.toString());
    }
    if (location != null) {
      await _pref.setCurrentLocation(jsonEncode(location.toJson()));
    }
  }

  String? _getCityByLang(LocalNames localNames) {
    switch (getLangCode()) {
      case AppValues.langCodeUk:
        return localNames.uk;
      default:
        return localNames.en;
    }
  }

  Future<void> getWeather() async {
    try {
      // get current location from pref
      final String locationPref = await _pref.getCurrentLocation();
      final LocationModel location;
      if (locationPref.isEmpty) {
        location = AppValues.defaultLocation;
      } else {
        location = LocationModel.fromJson(jsonDecode(locationPref));
      }
      // get weather
      final WeatherRequest data = WeatherRequest(
        lat: location.latitude,
        lon: location.longitude,
        lang: getLangCode(),
        appid: AppValues.apiKey,
      );
      final WeatherResponse? weather = await _weatherService.getWeather(data);
      if (weather != null) {
        // set last weather
        await _pref.setLastWeather(jsonEncode(weather.toJson()));
      }
    } catch (e) {
      log(e.toString());
    }
  }

  void navToMain(BuildContext context) => context.go(AppRoutes.main);
}

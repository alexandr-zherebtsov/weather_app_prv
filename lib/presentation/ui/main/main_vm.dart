import 'dart:convert';
import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:weather_app_prv/data/sources/local/preference_manager.dart';
import 'package:weather_app_prv/domain/models/location_model.dart';
import 'package:weather_app_prv/domain/responses/weather_response.dart';
import 'package:weather_app_prv/presentation/di/locator.dart';
import 'package:weather_app_prv/presentation/router/routes.dart';
import 'package:weather_app_prv/shared/constants/app_string_keys.dart';
import 'package:weather_app_prv/shared/constants/app_values.dart';
import 'package:weather_app_prv/shared/core/base/base_view_model.dart';
import 'package:weather_app_prv/shared/styles/widgets.dart';

class MainViewModel extends BaseViewModel {
  final PreferenceManager _pref = locator<PreferenceManager>();
  late List<PopUpModel> popUpItems;

  WeatherResponse? weather;
  LocationModel? location;

  bool _screenLoader = false;
  bool get screenLoader => _screenLoader;
  set screenLoader(bool isScreenLoader) {
    _screenLoader = isScreenLoader;
    notifyListeners();
  }

  bool _screenError = false;
  bool get screenError => _screenError;
  set screenError(bool isScreenLoader) {
    _screenError = isScreenLoader;
    notifyListeners();
  }

  int _viewIndex = 0;
  int get viewIndex => _viewIndex;
  set viewIndex(int viewIndex) {
    _viewIndex = viewIndex;
    notifyListeners();
  }

  Future<void> onInit() async {
    setBusy(true);
    widgetInitializer();
    try {
      await Future.wait([
        getLastWeather(),
        getCurrentLocation(),
      ]);
    } catch (e) {
      log(e.toString());
      screenError = true;
    }
    setBusy(false);
  }

  void widgetInitializer() {
    popUpItems = <PopUpModel>[
      PopUpModel(title: StringsKeys.hourlyWeather.tr(), func: hourlyWeather),
      PopUpModel(title: StringsKeys.weatherByDay.tr(), func: weatherByDay),
    ];
  }

  Future<void> getCurrentLocation() async {
    String res = await _pref.getCurrentLocation();
    if (res.isNotEmpty) {
      location = LocationModel.fromJson(jsonDecode(res));
    } else {
      location = AppValues.defaultLocation;
    }
  }

  Future<void> getLastWeather() async {
    String res = await _pref.getLastWeather();
    if (res.isNotEmpty) {
      weather = WeatherResponse.fromJson(jsonDecode(res));
    } else {
      screenError = true;
    }
  }

  void hourlyWeather() => viewIndex = 0;
  void weatherByDay() => viewIndex = 1;

  void navToAboutAs(BuildContext context) => context.push(AppRoutes.aboutAs);

  Future<void> refreshScreen(BuildContext context) async => context.go(AppRoutes.splash);

}

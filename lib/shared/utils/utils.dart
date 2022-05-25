import 'dart:io';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:universal_html/html.dart' as html;
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:weather_app_prv/shared/constants/app_values.dart';
import 'package:weather_app_prv/shared/constants/app_string_keys.dart';
import 'package:weather_app_prv/shared/styles/colors.dart';

void errorToast({
  required String? code,
  required String? message,
}) {
  Fluttertoast.showToast(
    msg: 'Error Code: $code\nError Message: $message',
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 1,
    backgroundColor: AppColors.white.withOpacity(0.4),
    textColor: AppColors.black,
    fontSize: 16.0,
  );
}

String getWeatherImage(String? icon) {
  String res = '';
  if (icon != null) {
    if (icon.isNotEmpty) {
      res = AppValues.imgUrl + icon + AppValues.png;
    }
  }
  return res;
}

String kelvinToCelsius(double? kelvin) {
  if (kelvin == null) {
    return StringsKeys.notSpecified.tr();
  } else {
    return (kelvin - 273.15).toStringAsFixed(1);
  }
}

String getClearName(String? firstName, String? lastName, {comma = false}) {
  return (firstName ?? '') +
      (firstName == null ? '' : firstName.isEmpty ? '' : comma ? lastName == null ? '' : lastName.isEmpty ? '' : ', ' : ' ')
      + (lastName ?? '');
}


double? doubleParser(dynamic data) {
  try {
    final double? doubleResult = double.tryParse(data.toString());
    if (doubleResult != null) {
      return doubleResult;
    } else {
      final int? intResult = int.tryParse(data.toString());
      if (intResult != null) {
        return intResult.toDouble();
      } else {
        return null;
      }
    }
  } catch(_) {
    return null;
  }
}

String getLangCode() {
  try {
    String? langCode;
    if (kIsWeb) {
      langCode = html.window.navigator.language;
      // required
      // ignore: unnecessary_null_comparison
      if (langCode != null) {
        langCode = langCode.split('-')[0];
      }
    } else {
      langCode = Platform.localeName.split('_')[0];
    }
    switch (langCode) {
      case AppValues.langCodeUk:
        return AppValues.langCodeUk;
      case AppValues.langCodeEn:
        return AppValues.langCodeEn;
      default:
        return AppValues.langCodeBasic;
    }
  } catch (e) {
    return AppValues.langCodeBasic;
  }
}

Future<void> futureDelayed({int milliseconds = 1000}) async {
  await Future.delayed(Duration(milliseconds: milliseconds));
}

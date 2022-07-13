import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:weather_app_prv/shared/constants/app_string_keys.dart';
import 'package:weather_app_prv/shared/constants/app_values.dart';
import 'package:weather_app_prv/shared/core/base/base_view_model.dart';
import 'package:weather_app_prv/shared/utils/utils.dart';

class AboutAsViewModel extends BaseViewModel {
  late PackageInfo packageInfo;

  String _version = '';
  String get version => _version;
  set version(String version) {
    _version = version;
    notifyListeners();
  }

  void init() => getVersion();

  void getVersion() async {
    try {
      packageInfo = await PackageInfo.fromPlatform();
      version = '${StringsKeys.version.tr()} ${packageInfo.version}';
    } catch (e) {
      log(e.toString());
    }
  }

  void gitHubLaunch() async {
    try {
      await launchUrl(
        getUri(
          AppValues.gitHubUrl,
        )!,
      );
    } catch (e) {
      log(e.toString());
    }
  }

  void flutterLaunch() async {
    try {
      await launchUrl(
        getUri(
          AppValues.flutterUrl,
        )!,
      );
    } catch (e) {
      log(e.toString());
    }
  }
}

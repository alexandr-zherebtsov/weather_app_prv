import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_strategy/url_strategy.dart';
import 'package:weather_app_prv/presentation/di/di.dart';
import 'package:weather_app_prv/presentation/router/router.dart';
import 'package:weather_app_prv/presentation/router/routes.dart';
import 'package:weather_app_prv/shared/constants/app_string_keys.dart';
import 'package:weather_app_prv/shared/constants/app_values.dart';
import 'package:weather_app_prv/shared/styles/themes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    setPathUrlStrategy();
    SystemNavigator.routeInformationUpdated(
      location: AppRoutes.splash,
    );
  } else {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
  }
  setup();
  await EasyLocalization.ensureInitialized();
  runApp(
    EasyLocalization(
      supportedLocales: AppValues.supportedLocales,
      path: AppValues.localesPath,
      fallbackLocale: AppValues.localeEN,
      child: const App(),
    ),
  );
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: StringsKeys.appName,
      locale: context.locale,
      supportedLocales: context.supportedLocales,
      localizationsDelegates: context.localizationDelegates,
      theme: AppThemes.getTheme(),
      routeInformationProvider: AppRouter.router.routeInformationProvider,
      routeInformationParser: AppRouter.router.routeInformationParser,
      routerDelegate: AppRouter.router.routerDelegate,
    );
  }
}

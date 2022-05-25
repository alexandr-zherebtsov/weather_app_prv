import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:weather_app_prv/presentation/router/routes.dart';
import 'package:weather_app_prv/presentation/ui/about_app/about_app_view.dart';
import 'package:weather_app_prv/presentation/ui/main/main_view.dart';
import 'package:weather_app_prv/presentation/ui/splash/splash_view.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    routes: <GoRoute>[
      GoRoute(
        path: AppRoutes.splash,
        builder: (BuildContext context, GoRouterState state) {
          return const SplashView();
        },
      ),
      GoRoute(
        path: AppRoutes.main,
        builder: (BuildContext context, GoRouterState state) {
          return const MainView();
        },
      ),
      GoRoute(
        path: AppRoutes.aboutAs,
        builder: (BuildContext context, GoRouterState state){
          return const AboutAppView();
        },
      ),
    ],
  );
}

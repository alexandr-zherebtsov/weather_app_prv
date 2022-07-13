import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:weather_app_prv/presentation/router/routes.dart';
import 'package:weather_app_prv/presentation/ui/splash/splash_vm.dart';
import 'package:weather_app_prv/shared/core/base/base_view.dart';
import 'package:weather_app_prv/shared/styles/widgets.dart';

class SplashView extends StatelessWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<SplashViewModel>(
      init: (SplashViewModel vm) => vm.init(() => goMain(context)),
      builder: (BuildContext context, SplashViewModel vm, Widget? child) {
        return vm.isBusy() ? const AppProgress() : const Scaffold(
          body: Center(
            child: AppIcon(size: 240),
          ),
        );
      },
    );
  }

  void goMain(BuildContext context) => context.go(AppRoutes.main);
}

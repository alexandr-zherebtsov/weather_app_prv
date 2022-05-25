import 'package:flutter/material.dart';
import 'package:weather_app_prv/presentation/ui/splash/splash_vm.dart';
import 'package:weather_app_prv/shared/core/base/base_view.dart';
import 'package:weather_app_prv/shared/styles/widgets.dart';

class SplashView extends StatelessWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<SplashViewModel>(
      init: (vm) => vm.onInit(context),
      builder: (BuildContext context, SplashViewModel vm, Widget? child) {
        return vm.isBusy() ? getProgress() : Scaffold(
          body: Center(
            child: appIcon(size: 240),
          ),
        );
      },
    );
  }
}

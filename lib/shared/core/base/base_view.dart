import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app_prv/presentation/di/locator.dart';
import 'package:weather_app_prv/shared/core/base/base_view_model.dart';

class BaseView<T extends BaseViewModel> extends StatefulWidget {
  final Function(T)? init;
  final Widget Function(BuildContext context, T vm, Widget? child) builder;

  const BaseView({
    Key? key,
    this.init,
    required this.builder,
  }) : super(key: key);

  @override
  _BaseViewState<T> createState() => _BaseViewState<T>();
}

class _BaseViewState<T extends BaseViewModel> extends State<BaseView<T>> {
  T vm = locator<T>();

  @override
  void initState() {
    if (widget.init != null) {
      widget.init!(vm);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<T>(
      create: (BuildContext context) => vm,
      child: Consumer<T>(
        builder: widget.builder,
      ),
    );
  }
}

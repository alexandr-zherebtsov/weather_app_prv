import 'package:flutter/material.dart';

enum ViewState { idle, busy }

class BaseViewModel extends ChangeNotifier {
  ViewState _state = ViewState.idle;

  ViewState get state => _state;

  bool isBusy() => _state == ViewState.busy;

  void setBusy(bool value) {
    value ? _state = ViewState.busy : _state = ViewState.idle;
    notifyListeners();
  }
}

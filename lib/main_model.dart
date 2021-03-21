import 'package:flutter/material.dart';

class MainModel with ChangeNotifier {
  String value = 'first value';
  void changeValueText() {
    value = 'value change';
    notifyListeners();
  }
}

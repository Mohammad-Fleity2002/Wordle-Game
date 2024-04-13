import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  bool isDark = false;

  setTheme({required bool turnOn}) {
  // setTheme() {
    isDark = turnOn;
    notifyListeners();
  }
}
import 'package:flutter/material.dart';
import 'package:sky_scrapper/controller/theme_pref.dart';

class ThemeProviders extends ChangeNotifier {
  late bool _isDark;
  late ThemePrefs _prefs;
  bool get isDark => _isDark;

  ThemeProviders() {
    _isDark = false;
    _prefs = ThemePrefs();
    getPrefs;
  }

  set isDark(bool value) {
    _isDark = value;
    _prefs.setTheme(value);
    notifyListeners();
  }

  getPrefs() async {
    _isDark = await _prefs.getTheme();
    notifyListeners();
  }
}

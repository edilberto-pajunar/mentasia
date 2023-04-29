import 'package:flutter/cupertino.dart';
import 'package:mentasia/features/core/shared/theme_preferences.dart';

class ModelTheme extends ChangeNotifier {
  late bool _isDark;
  late ThemePreferences _preferences;
  bool get isDark => _isDark;

  ModelTheme() {
    _isDark = false;
    _preferences = ThemePreferences();
    getPreferences();
  }

  // Switching the themes
  set isDark(bool value) {
    _isDark = value;
    _preferences.setTheme(value);
    notifyListeners();
  }

  getPreferences() async {
    _isDark = await _preferences.getTheme();
    notifyListeners();
  }
}

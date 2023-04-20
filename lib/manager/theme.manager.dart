import 'package:flutter/material.dart';

class ThemeManager extends ChangeNotifier {
  static ThemeData _themeData = ThemeData.light();

  static ThemeData getTheme() {
    return _themeData;
  }

  static void setTheme(ThemeData themeData) {
    _themeData = themeData;
  }

  void toggleTheme(BuildContext context) {
    var theme = Theme.of(context);
    if (theme.brightness == Brightness.dark) {
      // muda para o tema claro
      ThemeManager.setTheme(ThemeData.light());
    } else {
      // muda para o tema escuro
      ThemeManager.setTheme(ThemeData.dark());
    }
    notifyListeners();
  }
}

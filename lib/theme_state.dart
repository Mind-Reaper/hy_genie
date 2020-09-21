import 'package:flutter/material.dart';
import 'package:hy_genie/screens/welcome_screen.dart';

enum ThemeType { Dark, Light }

Color buttonTextColor = Colors.white;
Color appTextColor = Colors.black87;

Color appTheme = Color(0xff4aab43);
Color appBackground = Colors.white;
String logo = 'assets/images/Hblack.png';
Color ballColor = Colors.white;
Color fieldColor = Colors.grey[200];
bool darkTheme = ThemeChanger().isDarkMode;

class ThemeChanger extends ChangeNotifier {
  bool isDarkMode = false;
  ThemeChanger() {
    getTheme().then((type) {
      isDarkMode = type == ThemeType.Dark;
      notifyListeners();
    });
  }

  ThemeType get theme => isDarkMode ? ThemeType.Dark : ThemeType.Light;
  set theme(ThemeType type) => setTheme(type);

  void setTheme(ThemeType type) async {
    isDarkMode = type == ThemeType.Dark;
    notifyListeners();
  }

  Future<ThemeType> getTheme() async {
    return isDarkMode ? ThemeType.Dark : ThemeType.Light;
  }
}

class AppTheme {
  static final ThemeData light = ThemeData(
      brightness: Brightness.light,
      scaffoldBackgroundColor: Color(0xfff2f2f2),
      primaryColor: Color(0xff303236),
      // buttonColor: Color(0xff4c98cf),
      buttonColor: Color(0xff4aab43),
      accentColor: Colors.white,
      canvasColor: Colors.grey[300],
      textTheme: TextTheme(
          bodyText1: TextStyle(
        fontFamily: 'Nunito',
        color: Color(0xff303236),
        fontSize: 15,
      )));

  static final ThemeData dark = ThemeData(
      brightness: Brightness.light,
      scaffoldBackgroundColor: Color(0xff121212),
      primaryColor: Colors.white,
      buttonColor: Color(0xff4aab43),
      accentColor: Color(0xff272727),
      canvasColor: Colors.grey[800],
      textTheme: TextTheme(
          bodyText1: TextStyle(
        fontFamily: 'Nunito',
        color: Colors.white,
        fontSize: 15,
      )));
}

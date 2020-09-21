import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';

import '../../theme_state.dart';
import '../settings_screen.dart';

enum ThemeMode { defaults, light, dark }
ThemeMode _theme = ThemeMode.defaults;

class EditAppTheme extends StatefulWidget {
  @override
  _EditAppThemeState createState() => _EditAppThemeState();
}

class _EditAppThemeState extends State<EditAppTheme> {
  var brightness = SchedulerBinding.instance.window.platformBrightness;

  void toggleTheme() {
    if (_theme == ThemeMode.light) {
      Provider.of<ThemeChanger>(context, listen: false).theme = ThemeType.Light;
    } else if (_theme == ThemeMode.dark) {
      Provider.of<ThemeChanger>(context, listen: false).theme = ThemeType.Dark;
    }
  }

  void defaultTheme() {
    if (brightness == Brightness.dark) {
      Provider.of<ThemeChanger>(context, listen: false).theme = ThemeType.Dark;
    } else {
      Provider.of<ThemeChanger>(context, listen: false).theme = ThemeType.Light;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SettingsPage(
      title: 'APP THEME',
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        child: Material(
          borderRadius: BorderRadius.circular(20),
          color: Theme.of(context).accentColor,
          child: Container(
            decoration: BoxDecoration(
              border:
                  Border.all(color: Theme.of(context).canvasColor, width: 2),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              children: <Widget>[
                RadioListTile<ThemeMode>(
                  activeColor: appTheme,
                  title: Text(
                    'System Default',
                    style: TextStyle(
                        fontFamily: 'Nunito',
                        color: Theme.of(context).primaryColor),
                  ),
                  value: ThemeMode.defaults,
                  groupValue: _theme,
                  onChanged: (ThemeMode value) {
                    setState(() {
                      _theme = value;
                      defaultTheme();
                    });
                  },
                ),
                RadioListTile<ThemeMode>(
                  activeColor: appTheme,
                  title: Text(
                    'Light Mode',
                    style: TextStyle(
                        fontFamily: 'Nunito',
                        color: Theme.of(context).primaryColor),
                  ),
                  value: ThemeMode.light,
                  groupValue: _theme,
                  onChanged: (ThemeMode value) {
                    setState(() {
                      _theme = value;
                      toggleTheme();
                    });
                  },
                ),
                RadioListTile<ThemeMode>(
                  activeColor: appTheme,
                  title: Text(
                    'Dark Mode',
                    style: TextStyle(
                        fontFamily: 'Nunito',
                        color: Theme.of(context).primaryColor),
                  ),
                  value: ThemeMode.dark,
                  groupValue: _theme,
                  onChanged: (ThemeMode value) {
                    setState(() {
                      _theme = value;
                      toggleTheme();
                    });
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

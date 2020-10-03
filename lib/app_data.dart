import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_material_pickers/flutter_material_pickers.dart';
import 'package:provider/provider.dart';
import 'package:time/time.dart';
import 'package:hive/hive.dart';
import 'main.dart';

class AppData extends ChangeNotifier {
  var box = Hive.box('appData');
  String username = '';
  DateTime myTime = DateTime(
      DateTime.now().year, DateTime.now().month, DateTime.now().day, 1, 00);
  DateTime wakeTime = DateTime(
      DateTime.now().year, DateTime.now().month, DateTime.now().day, 9, 00);

  void changeUsername(String value) {
    username = value;
    box.put('username', username);
    notifyListeners();
  }

  void changeTime(value) {
    myTime = DateTime(DateTime.now().year, DateTime.now().month,
        DateTime.now().day, value.hour, value.minute);
    box.put('sleepTime', myTime);
    wakeTime = myTime + 8.hours;

    notifyListeners();
  }

  void showTimePicker(BuildContext context) {
    return showMaterialTimePicker(
        title: 'SELECT BED TIME',
        context: context,
        selectedTime: TimeOfDay.fromDateTime(myTime),
        onChanged: (value) {
          changeTime(value);
        },
        onConfirmed: () {
          wakeTime = myTime + 8.hours;
          notifyListeners();
        });
  }

  void changeAlarm(int hour, int minute, String meridian) {
    int realHour = meridian == 'AM'
        ? hour < 12 ? hour : hour + 12
        : hour < 12 ? hour + 12 : hour;

    myTime = DateTime(DateTime.now().year, DateTime.now().month,
        DateTime.now().day, realHour, minute);
    wakeTime = myTime + 8.hours;
    box.put('sleepTime', myTime);
    notifyListeners();
  }
}

extension CapExtension on String {
  String get inCaps => '${this[0].toUpperCase()}${this.substring(1)}';
}

class Timing extends ChangeNotifier {
  DateTime bedTime = AppData().myTime;
  DateTime now = DateTime.now();

  DateTime currentTime = DateTime.now();
  bool sleepWell = true;
  bool getHydrated = false;
  bool getReady = false;
  bool shower = false;
  bool bodyLotion = false;
  bool brushDay = false;
  bool brushNight = false;
  bool brushHydration = false;
  bool breakfast = false;
  bool lunch = false;
  bool dinner = false;

  void startTime(BuildContext context) {
    Timer.periodic(Duration(seconds: 1), (timer) {
      updateWidgets(context);

      if (DateTime.now().isAfter(Hive.box('appData')
          .get('midnight', defaultValue: DateTime.now() - 1.hours))) {
        ButtonFunctions().resetButtons(context);
        print(
            Hive.box('appData').get('midnight', defaultValue: DateTime.now()));
        notifyListeners();
      }
      notifyListeners();
    });
  }

  void updateWidgets(BuildContext context) {
    DateTime newDay = DateTime(
        DateTime.now().year, DateTime.now().month, DateTime.now().day, 00, 00);
    DateTime nextDay = DateTime(DateTime.now().year, DateTime.now().month,
            DateTime.now().day + 00, 00) +
        1.days;

    var appData = Provider.of<AppData>(context, listen: false);
    var button = Provider.of<ButtonFunctions>(context, listen: false);

    sleepWell = button.sleepWellButton &&
            DateTime.now().isAfter(appData.myTime) &&
            DateTime.now().isBefore(appData.wakeTime)
        ? true
        : false;
    getHydrated =
        button.getHydratedButton && DateTime.now().isAfter(appData.wakeTime) ||
                button.getHydratedButton &&
                    DateTime.now().isBefore(newDay + 14.hours)
            ? true
            : false;
    getReady = DateTime.now().isAfter(appData.myTime - 2.hours) &&
            DateTime.now().isBefore(appData.myTime)
        ? true
        : false;
    shower = button.showerButton &&
                DateTime.now().isAfter(appData.wakeTime + 10.minutes) ||
            button.showerButton && DateTime.now().isAfter(newDay + 6.hours)
        ? true
        : false;
    bodyLotion = button.bodyLotionButton && shower == false ? true : false;
    brushDay = button.brushDayButton &&
                DateTime.now().isAfter(appData.wakeTime.isAfter(nextDay)
                    ? appData.wakeTime
                    : nextDay) ||
            button.brushDayButton &&
                DateTime.now().isBefore(
                    appData.wakeTime.isAfter(newDay + 12.hours)
                        ? newDay + 17.hours
                        : newDay + 12.hours)
        ? true
        : false;

    brushNight = button.brushNightButton &&
                DateTime.now().isBefore(appData.myTime - 3.hours) ||
            button.brushNightButton &&
                DateTime.now().isAfter(newDay + 20.hours) &&
                DateTime.now().isBefore(nextDay)
        ? true
        : false;
    brushHydration = brushDay || brushNight ? false : true;
    breakfast = button.breakfastButton &&
                DateTime.now().isAfter(appData.wakeTime.isAfter(nextDay)
                    ? appData.wakeTime
                    : nextDay) ||
            button.breakfastButton && DateTime.now().isBefore(newDay + 12.hours)
        ? true
        : false;

    lunch = button.lunchButton &&
            breakfast == false &&
            DateTime.now().isAfter(newDay + 12.hours) &&
            DateTime.now().isBefore(newDay + 17.hours)
        ? true
        : false;
    dinner = button.dinnerButton &&
            lunch == false &&
            DateTime.now().isAfter(newDay + 17.hours) &&
            DateTime.now().isBefore(nextDay)
        ? true
        : false;

    notifyListeners();
  }
}

class ButtonFunctions extends ChangeNotifier {
  bool getHydratedButton =
      Hive.box('appData').get('gethydrated', defaultValue: true);
  DateTime midNight = DateTime(DateTime.now().year, DateTime.now().month,
      DateTime.now().day, 23, 59, 59);

  bool sleepWellButton =
      Hive.box('appData').get('sleepwell', defaultValue: true);

  bool showerButton = Hive.box('appData').get('shower', defaultValue: true);
  bool bodyLotionButton =
      Hive.box('appData').get('bodylotion', defaultValue: true);
  bool brushDayButton = Hive.box('appData').get('brushday', defaultValue: true);
  bool brushNightButton =
      Hive.box('appData').get('brushnight', defaultValue: true);

  bool breakfastButton =
      Hive.box('appData').get('breakfast', defaultValue: true);
  bool lunchButton = Hive.box('appData').get('lunch', defaultValue: true);
  bool dinnerButton = Hive.box('appData').get('dinner', defaultValue: true);

  void done(String value) {
    if (value == 'gethydrated') {
      getHydratedButton = false;
      Hive.box('appData').put('gethydrated', getHydratedButton);
    } else if (value == 'sleepwell') {
      sleepWellButton = false;
      Hive.box('appData').put('sleepwell', sleepWellButton);
    } else if (value == 'shower') {
      showerButton = false;
      Hive.box('appData').put('shower', showerButton);
    } else if (value == 'bodylotion') {
      bodyLotionButton = false;
      Hive.box('appData').put('bodylotion', bodyLotionButton);
    } else if (value == 'brushday') {
      brushDayButton = false;
      Hive.box('appData').put('brushday', brushDayButton);
    } else if (value == 'brushnight') {
      brushNightButton = false;
      Hive.box('appData').put('brushNight', brushNightButton);
    } else if (value == 'breakfast') {
      breakfastButton = false;
      Hive.box('appData').put('breakfast', breakfastButton);
    } else if (value == 'lunch') {
      lunchButton = false;
      Hive.box('appData').put('lunch', lunchButton);
    } else if (value == 'dinner') {
      dinnerButton = false;
      Hive.box('appData').put('dinner', dinnerButton);
    }

    notifyListeners();
  }

  void resetButtons(BuildContext context) {
    getHydratedButton = true;
    showerButton = true;
    bodyLotionButton = true;
    brushDayButton = true;
    brushNightButton = true;
    sleepWellButton = true;
    breakfastButton = true;
    lunchButton = true;
    dinnerButton = true;
    midNight = DateTime(DateTime.now().year, DateTime.now().month,
        DateTime.now().day, 23, 59, 59);
    Hive.box('appData').put('midnight', midNight);
    Hive.box('appData').put('sleepwell', sleepWellButton);
    Hive.box('appData').put('gethydrated', getHydratedButton);
    Hive.box('appData').put('shower', showerButton);
    Hive.box('appData').put('bodylotion', bodyLotionButton);
    Hive.box('appData').put('brushday', brushDayButton);
    Hive.box('appData').put('brushNight', brushNightButton);
    Hive.box('appData').put('breakfast', breakfastButton);
    Hive.box('appData').put('lunch', lunchButton);
    Hive.box('appData').put('dinner', dinnerButton);
    notifyListeners();
  }
}

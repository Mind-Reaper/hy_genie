import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_material_pickers/flutter_material_pickers.dart';
import 'package:provider/provider.dart';
import 'package:time/time.dart';

class AppData extends ChangeNotifier {
  String username = '';
  DateTime myTime = DateTime(
      DateTime.now().year, DateTime.now().month, DateTime.now().day, 1, 00);
  DateTime wakeTime = DateTime(
      DateTime.now().year, DateTime.now().month, DateTime.now().day, 9, 00);

  void changeUsername(String value) {
    username = value;

    notifyListeners();
  }

  void changeTime(value) {
    myTime = DateTime(DateTime.now().year, DateTime.now().month,
        DateTime.now().day, value.hour, value.minute);

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
    notifyListeners();
  }
}

extension CapExtension on String {
  String get inCaps => '${this[0].toUpperCase()}${this.substring(1)}';
}

class Timing extends ChangeNotifier {
  DateTime bedTime = AppData().myTime;
  DateTime wakeTime = AppData().wakeTime;
  DateTime currentTime = DateTime.now();
  bool sleepWell;
  bool getHydrated;
  bool getReady;
  bool shower;
  bool bodyLotion;
  bool brushDay;
  bool brushNight;
  bool brushHydration;
  bool breakfast;
  bool lunch;
  bool dinner;

  Timer startTime(BuildContext context) {
    Timer check = Timer.periodic(Duration(seconds: 1), (timer) {
      Provider.of<Timing>(context, listen: false).updateWidgets(context);
      notifyListeners();
    });
    return check;
  }

  void updateWidgets(BuildContext context) {
    DateTime newDay = DateTime(
        DateTime.now().year, DateTime.now().month, DateTime.now().day, 00, 00);
    DateTime nextDay = DateTime(DateTime.now().year, DateTime.now().month,
            DateTime.now().day + 00, 00) +
        1.days;

    var appData = Provider.of<AppData>(context, listen: false);
    sleepWell = DateTime.now().isAfter(appData.myTime) &&
            DateTime.now().isBefore(appData.wakeTime)
        ? true
        : false;
    getHydrated = DateTime.now().isAfter(appData.wakeTime) ? true : false;
    getReady = DateTime.now().isAfter(appData.myTime - 1.hours) &&
            DateTime.now().isBefore(appData.myTime)
        ? true
        : false;
    shower = DateTime.now().isAfter(appData.wakeTime + 10.minutes) ||
            DateTime.now().isAfter(newDay + 6.hours)
        ? true
        : false;
    bodyLotion = shower == false ? true : false;
    brushDay = DateTime.now().isAfter(appData.wakeTime.isAfter(nextDay)
                ? appData.wakeTime
                : nextDay) ||
            DateTime.now().isBefore(appData.wakeTime.isAfter(newDay + 12.hours)
                ? newDay + 17.hours
                : newDay + 12.hours)
        ? true
        : false;

    brushNight = DateTime.now().isAfter(appData.myTime - 3.hours) ||
            DateTime.now().isAfter(newDay + 21.hours) &&
                DateTime.now().isBefore(newDay)
        ? true
        : false;
    brushHydration = brushDay || brushNight ? false : true;
    breakfast = DateTime.now().isAfter(appData.wakeTime.isAfter(nextDay)
                ? appData.wakeTime
                : nextDay) ||
            DateTime.now().isBefore(newDay + 12.hours)
        ? true
        : false;

    lunch = breakfast == false &&
            DateTime.now().isAfter(newDay + 12.hours) &&
            DateTime.now().isBefore(newDay + 17.hours)
        ? true
        : false;
    dinner = lunch == false &&
            DateTime.now().isAfter(newDay + 17.hours) &&
            DateTime.now().isBefore(nextDay)
        ? true
        : false;

    notifyListeners();
  }
}

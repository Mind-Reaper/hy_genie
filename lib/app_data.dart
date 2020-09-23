import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_material_pickers/flutter_material_pickers.dart';
import 'package:provider/provider.dart';
import 'package:time/time.dart';

class AppData extends ChangeNotifier {
  String username = '';
  DateTime myTime;
  DateTime wakeTime = DateTime.now();

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

  void updateTime(context) {
    updateWidgets(context);
    notifyListeners();
  }

  void updateWidgets(BuildContext context) {
    var appData = Provider.of<AppData>(context, listen: false);
    sleepWell = DateTime.now().isAfter(appData.myTime) &&
            DateTime.now().isBefore(appData.wakeTime)
        ? false
        : true;
    getHydrated = DateTime.now().isAfter(appData.wakeTime) ? true : false;
    getReady = sleepWell = DateTime.now().isAfter(appData.myTime - 2.hours) &&
            DateTime.now().isBefore(appData.myTime)
        ? true
        : false;

    notifyListeners();
  }
}

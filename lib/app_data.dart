import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_material_pickers/flutter_material_pickers.dart';
import 'package:time/time.dart';

class AppData extends ChangeNotifier {
  String username = '';
  DateTime myTime = DateTime.now();
  DateTime wakeTime = DateTime.now();
  DateTime now = DateTime.now();

  void changeUsername(String value) {
    username = value;

    notifyListeners();
  }

  void showTimePicker(BuildContext context) {
    return showMaterialTimePicker(
        title: 'SELECT BED TIME',
        context: context,
        selectedTime: TimeOfDay.fromDateTime(myTime),
        onChanged: (value) {
          myTime =
              DateTime(now.year, now.month, now.day, value.hour, value.minute);
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

    myTime = DateTime(now.year, now.month, now.day, realHour, minute);
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
  bool sleepWell = DateTime.now().isBefore(AppData().myTime);

  bool getHydrated;
  bool getReady;
}

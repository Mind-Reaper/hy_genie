import 'package:flutter/material.dart';
import 'package:hy_genie/widgets/alarm_setter.dart';

import '../settings_screen.dart';

class EditSleepTime extends StatefulWidget {
  @override
  _EditSleepTimeState createState() => _EditSleepTimeState();
}

class _EditSleepTimeState extends State<EditSleepTime> {
  @override
  Widget build(BuildContext context) {
    return SettingsPage(
      title: 'SLEEP TIME',
      child: Column(
        children: [
          SizedBox(height: 40),
          AlarmSetter(),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:hy_genie/theme_state.dart';
import 'package:provider/provider.dart';

import '../app_data.dart';

class AlarmSetter extends StatefulWidget {
  @override
  _AlarmSetterState createState() => _AlarmSetterState();
}

class _AlarmSetterState extends State<AlarmSetter> {
  int sleepHour = 01;
  int sleepMinute = 00;

  String meridian = 'AM';

  @override
  Widget build(BuildContext context) {
    var appData = Provider.of<AppData>(context);
    void setAlarm() {
      appData.changeAlarm(sleepHour, sleepMinute, meridian);
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        TimeSection(
            time: sleepHour.toString().padLeft(2, '0'),
            plus: () {
              if (sleepHour < 12) {
                setState(() {
                  sleepHour++;
                  setAlarm();
                });
              } else {
                setState(() {
                  sleepHour = 01;
                  setAlarm();
                });
              }
            },
            minus: () {
              if (sleepHour > 1) {
                setState(() {
                  sleepHour--;
                  setAlarm();
                });
              } else {
                setState(() {
                  sleepHour = 12;
                  setAlarm();
                });
              }
            }),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            ':',
            style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontFamily: 'Digital',
                fontSize: 40),
          ),
        ),
        TimeSection(
            time: sleepMinute.toString().padLeft(2, '0'),
            plus: () {
              if (sleepMinute < 59) {
                setState(() {
                  sleepMinute++;
                  setAlarm();
                });
              } else {
                setState(() {
                  sleepMinute = 00;
                  setAlarm();
                });
              }
            },
            minus: () {
              if (sleepMinute > 00) {
                setState(() {
                  sleepMinute--;
                  setAlarm();
                });
              } else {
                setState(() {
                  sleepMinute = 59;
                  setAlarm();
                });
              }
            }),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            ':',
            style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontFamily: 'Digital',
                fontSize: 40),
          ),
        ),
        TimeSection(
          time: meridian,
          plus: () {
            setState(() {
              meridian == 'AM' ? meridian = 'PM' : meridian = 'AM';

              setAlarm();
            });
          },
          minus: () {
            setState(() {
              meridian == 'AM' ? meridian = 'PM' : meridian = 'AM';
              setAlarm();
            });
          },
        )
      ],
    );
  }
}

class TimeSection extends StatelessWidget {
  final String time;
  final Function plus;
  final Function minus;

  TimeSection({this.time, this.plus, this.minus});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        GestureDetector(
          onTap: plus,
          onLongPress: plus,
          child: Container(
            height: 40,
            width: 40,
            child: Icon(
              Icons.add,
              color: buttonTextColor,
            ),
            decoration: BoxDecoration(
              color: appTheme,
              shape: BoxShape.circle,
            ),
          ),
        ),
        SizedBox(
          height: 5,
        ),
        Container(
          child: Center(
            child: Text(
              time,
              style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontFamily: 'Digital',
                fontSize: 20,
              ),
            ),
          ),
          height: 60,
          width: 60,
          decoration: BoxDecoration(
            border: Border.all(color: appTheme, width: 4),
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        SizedBox(
          height: 5,
        ),
        GestureDetector(
          onTap: minus,
          child: Container(
            height: 40,
            width: 40,
            child: Icon(
              Icons.remove,
              color: buttonTextColor,
            ),
            decoration: BoxDecoration(
              color: appTheme,
              shape: BoxShape.circle,
            ),
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:hy_genie/theme_state.dart';
import 'package:hy_genie/widgets/alarm_setter.dart' as alarm;
import 'package:hy_genie/widgets/app_bar.dart';
import 'package:hy_genie/widgets/navigation_bar.dart';
import 'package:hy_genie/widgets/rounded_button.dart';
import 'package:provider/provider.dart';

import '../app_data.dart';
import '../constants.dart';
import 'home_screen.dart';

class CredentialsScreen extends StatefulWidget {
  @override
  _CredentialsScreenState createState() => _CredentialsScreenState();
}

class _CredentialsScreenState extends State<CredentialsScreen> {
  @override
  Widget build(BuildContext context) {
    var appData = Provider.of<AppData>(context);
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            MyAppBar(
              antiHeight: 14,
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'WELCOME',
                      style: TextStyle(
                          fontSize: 15.0,
                          color: buttonTextColor,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Nexa'),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      appData.username.toUpperCase(),
                      style: TextStyle(
                          fontSize: 15.0,
                          color: buttonTextColor,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Nexa'),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 10),
                      child: Text(
                        'What Should We Call You?',
                        style: TextStyle(
                          fontFamily: 'Nunito',
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 0),
                      child: TextField(
                          onChanged: (value) {
                            appData.changeUsername(value);
                          },
                          style:
                              TextStyle(color: Theme.of(context).primaryColor),
                          enabled: true,
                          decoration:
                              fieldDecoration.copyWith(hintText: 'Username')),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 10),
                      child: Text(
                        'What Time Do You Sleep?',
                        style: TextStyle(
                          fontFamily: 'Nunito',
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                    ),
                    alarm.AlarmSetter(),
                    SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Text(
                        'Hy Genie Will Wake You Up Exactly 8 Hours After This Time.\n\nAlarm Is Set For: ',
                        style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontFamily: 'Nunito',
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Text(
                        TimeOfDay.fromDateTime(appData.wakeTime)
                            .format(context),
                        style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontSize: 30,
                          fontFamily: 'Digital',
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    RoundedButton(
                      text: 'DONE',
                      onClicked: () {
                        if (appData.username.length > 2 &&
                            appData.username.length < 20) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => NavigationBar(),
                              ));
                        }
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

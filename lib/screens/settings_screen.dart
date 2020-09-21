import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hy_genie/constants.dart';
import 'package:hy_genie/theme_state.dart';
import 'package:hy_genie/widgets/app_bar.dart';
import 'package:hy_genie/widgets/rounded_button.dart';

class EditNotifications extends StatefulWidget {
  @override
  _EditNotificationsState createState() => _EditNotificationsState();
}

class _EditNotificationsState extends State<EditNotifications> {
  @override
  Widget build(BuildContext context) {
    return SettingsPage(title: 'NOTIFICATIONS');
  }
}

class EditPassword extends StatefulWidget {
  @override
  _EditPasswordState createState() => _EditPasswordState();
}

class _EditPasswordState extends State<EditPassword> {
  @override
  Widget build(BuildContext context) {
    return SettingsPage(title: 'CHANGE PASSWORD');
  }
}

class EditShareStatistics extends StatefulWidget {
  @override
  _EditShareStatisticsState createState() => _EditShareStatisticsState();
}

class _EditShareStatisticsState extends State<EditShareStatistics> {
  @override
  Widget build(BuildContext context) {
    return SettingsPage(title: 'SHARE STATISTICS');
  }
}

class EditTell extends StatefulWidget {
  @override
  _EditTellState createState() => _EditTellState();
}

class _EditTellState extends State<EditTell> {
  @override
  Widget build(BuildContext context) {
    return SettingsPage(title: 'TELL A FRIEND');
  }
}

class EditFeedBack extends StatefulWidget {
  @override
  _EditFeedBackState createState() => _EditFeedBackState();
}

class _EditFeedBackState extends State<EditFeedBack> {
  @override
  Widget build(BuildContext context) {
    return SettingsPage(title: 'FEEDBACK');
  }
}

class SettingsPage extends StatelessWidget {
  final Widget child;
  final String title;
  SettingsPage({this.title, this.child});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            CupertinoScrollbar(
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                  children: [
                    SizedBox(height: MediaQuery.of(context).size.height / 14),
                    Container(child: child),
                  ],
                ),
              ),
            ),
            MyAppBar(
              antiHeight: 14,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Row(
                    children: <Widget>[
                      Icon(
                        Icons.arrow_back_ios,
                        color: buttonTextColor,
                      ),
                      Text(
                        title,
                        style: TextStyle(
                          fontSize: 12,
                          fontFamily: 'Nunito',
                          letterSpacing: 1.6,
                          color: buttonTextColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

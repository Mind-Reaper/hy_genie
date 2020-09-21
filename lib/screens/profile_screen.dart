import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hy_genie/app_data.dart';
import 'package:hy_genie/screens/settings_screen.dart';
import 'package:hy_genie/screens/sub_screens/app_theme.dart';
import 'package:hy_genie/screens/sub_screens/edit_profile.dart';
import 'package:hy_genie/theme_state.dart';
import 'package:hy_genie/widgets/app_bar.dart';
import 'package:provider/provider.dart';

import '../app_data.dart';
import 'sub_screens/sleep_time.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    var appData = Provider.of<AppData>(context);
    return Stack(
      children: <Widget>[
        CupertinoScrollbar(
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: MediaQuery.of(context).size.height / 6.5,
                ),
                Material(
                  borderRadius: BorderRadius.circular(20),
                  color: Theme.of(context).accentColor,
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: Theme.of(context).canvasColor, width: 2),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        children: <Widget>[
                          SettingRow(
                            icon: Icons.account_circle,
                            title: 'EDIT PROFILE',
                            detect: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => EditProfile(),
                                  ));
                            },
                          ),
                          SettingRow(
                            icon: Icons.alarm,
                            title: 'CHANGE SLEEP TIME',
                            detect: () {
                              appData.showTimePicker(context);
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Material(
                  borderRadius: BorderRadius.circular(20),
                  color: Theme.of(context).accentColor,
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: Theme.of(context).canvasColor, width: 2),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        children: <Widget>[
                          SettingRow(
                            icon: Icons.color_lens,
                            title: 'APP THEME',
                            detect: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => EditAppTheme(),
                                  ));
                            },
                          ),
                          SettingRow(
                            icon: Icons.notifications,
                            title: 'NOTIFICATIONS',
                            detect: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => EditNotifications(),
                                  ));
                            },
                          ),
                          SettingRow(
                            icon: Icons.vpn_key,
                            title: 'CHANGE PASSWORD',
                            detect: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => EditPassword(),
                                  ));
                            },
                          ),
                          SettingRow(
                            icon: Icons.info,
                            title: 'SHARE STATISTICS',
                            detect: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => EditShareStatistics(),
                                  ));
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Material(
                  borderRadius: BorderRadius.circular(20),
                  color: Theme.of(context).accentColor,
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: Theme.of(context).canvasColor, width: 2),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        children: <Widget>[
                          SettingRow(
                            icon: Icons.share,
                            title: 'TELL A FRIEND',
                            detect: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => EditTell(),
                                  ));
                            },
                          ),
                          SettingRow(
                            icon: Icons.feedback,
                            title: 'FEEDBACK',
                            detect: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => EditFeedBack(),
                                  ));
                            },
                          ),
                          SettingRow(
                            icon: Icons.exit_to_app,
                            title: 'SIGN OUT',
                            detect: () {},
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 40),
                Text('HY GENIE \nby dannie.io',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 10,
                      fontWeight: FontWeight.w900,
                      letterSpacing: 1.6,
                      fontFamily: 'Nunito',
                    ),
                    textAlign: TextAlign.center),
              ],
            ),
          ),
        ),
        MyAppBar(
          antiHeight: 8,
          child: Padding(
            padding: EdgeInsets.only(left: 8.0, top: 16),
            child: Text(
              'Settings',
              style: TextStyle(
                color: buttonTextColor,
                fontFamily: 'Nunito',
                fontSize: 35,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class SettingRow extends StatelessWidget {
  final IconData icon;
  final String title;
  final Function detect;
  SettingRow({this.icon, this.title, this.detect});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: GestureDetector(
        onTap: detect,
        child: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(children: <Widget>[
                Icon(
                  icon,
                  color: Theme.of(context).primaryColor,
                ),
                SizedBox(width: 10),
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 12,
                    fontFamily: 'Nunito',
                    letterSpacing: 1.6,
                    color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ]),
              Icon(
                Icons.arrow_forward_ios,
                size: 10,
                color: Theme.of(context).primaryColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

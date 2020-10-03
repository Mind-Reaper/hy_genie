import 'dart:async';

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_snake_navigationbar/flutter_snake_navigationbar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hy_genie/screens/data_screen.dart';
import 'package:hy_genie/screens/friend_screen.dart';
import 'package:hy_genie/screens/home_screen.dart';
import 'package:hy_genie/screens/profile_screen.dart';
import 'package:hy_genie/screens/stories_screen.dart';
import 'package:hy_genie/theme_state.dart';
import 'package:outline_material_icons/outline_material_icons.dart';
import 'package:provider/provider.dart';

import '../app_data.dart';

class NavigationBar extends StatefulWidget {
  @override
  _NavigationBarState createState() => _NavigationBarState();
}

class _NavigationBarState extends State<NavigationBar> {
  int _screenIndex = 0;

  final List<Widget> _page = [
    HomeScreen(),
    FriendScreen(),
    StoriesScreen(),
    DataScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    Provider.of<Timing>(context, listen: false).startTime(context);
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      bottomNavigationBar: SnakeNavigationBar(
        currentIndex: _screenIndex,
        snakeShape: SnakeShape.indicator,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(0), topRight: Radius.circular(0)),
        ),
        style: SnakeBarStyle.pinned,
        backgroundColor: Theme.of(context).accentColor,
        selectedItemColor: appTheme,
        showUnselectedLabels: false,
        showSelectedLabels: true,
        // padding: EdgeInsets.only(left: 12, right: 12, bottom: 8),
        snakeColor: appTheme,
        elevation: 0,
        items: [
          BottomNavigationBarItem(
              icon: Icon(OMIcons.home),
              title: Text('HOME',
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1
                      .copyWith(fontSize: 10, color: Colors.white))),
          BottomNavigationBarItem(
              icon: Icon(
                OMIcons.people,
              ),
              title: Text('FREINDS',
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1
                      .copyWith(fontSize: 10, color: Colors.white))),
          BottomNavigationBarItem(
              icon: Icon(
                OMIcons.pages,
              ),
              title: Text('STORIES',
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1
                      .copyWith(fontSize: 10, color: Colors.white))),
          BottomNavigationBarItem(
              icon: FaIcon(FontAwesomeIcons.chartBar, size: 20),
              title: Text('STATISTICS',
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1
                      .copyWith(fontSize: 10, color: Colors.white))),
          BottomNavigationBarItem(
              icon: Icon(
                OMIcons.settings,
              ),
              title: Text('SETTINGS',
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1
                      .copyWith(fontSize: 10, color: Colors.white))),
        ],
        onPositionChanged: (index) {
          setState(() {
            _screenIndex = index;
          });
        },
      ),
      body: SafeArea(
        child: _page[_screenIndex],
      ),
    );
  }
}

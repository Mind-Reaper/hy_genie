import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hy_genie/app_data.dart';
import 'package:hy_genie/home_categoreis/calories.dart';
import 'package:hy_genie/home_categoreis/dental.dart';
import 'package:hy_genie/home_categoreis/hand_wash.dart';
import 'package:hy_genie/home_categoreis/nutrition.dart';
import 'package:hy_genie/home_categoreis/shower.dart';
import 'package:hy_genie/screens/credentials_screen.dart';
import 'package:hy_genie/theme_state.dart';
import 'package:hy_genie/widgets/app_bar.dart';
import 'package:hy_genie/home_categoreis/display.dart';
import 'package:provider/provider.dart';

import '../app_data.dart';

class HomeScreen extends StatefulWidget {
  static _HomeScreenState of(BuildContext context) =>
      context.findAncestorStateOfType<_HomeScreenState>();

  @override
  _HomeScreenState createState() => _HomeScreenState();

  int selected = 0;
}

class _HomeScreenState extends State<HomeScreen> {
  CredentialsScreen credential = CredentialsScreen();

  final controller = ScrollController();
  final vController = ScrollController();

  void changeIndex(int value) {
    setState(() {
      widget.selected = value;
      scrollTo(value.toDouble());
      resetScroll();
    });
  }

  void scrollTo(double value) {
    if (16 * value >= controller.position.maxScrollExtent) {
      controller.animateTo(controller.position.maxScrollExtent,
          duration: Duration(milliseconds: 500), curve: Curves.fastOutSlowIn);
    } else {
      controller.animateTo(16 * value,
          duration: Duration(milliseconds: 500), curve: Curves.fastOutSlowIn);
    }
  }

  void resetScroll() => vController.animateTo(0,
      duration: Duration(milliseconds: 700), curve: Curves.fastOutSlowIn);

  List<Widget> _page = [
    Display(),
    Shower(),
    Dental(),
    Nutrition(),
    HandWash(),
    Calories(),
  ];

  double activeSize = 53;
  double inactiveSize = 50;
  double activeElevation = 10;
  double inactiveElevation = 5;

  Color activeBallColor = appTheme;

  Color activeIconColor = buttonTextColor;

  @override
  Widget build(BuildContext context) {
    // Provider.of<Timing>(context).checkTime();
    Color inactiveIconColor = Theme.of(context).primaryColor;
    Color inactiveBallColor = Theme.of(context).accentColor;
    var appData = Provider.of<AppData>(context);
    String greeting = DateTime.now().hour < 17
        ? DateTime.now().hour < 11 ? 'Morning' : 'Afternoon'
        : 'Evening';
    return Stack(
      children: <Widget>[
        CupertinoScrollbar(
          child: SingleChildScrollView(
              controller: vController,
              physics: BouncingScrollPhysics(),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 5),
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 4.7,
                    ),
                    _page[widget.selected]
                  ],
                ),
              )),
        ),
        Stack(
          children: <Widget>[
            Column(
              children: <Widget>[
                MyAppBar(
                  antiHeight: 6,
                  child: Padding(
                    padding: EdgeInsets.only(left: 8, top: 24),
                    child: Text(
                      'Good $greeting\n${appData.username.inCaps}',
                      style: TextStyle(
                          color: buttonTextColor,
                          fontFamily: 'Nunito',
                          fontSize: 30,
                          height: 1,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                )
              ],
            ),
            SingleChildScrollView(
              controller: controller,
              scrollDirection: Axis.horizontal,
              physics: BouncingScrollPhysics(),
              child: Padding(
                padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height / 8,
                  bottom: 15,
                ),
                child: Container(
                  height: 60,
                  child: Row(
                    children: <Widget>[
                      BallMenu(
                        size: widget.selected == 0 ? activeSize : inactiveSize,
                        elevation: widget.selected == 0
                            ? activeElevation
                            : inactiveElevation,
                        colour: widget.selected == 0
                            ? activeBallColor
                            : inactiveBallColor,
                        iconColor: widget.selected == 0
                            ? activeIconColor
                            : inactiveIconColor,
                        icon: FontAwesomeIcons.bed,
                        select: () {
                          setState(() {
                            changeIndex(0);
                          });
                        },
                      ),
                      BallMenu(
                        size: widget.selected == 1 ? activeSize : inactiveSize,
                        elevation: widget.selected == 1
                            ? activeElevation
                            : inactiveElevation,
                        colour: widget.selected == 1
                            ? activeBallColor
                            : inactiveBallColor,
                        iconColor: widget.selected == 1
                            ? activeIconColor
                            : inactiveIconColor,
                        icon: FontAwesomeIcons.shower,
                        select: () {
                          setState(() {
                            changeIndex(1);
                          });
                        },
                      ),
                      BallMenu(
                        size: widget.selected == 2 ? activeSize : inactiveSize,
                        elevation: widget.selected == 2
                            ? activeElevation
                            : inactiveElevation,
                        colour: widget.selected == 2
                            ? activeBallColor
                            : inactiveBallColor,
                        iconColor: widget.selected == 2
                            ? activeIconColor
                            : inactiveIconColor,
                        icon: FontAwesomeIcons.tooth,
                        select: () {
                          setState(() {
                            changeIndex(2);
                          });
                        },
                      ),
                      BallMenu(
                        size: widget.selected == 3 ? activeSize : inactiveSize,
                        elevation: widget.selected == 3
                            ? activeElevation
                            : inactiveElevation,
                        colour: widget.selected == 3
                            ? activeBallColor
                            : inactiveBallColor,
                        iconColor: widget.selected == 3
                            ? activeIconColor
                            : inactiveIconColor,
                        icon: Icons.fastfood,
                        select: () {
                          setState(() {
                            changeIndex(3);
                          });
                        },
                      ),
                      BallMenu(
                        size: widget.selected == 4 ? activeSize : inactiveSize,
                        elevation: widget.selected == 4
                            ? activeElevation
                            : inactiveElevation,
                        colour: widget.selected == 4
                            ? activeBallColor
                            : inactiveBallColor,
                        iconColor: widget.selected == 4
                            ? activeIconColor
                            : inactiveIconColor,
                        icon: FontAwesomeIcons.handsWash,
                        select: () {
                          setState(() {
                            changeIndex(4);
                          });
                        },
                      ),
                      BallMenu(
                        size: widget.selected == 5 ? activeSize : inactiveSize,
                        elevation: widget.selected == 5
                            ? activeElevation
                            : inactiveElevation,
                        colour: widget.selected == 5
                            ? activeBallColor
                            : inactiveBallColor,
                        iconColor: widget.selected == 5
                            ? activeIconColor
                            : inactiveIconColor,
                        icon: FontAwesomeIcons.heartbeat,
                        select: () {
                          setState(() {
                            changeIndex(5);
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ],
    );
  }
}

class BallMenu extends StatelessWidget {
  final double size;
  final IconData icon;
  final Function select;
  final double elevation;
  final Color colour;
  final Color iconColor;

  BallMenu({
    this.size,
    this.icon,
    this.colour,
    this.iconColor,
    this.select,
    this.elevation,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: elevation == 10 ? Alignment.topCenter : Alignment.center,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 8,
        ),
        child: RawMaterialButton(
          splashColor: appTheme,
          fillColor: colour,
          // elevation: elevation,
          shape: CircleBorder(),
          constraints: BoxConstraints.tightFor(
            height: size,
            width: size,
          ),
          onPressed: select,
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: iconColor, width: 2),
              shape: BoxShape.circle,
            ),
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: FaIcon(
                icon,
                color: iconColor,
                size: size / 2,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

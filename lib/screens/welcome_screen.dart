import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:hy_genie/screens/description_screen.dart';
import 'package:hy_genie/widgets/app_bar.dart';
import 'package:hy_genie/widgets/rounded_button.dart';
import 'package:hy_genie/constants.dart';
import 'package:hy_genie/theme_state.dart';
import 'package:provider/provider.dart';
import 'package:time/time.dart';

import '../app_data.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // floatingActionButton: FloatingActionButton(
      //   child: theme.darkTheme == false
      //       ? Icon(Icons.brightness_2)
      //       : Icon(Icons.brightness_5),
      //   onPressed: () {
      //     setState(() {
      //       theme.changeTheme();
      //       theme.setTheme();
      //     });
      //   },
      // ),
      body: SafeArea(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            MyAppBar(
              antiHeight: 6,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image.asset(
                      'assets/images/Hwhite.png',
                      fit: BoxFit.contain,
                      height: 35.0,
                      width: 30.0,
                    ),
                    Text(
                      'Hy Genie',
                      style: TextStyle(
                          fontSize: 10.0,
                          color: buttonTextColor,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Nexa'),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Expanded(
              child: Text(
                'Say Hello To \n Hy Genie \n Your Body Hygiene Assistant',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Nunito',
                  color: Theme.of(context).primaryColor,
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            // SizedBox(
            //   height: 130,
            // ),
            RoundedButton(
              text: 'HELLO',
              onClicked: () {
                Navigator.pushNamed(context, 'description');
              },
            ),
            SizedBox(height: 40)
          ],
        ),
      ),
    );
  }
}

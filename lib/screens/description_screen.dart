import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hy_genie/theme_state.dart';
import 'package:hy_genie/widgets/app_bar.dart';
import 'package:hy_genie/widgets/description.dart';
import 'package:hy_genie/widgets/rounded_button.dart';

import 'login_screen.dart';

class DescriptionScreen extends StatefulWidget {
  @override
  _DescriptionScreenState createState() => _DescriptionScreenState();
}

class _DescriptionScreenState extends State<DescriptionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            CupertinoScrollbar(
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(children: <Widget>[
                  SizedBox(height: MediaQuery.of(context).size.height / 10),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Hy Genie is going to help maintain a good body hygiene in so many ways : ',
                      style: TextStyle(
                        fontFamily: 'Nunito',
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                  ),
                  ListHead(
                    headIcon: Icons.timer,
                    headName: 'Basic Reminders',
                    detailIcon: Icons.timelapse,
                    detailName1:
                        'Sleep reminder to tell when you sleep regularly',
                    detailName2:
                        'Alarm to wake you up when you have had adequate sleep',
                    detailName3:
                        'Constant reminder to tell you to brush your teeth',
                    detailName4: 'Exercise and workout recommendations',
                  ),
                  ListHead(
                    headIcon: Icons.fastfood,
                    headName: 'Healthy Eating',
                    detailIcon: Icons.kitchen,
                    detailName1:
                        'Amount of food to be eaten at a specific time of the day',
                    detailName2:
                        'Proper time to take your meal according to your wake time',
                    detailName3: 'Good nutrition mixture for your meal',
                    detailName4: "Oops!!! ... don't forget to take water",
                  ),
                  ListHead(
                    headIcon: Icons.insert_chart,
                    headName: 'Statistics And Friends',
                    detailIcon: Icons.group,
                    detailName1:
                        'Keep statistics of your daily hygiene activities',
                    detailName2:
                        'Share your statistics with friends and family',
                    detailName3: 'Send quick messages to friends',
                    detailName4: "Friendly User Interface and So Much More",
                  ),
                  RoundedButton(
                    text: 'PROCEED',
                    onClicked: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LoginScreen(),
                          ));
                    },
                  ),
                  SizedBox(
                    height: 20,
                  )
                ]),
              ),
            ),
            MyAppBar(
              antiHeight: 10,
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
          ],
        ),
      ),
    );
  }
}

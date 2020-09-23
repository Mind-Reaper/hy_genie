import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_material_pickers/flutter_material_pickers.dart';

import 'package:hy_genie/widgets/home_references.dart';
import 'package:hy_genie/widgets/indicator.dart';
import 'package:hy_genie/widgets/my_container.dart';
import 'package:hy_genie/widgets/rounded_button.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:provider/provider.dart';
import 'package:time/time.dart';
import 'package:flutter_picker/flutter_picker.dart';

import '../app_data.dart';

class Display extends StatefulWidget {
  @override
  _DisplayState createState() => _DisplayState();
}

class _DisplayState extends State<Display> {
  @override
  Widget build(BuildContext context) {
    var appData = Provider.of<AppData>(context);
    var timer = Provider.of<Timing>(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Bed Time',
              style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontFamily: 'Nunito',
                fontWeight: FontWeight.bold,
                fontSize: 40,
              ),
            ),
          ],
        ),
        NormalContainer(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Your sleep time is ${TimeOfDay.fromDateTime(appData.myTime).format(context)}',
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontFamily: 'Nunito',
                    ),
                  ),
                  SizedBox(height: 15),
                  Text(
                    'Alarm is set for ${TimeOfDay.fromDateTime(appData.wakeTime).format(context)}',
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontFamily: 'Nunito',
                    ),
                  )
                ],
              ),
              RoundedButton(
                text: 'CHANGE',
                height: 25,
                onClicked: () {
                  appData.showTimePicker(context);
                },
              )
            ],
          ),
        ),
        PictureContainer(
          expand: timer.sleepWell,
          title: 'Sleep Well',
          buttonText: 'PLAY LULLABY',
          image: 'sleepwell',
          childOne: Text(
            'Music will stop 15 minutes from when you play it.',
            style: Theme.of(context).textTheme.bodyText1,
          ),
        ),
        PictureContainer(
          expand: timer.getHydrated,
          title: 'Get Hydrated',
          buttonText: "I'M HYDRATED",
          image: 'drinkswater',
          childOne: Text(
            'Your body becomes de-hydrated during sleep hours.\nIt is important you take at least 3 cups of water after waking up every morning.',
            style: Theme.of(context).textTheme.bodyText1,
          ),
        ),
        PictureContainer(
          expand: timer.getReady,
          title: 'Get Ready',
          image: 'bedtime',
          childOne: Text(
            'Your bedtime is approaching.',
            style: Theme.of(context).textTheme.bodyText1,
          ),
        ),
        Text(
          'Suggestions',
          style: TextStyle(
            color: Theme.of(context).primaryColor,
            fontFamily: 'Nunito',
            fontWeight: FontWeight.bold,
            fontSize: 30,
          ),
        ),
        Reference(
          title: 'You have not taken your bath today.',
          buttonText: 'SHOWER',
          goto: 1,
        ),
        Reference(
          title: 'Prevent cavities, brush twice daily.',
          buttonText: 'BRUSH',
          goto: 2,
        ),
        Reference(
          title:
              'Like any relationship, your relationship with food is no different.',
          buttonText: 'EAT UP',
          goto: 3,
        ),
        Reference(
          title: 'Help prevent the spread of corona virus.',
          buttonText: 'WASH HANDS',
          goto: 4,
        ),
        Reference(
          title: 'Burn calories and reduce risk to chronic diseases.',
          buttonText: 'WORKOUT',
          goto: 5,
        )
      ],
    );
  }
}

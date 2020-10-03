import 'package:flutter/material.dart';

import 'package:hy_genie/screens/home_screen.dart';
import 'package:hy_genie/widgets/home_references.dart';
import 'package:hy_genie/widgets/indicator.dart';
import 'package:hy_genie/widgets/my_container.dart';
import 'package:hy_genie/widgets/rounded_button.dart';
import 'package:provider/provider.dart';

import '../app_data.dart';

class Shower extends StatefulWidget {
  @override
  _ShowerState createState() => _ShowerState();
}

class _ShowerState extends State<Shower> {
  @override
  Widget build(BuildContext context) {
    final _vController = HomeScreen.of(context).vController;
    void vScroll(double value) {
      _vController.animateTo(value,
          duration: Duration(milliseconds: 500), curve: Curves.fastOutSlowIn);
    }

    var timer = Provider.of<Timing>(context);
    var button = Provider.of<ButtonFunctions>(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Shower',
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
          child: Column(
            children: <Widget>[
              Text(
                "It is healthy to take only one shower a day. \nOn days that you don't shower, Give yourself a sponge bath. You need to wash your face, armpits and groin.",
                style: Theme.of(context).textTheme.bodyText1,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Flexible(
                    child: Text(
                      "Don't Know When To Shower ? ",
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                  ),
                  RoundedButton(
                      text: 'BATHING TIPS',
                      height: 25,
                      onClicked: () {
                        vScroll(400);
                      })
                ],
              )
            ],
          ),
        ),
        PictureContainer(
          time: 60 * 5,
          timerButton: true,
          onClicked: () {
            button.done('shower');
          },
          expand: timer.shower,
          title: 'Shower',
          buttonText: 'SHOWER',
          image: 'shower',
          childOne: Text(
            'You have not showered at all today.\nA minimum of 5 minutes shower is required for good hygiene.',
            style: Theme.of(context).textTheme.bodyText1,
          ),
          childTwo: Text(
            "Make sure to apply moisturizer/body lotion to your skin after each shower.",
            style: Theme.of(context).textTheme.bodyText1,
          ),
        ),
        PictureContainer(
          onClicked: () {
            button.done('bodylotion');
          },
          expand: timer.bodyLotion,
          title: 'Body Lotion',
          buttonText: 'APPLY',
          image: 'moisturizers',
          childOne: Text(
            "Make sure to apply moisturizer/body lotion to your skin after each shower.",
            style: Theme.of(context).textTheme.bodyText1,
          ),
        ),
        NormalContainer(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Bathing Tips',
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontFamily: 'Nunito',
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                ),
              ),
              Text(
                "• Don't shower in hot water. Use warm water instead.\n• Use a gentle soap or cleanser, and thoroughly rinse off soap before exiting the shower.\n• Don't rub your skin with a towel. Blot skin dry to retain moisture.\n• Avoid cleansers and soap with fragrances or deodorants. These products can irritate youe skin.\n• Don't go too long between showers.",
                style:
                    Theme.of(context).textTheme.bodyText1.copyWith(height: 1.6),
                textAlign: TextAlign.left,
              ),
              SizedBox(height: 5),
              Text('WHEN YOU SHOULD TAKE MORNING SHOWER',
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1
                      .copyWith(fontWeight: FontWeight.bold)),
              Text(
                "• If you have an oily skin.\n• If you have hard time waking up.\n• You work out in the morning.\n• You have a job that requires coming up with creative ideas.",
                style:
                    Theme.of(context).textTheme.bodyText1.copyWith(height: 1.6),
                textAlign: TextAlign.left,
              ),
              SizedBox(height: 5),
              Text('WHEN YOU SHOULD SHOWER IN THE NIGHT',
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1
                      .copyWith(fontWeight: FontWeight.bold)),
              Text(
                "• You have a hard time getting to sleep.\n• You have a dry skin.\n• If you like to keep your bedsheets clean.\n• If you have been out the whole day.\n• You work out in the evening.",
                style:
                    Theme.of(context).textTheme.bodyText1.copyWith(height: 1.6),
                textAlign: TextAlign.left,
              )
            ],
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
            title: 'Just finished brushing? Use an anti-cavity mouthwash'),
        Reference(
          title: 'Eating is like fueling your car before a long journey.',
          buttonText: 'NUTRITION',
          goto: 3,
        ),
        Reference(
          title: 'Read some health facts',
          buttonText: 'READ',
          goto: 5,
        ),
      ],
    );
  }
}

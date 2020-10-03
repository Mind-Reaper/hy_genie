import 'package:flutter/material.dart';
import 'package:hy_genie/widgets/indicator.dart';
import 'package:hy_genie/widgets/my_container.dart';
import 'package:hy_genie/widgets/rounded_button.dart';
import 'package:provider/provider.dart';

import '../app_data.dart';

class Nutrition extends StatefulWidget {
  @override
  _NutritionState createState() => _NutritionState();
}

class _NutritionState extends State<Nutrition> {
  bool show = true;
  bool show2 = false;

  @override
  Widget build(BuildContext context) {
    var timer = Provider.of<Timing>(context);
    var button = Provider.of<ButtonFunctions>(context);
    return Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Nutrition',
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
          children: [
            Text(
              "Good food nutrients combination is one of the most important thing many people fail to realize.\nInfact good nutrition can improve your immune system to prevent some of the worst diseases.",
              style: Theme.of(context).textTheme.bodyText1,
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Balance your nutrition now.',
                  style: Theme.of(context).textTheme.bodyText1,
                ),
                RoundedButton(
                  text: 'READ',
                  height: 25,
                )
              ],
            )
          ],
        ),
      ),
      PictureContainer(
        onClicked: () {
          button.done('breakfast');
        },
        expand: timer.breakfast,
        title: 'Breakfast',
        image: 'breakfast',
        buttonText: 'EATEN',
        childOne: Text(
            "Your breakfast should not be too heavy, but shouldn't be too light also. It should be enough to fill you till lunch.",
            style: Theme.of(context).textTheme.bodyText1),
        childTwo: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('A healthy breakfast should contain the following,',
                style: Theme.of(context).textTheme.bodyText1),
            Text('◉  Whole grains',
                style: Theme.of(context).textTheme.bodyText1),
            Text('◉  Lean protein',
                style: Theme.of(context).textTheme.bodyText1),
            Text('◉  Low-fat dairy',
                style: Theme.of(context).textTheme.bodyText1),
            Text('◉  Fruits and vegetables',
                style: Theme.of(context).textTheme.bodyText1),
          ],
        ),
      ),
      PictureContainer(
        onClicked: () {
          button.done('lunch');
        },
        title: 'Lunch',
        buttonText: 'EATEN',
        expand: timer.lunch,
        image: 'lunch',
        childOne: Text(
            'Your digestive fire is the highest during noon, this is the best time to eat your heavy meal since it gets digested easily.',
            style: Theme.of(context).textTheme.bodyText1),
        childTwo: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('A healthy lunch should contain the following,',
                style: Theme.of(context).textTheme.bodyText1),
            Text('◉  Complex carbohydrates',
                style: Theme.of(context).textTheme.bodyText1),
            Text('◉  Protein', style: Theme.of(context).textTheme.bodyText1),
            Text('◉  Low-fat dairy',
                style: Theme.of(context).textTheme.bodyText1),
            Text('◉  Assorted fruits',
                style: Theme.of(context).textTheme.bodyText1),
          ],
        ),
      ),
      PictureContainer(
        onClicked: () {
          button.done('dinner');
        },
        expand: timer.dinner,
        title: 'Dinner',
        buttonText: 'EATEN',
        image: 'dinner',
        childOne: Text(
            "Dinner should be the lightest meal of the day because it is the last meal before retiring for the day.",
            style: Theme.of(context).textTheme.bodyText1),
      )
    ]);
  }
}

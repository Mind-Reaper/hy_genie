import 'package:flutter/material.dart';
import 'package:hy_genie/screens/sub_screens/oral_products.dart';
import 'package:hy_genie/widgets/home_references.dart';
import 'package:hy_genie/widgets/indicator.dart';
import 'package:hy_genie/widgets/my_container.dart';
import 'package:hy_genie/widgets/rounded_button.dart';
import 'package:provider/provider.dart';
import 'package:hy_genie/app_data.dart';

class Dental extends StatefulWidget {
  @override
  _DentalState createState() => _DentalState();
}

class _DentalState extends State<Dental> {
  @override
  Widget build(BuildContext context) {
    var timer = Provider.of<Timing>(context);
    var button = Provider.of<ButtonFunctions>(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Dental Care',
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
                'It takes a lifetime of care to achieve and maintain healthy teeth.\nIt is important that you get the perfect oral care product and brush at least twice a day.',
                style: Theme.of(context).textTheme.bodyText1,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: Text(
                      'Getting the perfect oral products.',
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                  ),
                  RoundedButton(
                    text: "READ",
                    height: 25,
                    onClicked: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => OralProduct(),
                          ));
                    },
                  )
                ],
              )
            ],
          ),
        ),
        PictureContainer(
          timerButton: true,
          time: 120,
          onClicked: () {
            button.done('brushday');
          },
          expand: timer.brushDay,
          title: 'Brush',
          buttonText: 'START BRUSH',
          image: 'daybrush',
          childOne: Text(
            'Healthy brushing should take at least 2 minutes.',
            style: Theme.of(context).textTheme.bodyText1,
          ),
          childTwo: Column(
            children: [
              Text(
                "While you sleep, bacteria in your mouth multiply. That is why you may wake up with a bitter taste and morning breath.\nIt is better to brush before breakfast in the morning immediately you wake up.",
                style: Theme.of(context).textTheme.bodyText1,
              ),
              Text(
                "Use a mouthwash after brushing, It is very important.",
                style: Theme.of(context).textTheme.bodyText1,
              ),
            ],
          ),
        ),
        PictureContainer(
          timerButton: true,
          time: 120,
          onClicked: () {
            button.done('brushnight');
          },
          expand: timer.brushNight,
          title: 'Brush',
          buttonText: 'START BRUSH',
          image: 'nightbrush',
          childOne: Text(
            'Healthy brushing should take at least 2 minutes.',
            style: Theme.of(context).textTheme.bodyText1,
          ),
          childTwo: Column(
            children: [
              Text(
                "Brushing your teeth before you go to bed helps protect against plaque buildup, tooth decay and gum diseases.\nIf you are particularly susceptible to cavities and gum disease, dentists recommend that you brush immediately after dinner, then again right before bedtime.",
                style: Theme.of(context).textTheme.bodyText1,
              ),
              Text(
                "Use a mouthwash after brushing, It is very important.",
                style: Theme.of(context).textTheme.bodyText1,
              ),
            ],
          ),
        ),
        PictureContainer(
          expand: timer.brushHydration,
          title: 'Get Hydrated',
          image: 'brushwait',
          childOne: Text(
            "Your brushing time is not due yet.\nDrink water regularly especially after meals, it can help wash out some of the negative effects of sticky and acidic foods and beverages.",
            style: Theme.of(context).textTheme.bodyText1,
          ),
        ),
        NormalContainer(
          child: Column(children: [
            Text(
              'Things To Consider While Brushing',
              style: Theme.of(context).textTheme.bodyText1.copyWith(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
            ),
            Text(
              "• Place your toothbrush at a 45-degree angle to the gums.\n• Gently move the brush back and forth in short(tooth-wide)strokes.\n• Brush the outer surfaces, inner surfaces and the chewing surfaces of the teeth.\n• To clean the inside surfaces of the front teeth, tilt the brush vertically and make several up and down strokes.\n• Gently brush your tongue, plaque can also build up on it.",
              style:
                  Theme.of(context).textTheme.bodyText1.copyWith(height: 1.6),
            ),
          ]),
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
          title: 'Now is a good time to take your morning shower',
          buttonText: 'SHOWER',
          goto: 1,
        ),
        Reference(
            title: 'Having tooth problems, make sure to go see a dentist.')
      ],
    );
  }
}

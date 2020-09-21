import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hy_genie/theme_state.dart';
import 'package:hy_genie/widgets/app_bar.dart';
import 'package:hy_genie/widgets/indicator.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:provider/provider.dart';

import '../app_data.dart';

class DataScreen extends StatefulWidget {
  @override
  _DataScreenState createState() => _DataScreenState();
}

class _DataScreenState extends State<DataScreen> {
  final trackControl = ScrollController();

  @override
  Widget build(BuildContext context) {
    var appData = Provider.of<AppData>(context);
    return Column(children: [
      Stack(children: [
        MyAppBar(
            antiHeight: 7,
            child: Padding(
              padding: EdgeInsets.only(left: 8, top: 16),
              child: Text(
                'Statistics',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontFamily: 'Nunito',
                  fontWeight: FontWeight.bold,
                ),
              ),
            )),
        Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          SizedBox(height: MediaQuery.of(context).size.height / 12),
          Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Padding(
              padding: EdgeInsets.only(left: 12.0, right: 8),
              child: Container(
                height: 120,
                width: 120,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.white, width: 4),
                    color: Colors.white,
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: AssetImage('assets/images/profile.jpg'),
                      fit: BoxFit.fill,
                    )),
              ),
            ),
            Flexible(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 45),
                    Text(
                      appData.username.inCaps,
                      style: Theme.of(context).textTheme.bodyText1.copyWith(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                      overflow: TextOverflow.fade,
                      maxLines: 1,
                      softWrap: false,
                    ),
                    Row(children: [
                      CircularIndicator(percent: 76.45),
                      Flexible(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('AVERAGE HYGIENE SCORE',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1
                                  .copyWith(fontSize: 10)),
                        ),
                      )
                    ])
                  ]),
            ),
          ]),
        ]),
      ]),
      SizedBox(height: 15),
      Text(
        'Hygiene Tracker',
        style: Theme.of(context)
            .textTheme
            .bodyText1
            .copyWith(fontSize: 25, fontWeight: FontWeight.bold),
      ),
      Expanded(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: Material(
              borderRadius: BorderRadius.circular(20),
              color: Theme.of(context).accentColor,
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                      color: Theme.of(context).canvasColor, width: 2),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: CupertinoScrollbar(
                  controller: trackControl,
                  isAlwaysShown: true,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: ListView(
                        physics: BouncingScrollPhysics(),
                        controller: trackControl,
                        children: [
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                CircularIndicator(
                                    footer: 'bedtime', percent: 67.89),
                                CircularIndicator(
                                    footer: 'shower', percent: 90.89),
                                CircularIndicator(
                                    footer: 'dental care', percent: 45.89),
                              ]),
                          SizedBox(height: 10),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                CircularIndicator(
                                    footer: 'nutrition', percent: 87.89),
                                CircularIndicator(
                                    footer: 'handwash', percent: 95.89),
                                CircularIndicator(
                                    footer: 'health', percent: 75.89),
                              ]),
                          TrackerView(
                            name: 'Bed Time',
                            percent: 67.89,
                          ),
                          TrackerView(
                            name: 'Shower',
                            percent: 90.89,
                          ),
                          TrackerView(
                            name: 'Dental Care',
                            percent: 45.89,
                          ),
                          TrackerView(
                            name: 'Nutrition',
                            percent: 87.89,
                          ),
                          TrackerView(
                            name: 'HandWash',
                            percent: 95.89,
                          ),
                          TrackerView(
                            name: 'Health',
                            percent: 75.89,
                          ),
                        ]),
                  ),
                ),
              )),
        ),
      ),
    ]);
  }
}

class TrackerView extends StatelessWidget {
  final String commentA;
  final String commentB;
  final double percent;
  final String name;
  TrackerView({this.name, this.percent, this.commentA, this.commentB});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 16),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text('$name Tracker',
            style: Theme.of(context).textTheme.bodyText1.copyWith(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                )),
        LinearIndicator(percent),
        SizedBox(height: 5),
        Text(commentA == null ? 'Define Comment A' : commentA,
            style: Theme.of(context).textTheme.bodyText1),
        SizedBox(
            height: 15,
            width: 300,
            child: Divider(
              color: Colors.grey,
            )),
        Text(commentB == null ? 'Define Comment B' : commentB,
            style: Theme.of(context).textTheme.bodyText1),
      ]),
    );
  }
}

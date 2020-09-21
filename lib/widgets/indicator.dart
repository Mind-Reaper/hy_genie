import 'package:flutter/material.dart';
import 'package:hy_genie/theme_state.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:percent_indicator/percent_indicator.dart';

class CircularIndicator extends StatefulWidget {
  final String footer;
  final double percent;

  CircularIndicator({this.footer, this.percent});

  @override
  _CircularIndicatorState createState() => _CircularIndicatorState();
}

class _CircularIndicatorState extends State<CircularIndicator> {
  Color color = Colors.blue;

  @override
  Widget build(BuildContext context) {
    if (widget.percent >= 90) {
      color = appTheme;
    } else if (widget.percent >= 80) {
      color = Colors.green;
    } else if (widget.percent >= 50) {
      color = Colors.orangeAccent;
    } else {
      color = Colors.red;
    }

    return CircularPercentIndicator(
      radius: 50,
      lineWidth: 7.0,
      animation: true,
      center: Text('${widget.percent.toStringAsFixed(1)}%',
          style: Theme.of(context).textTheme.bodyText1.copyWith(fontSize: 10)),
      footer: widget.footer != null
          ? Text(
              widget.footer,
              style:
                  Theme.of(context).textTheme.bodyText1.copyWith(fontSize: 11),
            )
          : null,
      circularStrokeCap: CircularStrokeCap.round,
      percent: widget.percent / 100,
      progressColor: color,
      backgroundColor: Color(0x00ffffff),
    );
  }
}

class LinearIndicator extends StatefulWidget {
  final double percent;
  LinearIndicator(this.percent);

  @override
  _LinearIndicatorState createState() => _LinearIndicatorState();
}

class _LinearIndicatorState extends State<LinearIndicator> {
  Color color = Colors.blue;

  @override
  Widget build(BuildContext context) {
    if (widget.percent >= 90) {
      color = appTheme;
    } else if (widget.percent >= 80) {
      color = Colors.green;
    } else if (widget.percent >= 50) {
      color = Colors.orangeAccent;
    } else {
      color = Colors.red;
    }
    return LinearPercentIndicator(
      width: MediaQuery.of(context).size.width - 50,
      animation: true,
      lineHeight: 12,
      percent: widget.percent / 100,
      center: Text('${widget.percent.toStringAsFixed(1)}%',
          style: Theme.of(context).textTheme.bodyText1.copyWith(fontSize: 10)),
      linearStrokeCap: LinearStrokeCap.roundAll,
      progressColor: color,
      backgroundColor: Color(0xfff2f2f2),
    );
  }
}

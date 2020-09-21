import 'package:flutter/material.dart';
import 'package:hy_genie/theme_state.dart';

class MyAppBar extends StatelessWidget {
  final double antiHeight;
  final Widget child;
  MyAppBar({this.antiHeight, this.child});
  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'appBar',
      child: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height / antiHeight,
        child: child,
        decoration: BoxDecoration(
          color: Theme.of(context).buttonColor,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
        ),
      ),
    );
  }
}

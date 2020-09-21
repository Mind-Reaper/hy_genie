import 'package:flutter/material.dart';
import 'package:hy_genie/widgets/rounded_button.dart';

class PictureContainer extends StatelessWidget {
  PictureContainer({
    this.title,
    this.buttonText,
    this.onClicked,
    this.childOne,
    this.childTwo,
    this.expand: true,
    this.image,
  });

  final String title;
  final String buttonText;
  final Function onClicked;
  final Widget childOne;
  final Widget childTwo;
  final String image;
  final bool expand;

  @override
  Widget build(BuildContext context) {
    return ExpandedSection(
      expand: expand,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 10),
        child: Container(
          decoration: BoxDecoration(boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(.2),
                blurRadius: 15,
                spreadRadius: 0.0,
                offset: Offset(-2.0, 3.0))
          ]),
          child: Material(
            borderRadius: BorderRadius.circular(20),
            elevation: 0,
            color: Theme.of(context).accentColor,
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                      // border: Border.all(color: Theme.of(context).canvasColor, width: 2),
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(20)),
                      image: DecorationImage(
                        colorFilter:
                            ColorFilter.mode(Colors.black26, BlendMode.darken),
                        image: AssetImage(
                          'assets/images/$image.jpg',
                        ),
                        fit: BoxFit.cover,
                      )),
                  width: double.infinity,
                  height: 50,
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          title,
                          style: Theme.of(context).textTheme.bodyText1.copyWith(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                        if (buttonText != null)
                          RoundedButton(
                              text: buttonText,
                              height: 25,
                              inverted: true,
                              onClicked: onClicked)
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      childOne,
                      if (childTwo != null)
                        SizedBox(
                            height: 20,
                            width: 250,
                            child: Divider(color: Colors.grey)),
                      if (childTwo != null) childTwo,
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class NormalContainer extends StatelessWidget {
  final Widget child;
  NormalContainer({this.child});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Container(
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
              color: Colors.black.withOpacity(.2),
              blurRadius: 15,
              spreadRadius: 0.0,
              offset: Offset(-2.0, 3.0))
        ]),
        child: Material(
          borderRadius: BorderRadius.circular(20),
          color: Theme.of(context).accentColor,
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: child,
          ),
        ),
      ),
    );
  }
}

class ExpandedSection extends StatefulWidget {
  final Widget child;
  final bool expand;
  ExpandedSection({this.expand = true, this.child});

  @override
  _ExpandedSectionState createState() => _ExpandedSectionState();
}

class _ExpandedSectionState extends State<ExpandedSection>
    with SingleTickerProviderStateMixin {
  AnimationController expandController;
  Animation<double> animation;

  @override
  void initState() {
    super.initState();
    prepareAnimations();
    _runExpandCheck();
  }

  ///Setting up the animation
  void prepareAnimations() {
    expandController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 700));
    animation = CurvedAnimation(
      parent: expandController,
      curve: Curves.easeInOut,
    );
  }

  void _runExpandCheck() {
    if (widget.expand) {
      expandController.forward();
    } else {
      expandController.reverse();
    }
  }

  @override
  void didUpdateWidget(ExpandedSection oldWidget) {
    super.didUpdateWidget(oldWidget);
    _runExpandCheck();
  }

  @override
  void dispose() {
    expandController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: animation,
      child: SizeTransition(
        axis: Axis.vertical,
        sizeFactor: animation,
        child: widget.child,
      ),
    );
  }
}

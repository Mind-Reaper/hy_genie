import 'package:flutter/material.dart';
import 'package:hy_genie/widgets/rounded_button.dart';
import 'package:circular_countdown/circular_countdown.dart';

class PictureContainer extends StatefulWidget {
  PictureContainer({
    this.title,
    this.buttonText,
    this.onClicked,
    this.childOne,
    this.childTwo,
    this.expand: true,
    this.image,
    this.time,
    this.timerButton = false,
    this.countdown = false,
  });

  final String title;
  final String buttonText;
  final Function onClicked;
  final Widget childOne;
  final Widget childTwo;
  final String image;
  final bool expand;
  final int time;
  final bool timerButton;
  final bool countdown;

  @override
  _PictureContainerState createState() => _PictureContainerState();
}

class _PictureContainerState extends State<PictureContainer> {
  double shadow = 0.2;
  double margin = 0;
  bool startCountdown = false;

  @override
  Widget build(BuildContext context) {
    return ExpandedSection(
      expand: widget.expand,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 10),
        child: AnimatedContainer(
          margin: EdgeInsets.all(margin),
          duration: Duration(milliseconds: 200),
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                  color: Colors.black.withOpacity(shadow),
                  blurRadius: 15,
                  spreadRadius: 0.0,
                  offset: Offset(-2.0, 3.0))
            ],
          ),
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
                          'assets/images/${widget.image}.jpg',
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
                          widget.title,
                          style: Theme.of(context).textTheme.bodyText1.copyWith(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                        if (widget.buttonText != null)
                          RoundedButton(
                              countdown: startCountdown,
                              time: widget.time,
                              timerButton: widget.timerButton,
                              text: widget.buttonText,
                              height: 25,
                              inverted: true,
                              onFinished: () {
                                setState(() {
                                  startCountdown = false;
                                  if (widget.onClicked != null) {
                                    widget.onClicked();
                                  }
                                });
                              },
                              onClicked: widget.timerButton == true
                                  ? startCountdown == false
                                      ? () {
                                          setState(() {
                                            startCountdown = true;
                                          });
                                        }
                                      : () {
                                          setState(() {
                                            startCountdown = false;
                                          });
                                        }
                                  : widget.onClicked)
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onLongPress: () {
                    setState(() {
                      shadow = 0.0;
                      margin = 2;
                    });
                  },
                  onLongPressUp: () {
                    setState(() {
                      shadow = 0.2;
                      margin = 0;
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        widget.childOne,
                        if (widget.childTwo != null)
                          SizedBox(
                              height: 20,
                              width: 250,
                              child: Divider(color: Colors.grey)),
                        if (widget.childTwo != null) widget.childTwo,
                      ],
                    ),
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
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));
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

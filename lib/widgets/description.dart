import 'package:flutter/material.dart';
import 'package:hy_genie/theme_state.dart';

class ListHead extends StatelessWidget {
  final IconData headIcon;
  final String headName;
  final IconData detailIcon;
  final String detailName1;
  final String detailName2;
  final String detailName3;
  final String detailName4;

  ListHead(
      {this.headIcon,
      this.headName,
      this.detailIcon,
      this.detailName1,
      this.detailName2,
      this.detailName3,
      this.detailName4});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child: Column(
          children: <Widget>[
            Row(children: <Widget>[
              Icon(
                headIcon,
                color: Theme.of(context).primaryColor,
                size: 40,
              ),
              SizedBox(width: 10),
              Flexible(
                child: Text(
                  headName,
                  style: TextStyle(
                    fontFamily: 'Nunito',
                    color: Theme.of(context).primaryColor,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ]),
            ListDetails(
              detailIcon: detailIcon,
              detailName: detailName1,
            ),
            ListDetails(
              detailIcon: detailIcon,
              detailName: detailName2,
            ),
            ListDetails(
              detailIcon: detailIcon,
              detailName: detailName3,
            ),
            ListDetails(
              detailIcon: detailIcon,
              detailName: detailName4,
            ),
          ],
        ),
      ),
    );
  }
}

class ListDetails extends StatelessWidget {
  ListDetails({this.detailIcon, this.detailName});

  final String detailName;
  final IconData detailIcon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 50,
        vertical: 10,
      ),
      child: Row(children: <Widget>[
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Icon(
              detailIcon,
              color: Theme.of(context).primaryColor,
              size: 20,
            ),
          ],
        ),
        SizedBox(width: 10),
        Flexible(
          child: Column(
            children: <Widget>[
              Text(
                detailName,
                style: TextStyle(
                  fontFamily: 'Nunito',
                  color: Theme.of(context).primaryColor,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ]),
    );
  }
}

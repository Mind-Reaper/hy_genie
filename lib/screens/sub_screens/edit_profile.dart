import 'package:flutter/material.dart';
import 'package:hy_genie/app_data.dart';
import 'package:hy_genie/widgets/rounded_button.dart';
import 'package:provider/provider.dart';

import '../../theme_state.dart';
import '../settings_screen.dart';

class EditProfile extends StatefulWidget {
  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  @override
  Widget build(BuildContext context) {
    var appData = Provider.of<AppData>(context);
    return SettingsPage(
      title: 'EDIT PROFILE',
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Text(
                'Tap To Edit Profile Picture',
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontFamily: 'Nunito',
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              height: 100,
              width: 100,
              child: Icon(
                Icons.add_a_photo,
                color: Colors.white,
                size: 50,
              ),
              decoration: BoxDecoration(
                  border: Border.all(
                      color: Theme.of(context).primaryColor, width: 2),
                  color: Colors.white,
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    colorFilter:
                        ColorFilter.mode(Colors.black54, BlendMode.dstATop),
                    image: AssetImage('assets/images/profile.jpg'),
                    fit: BoxFit.cover,
                  )),
            ),
            SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Text(
                'Edit Display Name',
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontFamily: 'Nunito',
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            TextField(
              onChanged: (value) {
                appData.changeUsername(value);
              },
              decoration: InputDecoration(
                hintText: 'New Display Name',
                // put display variable here
                labelText: appData.username.toUpperCase(),
                labelStyle: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontFamily: 'Nunito',
                  fontSize: 10,
                ),
                fillColor: Theme.of(context).canvasColor,
                filled: true,
                focusColor: Theme.of(context).accentColor,

                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide.none,
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide.none,
                ),
                isDense: true,
                contentPadding: EdgeInsets.all(12),
              ),
            ),
            SizedBox(height: 50),
            RoundedButton(
              text: 'DONE',
              onClicked: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:hy_genie/screens/login_screen.dart';
import 'package:hy_genie/theme_state.dart';
import 'package:hy_genie/widgets/app_bar.dart';
import 'package:hy_genie/widgets/rounded_button.dart';
import 'package:provider/provider.dart';

import '../constants.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    String registerImage =
        Provider.of<ThemeChanger>(context).theme == ThemeType.Dark
            ? 'assets/images/registerdark.gif'
            : 'assets/images/register.gif';
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  SizedBox(height: MediaQuery.of(context).size.height / 8),
                  Container(
                    height: 200,
                    width: 200,
                    child: Image.asset(registerImage),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 10),
                    child: TextField(
                      style: TextStyle(color: Theme.of(context).primaryColor),
                      enabled: true,
                      decoration: fieldDecoration,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 10),
                    child: TextField(
                      style: TextStyle(color: Theme.of(context).primaryColor),
                      obscureText: true,
                      enabled: true,
                      decoration:
                          fieldDecoration.copyWith(hintText: 'Password'),
                    ),
                  ),
                  SizedBox(height: 20),
                  RoundedButton(
                    text: 'REGISTER',
                    onClicked: () {},
                  ),
                  SizedBox(
                      child: Center(
                        child: Text('or',
                            style: Theme.of(context).textTheme.bodyText1),
                      ),
                      height: 15),
                  Signing(text: 'UP'),
                  RichText(
                    text: TextSpan(
                        style: TextStyle(color: Theme.of(context).primaryColor),
                        children: <TextSpan>[
                          TextSpan(text: "Already Have An Account?  "),
                          TextSpan(
                            text: 'Login',
                            style: TextStyle(
                              color: appTheme,
                              decoration: TextDecoration.underline,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.pop(context);
                              },
                          )
                        ]),
                  ),
                ],
              ),
            ),
            MyAppBar(
              antiHeight: 14,
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image.asset(
                      'assets/images/Hwhite.png',
                      fit: BoxFit.contain,
                      height: 35.0,
                      width: 30.0,
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Text(
                      'REGISTER',
                      style: TextStyle(
                          fontSize: 15.0,
                          color: buttonTextColor,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Nexa'),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

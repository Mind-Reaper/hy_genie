import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hy_genie/screens/credentials_screen.dart';
import 'package:hy_genie/screens/register_screen.dart';
import 'package:hy_genie/theme_state.dart';
import 'package:hy_genie/widgets/app_bar.dart';
import 'package:hy_genie/widgets/my_container.dart';
import 'package:hy_genie/widgets/rounded_button.dart';
import 'package:provider/provider.dart';
import 'dart:io' show Platform;

import '../constants.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String email;
  @override
  Widget build(BuildContext context) {
    String loginImage =
        Provider.of<ThemeChanger>(context).theme == ThemeType.Dark
            ? 'assets/images/logindark.gif'
            : 'assets/images/Login.gif';
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
                    child: Image.asset(loginImage),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 10),
                    child: TextField(
                      style: TextStyle(color: Theme.of(context).primaryColor),
                      enabled: true,
                      onChanged: (value) {
                        setState(() {
                          email = value;
                        });
                      },
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
                  if (email != null)
                    SizedBox(
                        height: 30,
                        child: Center(
                          child: RichText(
                              text: TextSpan(
                                  text: 'Forgotten Password?',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText1
                                      .copyWith(
                                        color: appTheme,
                                        fontSize: 10,
                                        decoration: TextDecoration.underline,
                                      ))),
                        )),
                  RoundedButton(
                    text: 'LOGIN',
                    onClicked: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CredentialsScreen(),
                          ));
                    },
                  ),
                  SizedBox(
                      child: Center(
                        child: Text('or',
                            style: Theme.of(context).textTheme.bodyText1),
                      ),
                      height: 15),
                  Signing(text: 'IN'),
                  RichText(
                    text: TextSpan(
                        style: TextStyle(color: Theme.of(context).primaryColor),
                        children: <TextSpan>[
                          TextSpan(text: "Don't Have An Account?  "),
                          TextSpan(
                            text: 'Register',
                            style: TextStyle(
                              color: appTheme,
                              decoration: TextDecoration.underline,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => RegisterScreen(),
                                    ));
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
                      width: 10,
                    ),
                    Text(
                      'LOGIN',
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

class Signing extends StatelessWidget {
  final String text;
  final Function onClicked;

  Signing({this.text, this.onClicked});

  @override
  final String platform = Platform.isIOS ? 'APPLE' : 'GOOGLE';
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 80),
      child: InkWell(
        onTap: onClicked,
        child: NormalContainer(
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
              FaIcon(
                Platform.isIOS
                    ? FontAwesomeIcons.apple
                    : FontAwesomeIcons.google,
                color: Theme.of(context).primaryColor,
                size: 10,
              ),
              Text('SIGN $text WITH $platform',
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1
                      .copyWith(fontWeight: FontWeight.bold, fontSize: 12))
            ])),
      ),
    );
  }
}

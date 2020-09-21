import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter/services.dart';
import 'package:hy_genie/screens/welcome_screen.dart';
import 'package:hy_genie/theme_state.dart';
import 'package:provider/provider.dart';

import 'app_data.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ThemeChanger>(
            create: (context) => ThemeChanger()),
        ChangeNotifierProvider<AppData>(create: (context) => AppData()),
        ChangeNotifierProvider<Timing>(create: (context) => Timing())
      ],
      child: MaterialAppWithTheme(),
    );
  }
}

class MaterialAppWithTheme extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
          statusBarColor: appTheme,
          systemNavigationBarColor: appTheme,
          systemNavigationBarIconBrightness: Brightness.light),
      child: MaterialApp(
        builder: (context, child) {
          return MediaQuery(
            child: child,
            data: MediaQuery.of(context).copyWith(textScaleFactor: 0.9),
          );
        },
        home: Material(child: SplashScreen()),
        debugShowCheckedModeBanner: false,
        theme: Provider.of<ThemeChanger>(context).theme == ThemeType.Dark
            ? AppTheme.dark
            : AppTheme.light,
      ),
    );
  }
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState

    super.initState();

    Timer(
        Duration(seconds: 3),
        () => Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => WelcomeScreen(),
            )));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appTheme,
      body: Container(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Expanded(
            flex: 6,
            child: Container(
                height: 150,
                width: 150,
                child: Image.asset('assets/images/Hwhite.png')),
          ),
          Expanded(
            flex: 1,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Text(
                'Hy Genie',
                style: TextStyle(
                    fontSize: 30.0,
                    color: Colors.white,
                    fontWeight: FontWeight.w900,
                    fontFamily: 'Nexa'),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          )
        ],
      )),
    );
  }
}

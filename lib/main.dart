import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter/services.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hy_genie/screens/welcome_screen.dart';
import 'package:hy_genie/theme_state.dart';
import 'package:provider/provider.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

import 'app_data.dart';
import 'screens/credentials_screen.dart';
import 'screens/description_screen.dart';
import 'screens/home_screen.dart';
import 'screens/login_screen.dart';
import 'screens/register_screen.dart';
import 'widgets/navigation_bar.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final appDocumentDirectory =
      await path_provider.getApplicationDocumentsDirectory();
  Hive.init(appDocumentDirectory.path);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider<ThemeChanger>(create: (context) => ThemeChanger()),
      ChangeNotifierProvider<AppData>(create: (context) => AppData()),
      ChangeNotifierProvider<Timing>(create: (context) => Timing()),
      ChangeNotifierProvider<ButtonFunctions>(
          create: (context) => ButtonFunctions()),
    ], child: MaterialAppWithTheme());
  }
}

class MaterialAppWithTheme extends StatefulWidget {
  @override
  _MaterialAppWithThemeState createState() => _MaterialAppWithThemeState();
}

class _MaterialAppWithThemeState extends State<MaterialAppWithTheme> {
  @override
  Widget build(BuildContext context) {
    // Timer.periodic(Duration(seconds: 1), (timer) {
    //   Timing().updateWidgets(context);
    //   // Provider.of<ButtonFunctions>(context, listen: false)
    //   //     .resetButtons(context);
    // });
    // Provider.of<Timing>(context, listen: false).startTime(context);
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
          statusBarColor: appTheme,
          systemNavigationBarColor: appTheme,
          systemNavigationBarIconBrightness: Brightness.light),
      child: MaterialApp(
        routes: <String, WidgetBuilder>{
          'welcome': (BuildContext context) => WelcomeScreen(),
          'description': (BuildContext context) => DescriptionScreen(),
          'login': (BuildContext context) => LoginScreen(),
          'register': (BuildContext context) => RegisterScreen(),
          'credentials': (BuildContext context) => CredentialsScreen(),
          'home': (BuildContext context) => HomeScreen(),
        },
        builder: (context, child) {
          return MediaQuery(
            child: child,
            data: MediaQuery.of(context).copyWith(textScaleFactor: 0.9),
          );
        },
        home: FutureBuilder(
            future: Hive.openBox('appData'),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                if (snapshot.hasError) {
                  return Text(snapshot.error.toString());
                } else {
                  return Material(child: SplashScreen());
                }
              } else {
                return Scaffold();
              }
            }),
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
    Provider.of<AppData>(context, listen: false)
        .changeUsername(Hive.box('appData').get('username', defaultValue: ''));

    Provider.of<AppData>(context, listen: false).changeTime(
        Hive.box('appData').get('sleepTime', defaultValue: DateTime.now()));

    Timer(Duration(seconds: 3), () {
      if (Hive.box('appData').get('username').length <= 2) {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => WelcomeScreen(),
            ));
      } else {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => NavigationBar(),
            ));
      }
    });
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

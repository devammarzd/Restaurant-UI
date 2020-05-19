import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_ui/Services/auth.dart';
import 'package:restaurant_ui/SplashScreen.dart';
import 'package:restaurant_ui/Wrapper.dart';

import 'package:restaurant_ui/Pages/Home.dart';
import 'package:restaurant_ui/models/User.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthService().user,
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
        title: 'Khana Peena',
        theme: ThemeData(
          accentColor: Colors.red,
          primarySwatch: null,
          primaryTextTheme: TextTheme(title: TextStyle(color: Colors.black)),
          buttonColor: Colors.red,
        ),
        home: Splash(),
      ),
    );
  }
}

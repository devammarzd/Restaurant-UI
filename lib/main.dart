import 'package:flutter/material.dart';
import './Pages/LogIn.dart';
import 'package:restaurant_ui/Pages/Home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Restaurant GUI',
      theme: ThemeData(
        accentColor: Colors.red,
        primarySwatch: null,
        primaryTextTheme: TextTheme(title: TextStyle(color: Colors.black)),
        buttonColor: Colors.red,
      ),
      home: Login(),
    );
  }
}

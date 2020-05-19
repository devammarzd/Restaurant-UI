import 'dart:async';

import 'package:flutter/material.dart';
import "package:restaurant_ui/Wrapper.dart";

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}



class _SplashState extends State<Splash> {

@override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 4), (){

Navigator.of(context).pushReplacement(  MaterialPageRoute(builder: (context) => Wrapper()));
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(color: Colors.redAccent),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Expanded(
                flex: 2,
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 50.0,
                        child: Icon(
                          Icons.fastfood,
                          color: Colors.red[700],
                          size: 50,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Khana Peena',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 24),
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                  flex: 1,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      CircularProgressIndicator(
                        strokeWidth: 4,
                        backgroundColor: Colors.yellow,
                      ),
                      Padding(padding: EdgeInsets.only(top: 20)),
                      Text(
                        "Serving a lip-smacking food \n is our Passion",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w600),
                      )
                    ],
                  ))
            ],
          )
        ],
      ),
    );
  }
}

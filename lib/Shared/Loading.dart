import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white54,
      child: Center(
        child: SpinKitFadingCircle(
          color: Colors.red,
          size: 50.0,
        ),
      ),
    );
  }
}
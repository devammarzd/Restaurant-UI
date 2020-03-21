import 'package:flutter/material.dart';
import 'package:restaurant_ui/Widgets/Custom_Scaffold.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
  return SameAppBar(
index: 1,
body: Container(
   child: Text("Home PAGE"),
  color:Colors.purple
),
  );
  
  }
}
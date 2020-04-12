import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:restaurant_ui/Widgets/Custom_Scaffold.dart';
import 'package:carousel_slider/carousel_slider.dart';
class CartPage extends StatelessWidget {
  Widget build(BuildContext context) {
    return SameAppBar(
      index: 3,
      body: Container(child:Text('CartPage'))
    );
  }
}

//  Container(
//           width: MediaQuery.of(context).size.width,
//           margin: EdgeInsets.symmetric(horizontal: 5.0),
//           decoration: BoxDecoration(
//             color: Colors.amber
//           ),
//           child: Text('text $i', style: TextStyle(fontSize: 16.0),)
//         );
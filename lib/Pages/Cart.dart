import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:restaurant_ui/Widgets/Custom_Scaffold.dart';

class CartPage extends StatelessWidget {
  Widget build(BuildContext context) {
    return SameAppBar(
      index: 3,
      body: Container(child: Text("CART PAGE"), color: Colors.amber),
    );
  }
}

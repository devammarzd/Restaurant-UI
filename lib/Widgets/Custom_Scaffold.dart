import 'package:flutter/material.dart';
import 'package:restaurant_ui/Widgets/BottomAppBar.dart';

class SameAppBar extends StatelessWidget {
  const SameAppBar({@required this.index, @required this.body, Key key})
      : super(key: key);

  final Widget body;
  final int index;

  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          'Khana Peena',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.notifications), onPressed: () => {})
        ],
      ),

      body: body,

      bottomNavigationBar: SameBottomAppBar(index: index),
      
      floatingActionButton:
          FloatingActionButton(child: Icon(Icons.search), onPressed: () => {}),
      
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    
    );
  }
}

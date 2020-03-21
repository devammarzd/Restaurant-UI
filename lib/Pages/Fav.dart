import 'package:flutter/material.dart';
import 'package:restaurant_ui/Widgets/Custom_Scaffold.dart';
import 'package:restaurant_ui/Widgets/CircularButton.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FavPage extends StatelessWidget {
  final List<Map> items = [
    {"img": "assets/food1.jpeg", "name": "Fruit Salad"},
    {"img": "assets/food2.jpeg", "name": "Fruit Salad"},
    {"img": "assets/food3.jpeg", "name": "Hamburger"},
    {"img": "assets/food4.jpeg", "name": "Fruit Salad"},
    {"img": "assets/food5.jpeg", "name": "Hamburger"},
    {"img": "assets/food6.jpeg", "name": "Steak"},
    {"img": "assets/food7.jpeg", "name": "Pizza"},
    {"img": "assets/food8.jpeg", "name": "Asparagus"},
    {"img": "assets/food9.jpeg", "name": "Salad"},
    {"img": "assets/food10.jpeg", "name": "Pizza"},
    {"img": "assets/food11.jpeg", "name": "Pizza"},
    {"img": "assets/food12.jpg", "name": "Salad"},
  ];

  @override
  Widget build(BuildContext context) {
    List<Widget> x = List();
    List<Widget> getRatingRow() {
      List<Widget> row = List();
      for (int i = 0; i < 5; i++) {
        row.add(Icon(
          Icons.star,
          color: Colors.orangeAccent,
          size: 11,
        ));
      }
      row.add(Container(
        width: 8,
      ));
      row.add(
        Text(
          '5.0 (23 Reviews)',
          style:TextStyle(fontSize:11,
           color: Colors.black)
        ),
      );
      return row;
    }

    items.forEach((item) {
      x.add(
        InkWell(
            onTap: () {},
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Stack(//to stack a widget on top of another
                  children: <Widget>[
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.asset(
                        item['img'],
                        height: MediaQuery.of(context).size.height / 3.6,//this is to make height responsive to screen height
                        width: MediaQuery.of(context).size.width / 2.2,//this is to make width responsive to screen width
                        fit: BoxFit.cover,
                      ),
                    ),
                    Positioned(//this widget positions the circular button on the cliprect
                      height: 30,
                      width: 30,
                      right: 8.0,//iska matlab cliprect k right border se 8.0 points dur
                      bottom: 8.0,
                      child: CircularButton(
                          icon: Icon(
                            Icons.favorite,
                            color: Colors.red,
                          
                            size: 15,
                          ),
                          onPressed: () {}),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8, bottom: 2),
                  child: Text(
                    item['name'],
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w900,
                        color: Colors.black),
                  ),
                ),
                Row(
                  children: getRatingRow(),
                ),
              ],
            )),
      );
    });

    return SameAppBar(
      index: 2,
      body: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 8),
            child: Text(
              'Favorite Items',
              style: TextStyle(
                  fontSize: 23, color: Colors.black, fontWeight: FontWeight.w800),
            ),
          ),
          GridView.count(
            shrinkWrap: true,
            primary: false,//both listview and gridview are scrollable so gridview is set to false to make scrollable clear
            padding: const EdgeInsets.all(8),
            crossAxisSpacing: 8,
            childAspectRatio: MediaQuery.of(context).size.width /
                (MediaQuery.of(context).size.height / 1.25),
            mainAxisSpacing: 8,
            crossAxisCount: 2,
            children: x,
          ),
        ],
      ),
    );
  }
}

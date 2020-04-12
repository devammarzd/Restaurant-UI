import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:restaurant_ui/Widgets/Custom_Scaffold.dart';
import 'package:restaurant_ui/Widgets/CircularButton.dart';
import 'package:restaurant_ui/Widgets/CategorySlider.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Widget> x = List();
    List<Widget> row1() {
      List<Widget> row2 = List();

      for (int i = 1; i <= 5; i++) {
        {
          row2.add(Icon(
            Icons.star,
            color: Colors.orangeAccent,
            size: 11,
          ));
        }
      }
      row2.add(Container(
        width: 8,
      ));
      row2.add(
        Text('5.0 20 Reviews',
            style: TextStyle(fontSize: 11, color: Colors.black)),
      );

      return row2;
    }

    return SameAppBar(
      index: 1,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(
                    child: Text(
                  'Dishes',
                  style: TextStyle(
                      fontSize: 23,
                      color: Colors.black,
                      fontWeight: FontWeight.w800),
                )),
                Expanded(
                  child: FlatButton(
                    padding: const EdgeInsets.only(left: 100),
                    onPressed: () => {},
                    child: Text('View More'),
                    textColor: Colors.red,
                  ),
                )
              ],
            ),
            InkWell(
              onTap: () => {},
              child: Container(
                child: CarouselSlider(
                  viewportFraction: 1.0,
                  height: 300.0,
                  autoPlay: true,
                  autoPlayInterval: Duration(seconds: 3),
                  autoPlayCurve: Curves.decelerate,
                  items: [
                    {
                      "img": "assets/images_fav/BB.jpeg",
                      "name": "Beef Burger",
                    },
                    {
                      "img": "assets/images_fav/FP.jpeg",
                      "name": "Fajita Pizza",
                    },
                    {
                      "img": "assets/images_fav/food1.jpeg",
                      "name": "Salad",
                    },
                    {
                      "img": "assets/images_fav/food4.jpeg",
                      "name": "Corn Salad",
                    }
                  ].map((i) {
                    return Builder(
                      builder: (BuildContext context) {
                        return Column(
                          children: <Widget>[
                            Stack(
                              children: <Widget>[
                                Container(
                                  width: MediaQuery.of(context).size.width,
                                  // margin: EdgeInsets.symmetric(horizontal: 8.0),
                                  decoration: BoxDecoration(
                                    color: Colors.amber,
                                  ),
                                  // child:Text('a'),)
                                  child: Image.asset(i['img']),
                                ),
                                Positioned(
                                  child: CircularButton(
                                    icon: Icon(
                                      Icons.favorite,
                                      color: Colors.red,
                                      size: 20,
                                    ),
                                    onPressed: () => {},
                                  ),
                                  bottom: 8.0,
                                  right: 2.0,
                                  left: 320.0,
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  i['name'],
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w900,
                                      color: Colors.black),
                                ),
                                Row(children: row1())
                              ],
                            ),
                          ],
                        );
                      },
                    );
                  }).toList(),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0.0, 15.0, 0, 10.0),
              child: Container(
                child: Text(
                  'Food Categories',
                  style: TextStyle(
                      fontSize: 23,
                      color: Colors.black,
                      fontWeight: FontWeight.w800),
                ),
              ),
            ),
            CategorySlider(),
            Padding(
              padding: const EdgeInsets.only(bottom: 10.0),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Text(
                      'Popular Items',
                      style: TextStyle(
                          fontSize: 23,
                          color: Colors.black,
                          fontWeight: FontWeight.w800),
                    ),
                  ),
                  Expanded(
                    child: FlatButton(
                      padding: const EdgeInsets.only(left: 100),
                      onPressed: () => {},
                      child: Text('View More'),
                      textColor: Colors.red,
                    ),
                  )
                ],
              ),
            ),
            StreamBuilder<QuerySnapshot>(
              stream: Firestore.instance.collection('favourites').snapshots(),
              builder: (context, snapshot) {
                if (!snapshot.hasData)
                  return LinearProgressIndicator();
                else {
                  return _buildGridView(context, snapshot.data.documents, x);
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildGridView(
      BuildContext context, List<DocumentSnapshot> documents, List<Widget> x) {
    List<Widget> getRatingRow(int rating, String reviews) {
      List<Widget> row = List();

      for (int i = 1; i <= 5; i++) {
        if (i <= rating) {
          row.add(Icon(
            Icons.star,
            color: Colors.orangeAccent,
            size: 11,
          ));
        } else {
          row.add(Icon(
            Icons.star,
            color: Colors.grey,
            size: 11,
          ));
        }
      }
      row.add(Container(
        width: 8,
      ));
      row.add(
        Text(rating.toString() + '.0  (' + reviews + ' Reviews)',
            style: TextStyle(fontSize: 11, color: Colors.black)),
      );
      return row;
    }

    documents.forEach((item) {
      if (item['rating'] >= 4) {
        x.add(
          InkWell(
              onTap: () {},
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Stack(
                    //to stack a widget on top of another
                    children: <Widget>[
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Image.asset(
                          'assets/images_fav/' + item['image'],
                          height: MediaQuery.of(context).size.height /
                              3.6, //this is to make height responsive to screen height
                          width: MediaQuery.of(context).size.width /
                              2.2, //this is to make width responsive to screen width
                          fit: BoxFit.cover,
                        ),
                      ),
                      Positioned(
                        //this widget positions the circular button on the cliprect
                        height: 30,
                        width: 30,
                        right:
                            8.0, //iska matlab cliprect k right border se 8.0 points dur
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
                    children: getRatingRow(item['rating'], item['reviews']),
                  ),
                ],
              )),
        );
      }
    });

    return GridView.count(
      shrinkWrap: true,
      primary: false,
      // padding: const EdgeInsets.all(8),
      crossAxisSpacing: 8,
      childAspectRatio: MediaQuery.of(context).size.width /
          (MediaQuery.of(context).size.height / 1.25),
      mainAxisSpacing: 8,
      crossAxisCount: 2,
      children: x,
    );
  }
}

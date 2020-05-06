import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:restaurant_ui/Widgets/Custom_Scaffold.dart';
import 'package:restaurant_ui/Widgets/CircularButton.dart';


class FavPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Widget> x = List();
    return SameAppBar(
      index: 2,
      body: Padding(
        padding: const EdgeInsets.all(5.0),
        child: ListView(
          children: <Widget>[
           Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 10, 00, 10),
                    child: Container(
                      child: Text(
                        'Favourite Items',
                        style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
              Divider(
                color: Colors.red,
                //  height: 5,
                thickness: 3,
              ),
            StreamBuilder<QuerySnapshot>(
              stream: Firestore.instance.collection('favourites').snapshots(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) return LinearProgressIndicator();
                else{
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
if(i<=rating){
        row.add(Icon(
          Icons.star,
          color: Colors.orangeAccent,
          size: 11,
        ));
      }
      else{
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
        Text(rating.toString()+'.0  ('+reviews+' Reviews)',
            style: TextStyle(fontSize: 11, color: Colors.black)),
      );
      return row;
    }

    documents.forEach((item) {
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
                      child: Image.asset('assets/images_fav/' + item['image'],
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
    });
    return GridView.count(
      shrinkWrap: true,
      primary: false,
      padding: const EdgeInsets.only(top:8.0),
      crossAxisSpacing: 8,
      childAspectRatio: MediaQuery.of(context).size.width /
          (MediaQuery.of(context).size.height / 1.25),
      mainAxisSpacing: 8,
      crossAxisCount: 2,
      children: x,
    );
  }
  
}

class Record {
 final String name;
 final DocumentReference reference;

 Record.fromMap(Map<String, dynamic> map, {this.reference})
     : assert(map['name'] != null),//assert function ensures that the values shouldnt b null
       name = map['name'];

 Record.fromSnapshot(DocumentSnapshot snapshot)
     : this.fromMap(snapshot.data, reference: snapshot.reference);

 @override
 String toString() => "Record<$name>";
}
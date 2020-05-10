import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:restaurant_ui/Widgets/Custom_Scaffold.dart';
import 'package:carousel_slider/carousel_slider.dart';

class CartPage extends StatelessWidget {
  Widget build(BuildContext context) {
    return SameAppBar(
        index: 3,
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
                      'Your Cart',
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
              Card(
                elevation: 0,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      height: 110,
                      width: 130,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                              image: AssetImage('assets/images_fav/food5.jpeg'),
                              fit: BoxFit.cover)),
                    ),
                     SizedBox(width:15),
                     Container(
                        height: 110,
                      width: 130,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          SizedBox(height:5),
                          Text('Beef burger',style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 17, letterSpacing: -0.3
                          ),),
                          SizedBox(height:10),
                            RichText(text: TextSpan(
                          children:[
                            WidgetSpan(child: Icon(Icons.star, size: 17,color: Colors.yellowAccent,)),
                            TextSpan(text:' 5.0 (23 Review)', style: TextStyle(color:Colors.black54)),
                          ]
                        ),),
                          SizedBox(height:10),
                        RichText(text: TextSpan(
                          
                          children:[
                            TextSpan(text: '20 Pieces', style: TextStyle(color: Colors.black54)),
                            TextSpan(text:'   \$90', style: TextStyle(color:Colors.red, fontSize: 17, fontWeight: FontWeight.bold),),
                          ]
                        ),),
                        SizedBox(height:10),
                         RichText(text: TextSpan(
                          
                          children:[
                            TextSpan(text: 'Quantity: ', style: TextStyle(color:Colors.black54)),
                            TextSpan(text:'1', style: TextStyle(color:Colors.black87, fontWeight: FontWeight.bold),),
                          ]
                        ),),
                        
                        ],
                      ),
                     )

                  ],
                ),
              ),
              Card(
                elevation: 0,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      height: 110,
                      width: 130,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                              image: AssetImage('assets/images_fav/FP.jpeg'),
                              fit: BoxFit.cover)),
                    ),
                     SizedBox(width:15),
                     Container(
                        height: 110,
                      width: 130,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          SizedBox(height:5),
                          Text('Fajita Pizza',style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 17, letterSpacing: -0.3
                          ),),
                          SizedBox(height:10),
                            RichText(text: TextSpan(
                          children:[
                            WidgetSpan(child: Icon(Icons.star, size: 17,color: Colors.yellowAccent,)),
                            TextSpan(text:' 5.0 (23 Review)', style: TextStyle(color:Colors.black54)),
                          ]
                        ),),
                          SizedBox(height:10),
                        RichText(text: TextSpan(
                          
                          children:[
                            TextSpan(text: '20 Pieces', style: TextStyle(color: Colors.black54)),
                            TextSpan(text:'   \$90', style: TextStyle(color:Colors.red, fontSize: 17, fontWeight: FontWeight.bold),),
                          ]
                        ),),
                        SizedBox(height:10),
                         RichText(text: TextSpan(
                          
                          children:[
                            TextSpan(text: 'Quantity: ', style: TextStyle(color:Colors.black54)),
                            TextSpan(text:'1', style: TextStyle(color:Colors.black87, fontWeight: FontWeight.bold),),
                          ]
                        ),),
                        
                        ],
                      ),
                     )

                  ],
                ),
              ),
              Card(
                elevation: 0,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      height: 110,
                      width: 130,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                              image: AssetImage('assets/images_fav/CT.jpg'),
                              fit: BoxFit.cover)),
                    ),
                     SizedBox(width:15),
                     Container(
                        height: 110,
                      width: 130,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          SizedBox(height:5),
                          Text('Chicken Tikka',style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 17, letterSpacing: -0.3
                          ),),
                          SizedBox(height:10),
                            RichText(text: TextSpan(
                          children:[
                            WidgetSpan(child: Icon(Icons.star, size: 17,color: Colors.yellowAccent,)),
                            TextSpan(text:' 5.0 (23 Review)', style: TextStyle(color:Colors.black54)),
                          ]
                        ),),
                          SizedBox(height:10),
                        RichText(text: TextSpan(
                          
                          children:[
                            TextSpan(text: '20 Pieces', style: TextStyle(color: Colors.black54)),
                            TextSpan(text:'   \$90', style: TextStyle(color:Colors.red, fontSize: 17, fontWeight: FontWeight.bold),),
                          ]
                        ),),
                        SizedBox(height:10),
                         RichText(text: TextSpan(
                          
                          children:[
                            TextSpan(text: 'Quantity: ', style: TextStyle(color:Colors.black54)),
                            TextSpan(text:'1', style: TextStyle(color:Colors.black87, fontWeight: FontWeight.bold),),
                          ]
                        ),),
                        
                        ],
                      ),
                     )

                  ],
                ),
              ),
              Card(
                elevation: 0,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      height: 110,
                      width: 130,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                              image: AssetImage('assets/images_fav/MB.jpg'),
                              fit: BoxFit.cover)),
                    ),
                     SizedBox(width:15),
                     Container(
                        height: 110,
                      width: 130,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          SizedBox(height:5),
                          Text('Malai Boti',style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 17, letterSpacing: -0.3
                          ),),
                          SizedBox(height:10),
                            RichText(text: TextSpan(
                          children:[
                            WidgetSpan(child: Icon(Icons.star, size: 17,color: Colors.yellowAccent,)),
                            TextSpan(text:' 5.0 (23 Review)', style: TextStyle(color:Colors.black54)),
                          ]
                        ),),
                          SizedBox(height:10),
                        RichText(text: TextSpan(
                          
                          children:[
                            TextSpan(text: '20 Pieces', style: TextStyle(color: Colors.black54)),
                            TextSpan(text:'   \$90', style: TextStyle(color:Colors.red, fontSize: 17, fontWeight: FontWeight.bold),),
                          ]
                        ),),
                        SizedBox(height:10),
                         RichText(text: TextSpan(
                          
                          children:[
                            TextSpan(text: 'Quantity: ', style: TextStyle(color:Colors.black54)),
                            TextSpan(text:'1', style: TextStyle(color:Colors.black87, fontWeight: FontWeight.bold),),
                          ]
                        ),),
                        
                        ],
                      ),
                     )

                  ],
                ),
              ),
              Card(
                elevation: 0,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      height: 110,
                      width: 130,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                              image: AssetImage('assets/images_fav/DP.jpg'),
                              fit: BoxFit.cover)),
                    ),
                     SizedBox(width:15),
                     Container(
                        height: 110,
                      width: 130,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          SizedBox(height:5),
                          Text('Dynamite Prawns',style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 17, letterSpacing: -0.3
                          ),),
                          SizedBox(height:10),
                            RichText(text: TextSpan(
                          children:[
                            WidgetSpan(child: Icon(Icons.star, size: 17,color: Colors.yellowAccent,)),
                            TextSpan(text:' 5.0 (23 Review)', style: TextStyle(color:Colors.black54)),
                          ]
                        ),),
                          SizedBox(height:10),
                        RichText(text: TextSpan(
                          
                          children:[
                            TextSpan(text: '20 Pieces', style: TextStyle(color: Colors.black54)),
                            TextSpan(text:'   \$90', style: TextStyle(color:Colors.red, fontSize: 17, fontWeight: FontWeight.bold),),
                          ]
                        ),),
                        SizedBox(height:10),
                         RichText(text: TextSpan(
                          
                          children:[
                            TextSpan(text: 'Quantity: ', style: TextStyle(color:Colors.black54)),
                            TextSpan(text:'1', style: TextStyle(color:Colors.black87, fontWeight: FontWeight.bold),),
                          ]
                        ),),
                        
                        ],
                      ),
                     )

                  ],
                ),
              ),
              Card(
                elevation: 0,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      height: 110,
                      width: 130,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                              image: AssetImage('assets/images_fav/food1.jpeg'),
                              fit: BoxFit.cover)),
                    ),
                     SizedBox(width:15),
                     Container(
                        height: 110,
                      width: 130,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          SizedBox(height:5),
                          Text('Salad',style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 17, letterSpacing: -0.3
                          ),),
                          SizedBox(height:10),
                            RichText(text: TextSpan(
                          children:[
                            WidgetSpan(child: Icon(Icons.star, size: 17,color: Colors.yellowAccent,)),
                            TextSpan(text:' 5.0 (23 Review)', style: TextStyle(color:Colors.black54)),
                          ]
                        ),),
                          SizedBox(height:10),
                        RichText(text: TextSpan(
                          
                          children:[
                            TextSpan(text: '20 Pieces', style: TextStyle(color: Colors.black54)),
                            TextSpan(text:'   \$90', style: TextStyle(color:Colors.red, fontSize: 17, fontWeight: FontWeight.bold),),
                          ]
                        ),),
                        SizedBox(height:10),
                         RichText(text: TextSpan(
                          
                          children:[
                            TextSpan(text: 'Quantity: ', style: TextStyle(color:Colors.black54)),
                            TextSpan(text:'1', style: TextStyle(color:Colors.black87, fontWeight: FontWeight.bold),),
                          ]
                        ),),
                        
                        ],
                      ),
                     )

                  ],
                ),
              ),
              Card(
                elevation: 0,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      height: 110,
                      width: 130,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                              image: AssetImage('assets/images_fav/food5.jpeg'),
                              fit: BoxFit.cover)),
                    ),
                     SizedBox(width:15),
                     Container(
                        height: 110,
                      width: 130,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          SizedBox(height:5),
                          Text('Chicken burger',style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 17, letterSpacing: -0.3
                          ),),
                          SizedBox(height:10),
                            RichText(text: TextSpan(
                          children:[
                            WidgetSpan(child: Icon(Icons.star, size: 17,color: Colors.yellowAccent,)),
                            TextSpan(text:' 5.0 (23 Review)', style: TextStyle(color:Colors.black54)),
                          ]
                        ),),
                          SizedBox(height:10),
                        RichText(text: TextSpan(
                          
                          children:[
                            TextSpan(text: '20 Pieces', style: TextStyle(color: Colors.black54)),
                            TextSpan(text:'   \$90', style: TextStyle(color:Colors.red, fontSize: 17, fontWeight: FontWeight.bold),),
                          ]
                        ),),
                        SizedBox(height:10),
                         RichText(text: TextSpan(
                          
                          children:[
                            TextSpan(text: 'Quantity: ', style: TextStyle(color:Colors.black54)),
                            TextSpan(text:'1', style: TextStyle(color:Colors.black87, fontWeight: FontWeight.bold),),
                          ]
                        ),),
                        
                        ],
                      ),
                     )

                  ],
                ),
              ),
            
            ],
          ),
        ));
  }
}

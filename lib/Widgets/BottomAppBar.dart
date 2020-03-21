import 'package:flutter/material.dart';
import 'package:restaurant_ui/Pages/Home.dart';
import 'package:restaurant_ui/Pages/Fav.dart';
import 'package:restaurant_ui/Pages/Profile.dart';
import 'package:restaurant_ui/Pages/Cart.dart';
class SameBottomAppBar extends StatelessWidget{
 const SameBottomAppBar({
   @required this.index,
   Key key
 }):super(key:key);
 final int index;
Widget build(BuildContext context){

  return BottomAppBar(
          child:Row(
          children: <Widget>[
            Expanded(child:
            IconButton(icon: Icon(Icons.home), 
            onPressed: (){
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context)=>HomePage()));
            }
            )
            ),
            Expanded(child:
            IconButton(icon: Icon(Icons.favorite), onPressed: (){
               Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context)=>FavPage()));
            })),
            Expanded(child:
            IconButton(icon: Icon(Icons.shopping_cart), onPressed: (){
               Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context)=>CartPage()));
            })),
            Expanded(child:
            IconButton(icon: Icon(Icons.person), onPressed: (){
               Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context)=>ProfilePage()));
            }))
          ],
        ),
        shape: CircularNotchedRectangle(),
      );
}
}
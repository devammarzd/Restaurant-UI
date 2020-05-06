import 'package:flutter/material.dart';
import 'package:restaurant_ui/Services/auth.dart';

class Trash extends StatefulWidget {
  @override
  _TrashState createState() => _TrashState();
}

class _TrashState extends State<Trash> {
    final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    return Container(
      child: RaisedButton(onPressed: ()async{
await _auth.logOut();

      },
      child:Text('Logout')
      
      
      ),
    );
  }
}
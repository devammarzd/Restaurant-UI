import 'package:flutter/material.dart';
import 'package:restaurant_ui/Pages/Home.dart';

class SignIn extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(children: <Widget>[
      Padding(
        padding: EdgeInsets.fromLTRB(90.0, 12.0, 90.0, 12.0),
        child: Container(
          
          child: ListTile(
            title: Text('Log in to your account',
                style:
                    TextStyle(color: Colors.red, fontWeight: FontWeight.bold)),
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Card(
          child: ListTile(
              leading: Icon(Icons.account_circle), 
              title: TextField(
                decoration: InputDecoration(
                  hintText: "Username"
                ),
              ),
        ),
      ),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Card(
          child: ListTile(leading: Icon(Icons.lock), 
          title:TextField(
                decoration: InputDecoration(
                  hintText: "Password"
                ),
              ),
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Container(
          child: ListTile(
            trailing: Text('Forgot Password?',
                style:
                    TextStyle(color: Colors.red, fontWeight: FontWeight.bold)),
          ),
        ),
      ),
      Padding(
        padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 12.0),
        child: RaisedButton(
         
          onPressed: () {
          Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context)=>HomePage()));
          },
          padding: EdgeInsets.all(20.0),
          child: Text('LOGIN', style: TextStyle(color: Colors.white)),
        ),
      ),
      Padding(
          padding: EdgeInsets.fromLTRB(120, 20, 120, 0),
          child: Container(
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                FloatingActionButton(
                  heroTag: '1',
                    backgroundColor: Colors.blue,
                    onPressed: () {},
                    child: CircleAvatar(
                        backgroundImage: NetworkImage(
                            'https://upload.wikimedia.org/wikipedia/en/thumb/5/54/Google_Now_logo.webp/300px-Google_Now_logo.webp.png'))),
                FloatingActionButton(
                  heroTag: '2',
                  backgroundColor: Colors.blue[800],
                  onPressed: () {},
                  child: CircleAvatar( 
                    backgroundImage: NetworkImage(
                        'https://cdn4.iconfinder.com/data/icons/social-messaging-ui-color-shapes-2-free/128/social-facebook-circle-256.png'),
                  ),
                ),
              ])))
    ]));
  }
}

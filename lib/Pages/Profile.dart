
import 'package:flutter/material.dart';
import 'package:restaurant_ui/Pages/Authenticate/LogIn.dart';
import 'package:restaurant_ui/Services/auth.dart';
import 'package:restaurant_ui/Widgets/Custom_Scaffold.dart';
import 'package:restaurant_ui/Wrapper.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return SameAppBar(
      index: 4,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 10, 00, 10),
                  child: Container(
                    child: Text(
                      'Profile',
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
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Container(
                  color: Colors.yellow,
                  // padding: EdgeInsets.only(right: 20),
                  height: 100,
                  width: 100,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Text('Account Name',
                          style: TextStyle(
                              fontSize: 23, fontWeight: FontWeight.bold)),
                      Text('123@xyz.com',
                          style: TextStyle(
                            fontSize: 20,
                          )),
                      SizedBox(height: 10),
                      OutlineButton(
                        textColor: Colors.red,
                          color: Colors.red,
                          onPressed: () async {
                            await _auth.logOut();
                            Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                    builder: (context) => Wrapper()));
                          },
                          child: Text('LogOut',
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold))),
                    ],
                  ),
                ),
              ],
            ),
            Divider(),
            ListTile(
              title: Text(
                'Account Information',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text('Ammar Zahid'),
              trailing: Icon(Icons.edit),
            ),
            ListTile(
              title: Text(
                'Email',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text('123@xyz.com'),
            ),
            ListTile(
              title: Text(
                'Phone Number',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text('+92XXXXXXXXX'),
            ),
            ListTile(
              title: Text(
                'Address',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text('22 street,dash Town, Pakistan'),
            ),
            ListTile(
              title: Text(
                'Gender',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text('Male'),
            ),
            ListTile(
              title: Text(
                'Date Of Birth',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text('DD-MM-YY'),
            ),
            ListTile(
                title: Text(
                  'Dark Theme',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                trailing: Switch(
                  value: false,
                  onChanged: null,
                ))
          ],
        ),
      ),

      // Column(
      //   crossAxisAlignment: CrossAxisAlignment.center,
      //   mainAxisAlignment: MainAxisAlignment.center,
      //   children: <Widget>[
      //     SizedBox(
      //       height: 30,
      //     ),
      //     RaisedButton(
      //       onPressed: () async {
      //         await _auth.logOut();
      //      Navigator.of(context).pushReplacement(
      //           MaterialPageRoute(builder: (context) => Wrapper()));
      //       },
      //       child: Text('Logout'),
      //       color: Colors.red[200],
      //     )
      //   ],
      // ),
    );
  }
}

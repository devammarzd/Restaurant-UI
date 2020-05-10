import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_ui/Pages/Authenticate/LogIn.dart';
import 'package:restaurant_ui/Services/auth.dart';
import 'package:restaurant_ui/Widgets/Custom_Scaffold.dart';
import 'package:restaurant_ui/Wrapper.dart';
import 'package:restaurant_ui/models/User.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final AuthService _auth = AuthService();
  String email;
  String useruid;
  String name;

  List<String> litems = [
    "Username",
    "Email",
    "Phone",
    "Address",
    "Gender",
    "Date of Birth"
  ];

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    if (user != null) {
      setState(() {
        print(user.email);
        useruid = user.uid;
        email = user.email;
      });

      // Future<dynamic> getData() async {
      //   var document = Firestore.instance.collection("Users").document(user.uid);

      //   await document.get().then((document) async {
      //     setState(() {
      //       name = document.data['Username'];
      //     });
      //   }).whenComplete(() => print("Succesfull"));
      // }

      return SameAppBar(
        index: 4,
        body: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Container(
            child: StreamBuilder(
                stream: Firestore.instance
                    .collection('Users')
                    .document(useruid)
                    .snapshots(),
                builder: (context, snapshot) {
                  var userdocument = snapshot.data;
                 
                  if (snapshot.hasData) {
                     String profpicurl = userdocument['Photourl'];
                  print(profpicurl);
                    return SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Column(
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.fromLTRB(0, 10, 00, 10),
                                child: Container(
                                  child: Text(
                                    'Profile',
                                    style: TextStyle(
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Divider(
                            color: Colors.red,
                            thickness: 3,
                          ),
                          Card(
                            elevation: 3,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                SizedBox(width: 5),
                                Container(
                                  height: 100,
                                  width: 100,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      image: DecorationImage(
                                          image: NetworkImage('$profpicurl'),
                                          fit: BoxFit.cover)),
                                ),
                                // Container(
                                //   color: Colors.yellow,
                                //   height: 100,
                                //   width: 100,
                                // ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(userdocument['Username'],
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold)),
                                      Text(email,
                                          style: TextStyle(
                                            fontSize: 18,
                                          )),
                                      SizedBox(height: 10),
                                      RaisedButton(
                                          elevation: 8,
                                          textColor: Colors.white,
                                          color: Colors.red,
                                          onPressed: () async {
                                            await _auth.gsignOut().whenComplete(
                                                () => Navigator.of(context)
                                                    .pushReplacement(
                                                        MaterialPageRoute(
                                                            builder: (context) =>
                                                                Wrapper())));
                                          },
                                          child: Text('SIGN OUT',
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold))),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Divider(),
                          Container(
                            child: ListView.builder(
                                physics: ScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: litems.length,
                                itemBuilder: (BuildContext ctxt, int index) {
                                  var userDocument = snapshot.data;
                                  String i = litems[index];

                                  return ListTile(
                                    title: Text(
                                      litems[index],
                                      style:
                                          TextStyle(fontWeight: FontWeight.bold),
                                    ),
                                    subtitle: Text(userDocument[i]),
                                  );
                                }),
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
                    );
                  } else {
                    return Container();
                  }
                }),
          ),
        ),
      );
    } else {
      return SameAppBar(
          index: 4,
          body: Center(
              child: Container(
            child: Text('Loading...'),
          )));
    }
  }
}

import 'package:flutter/material.dart';
import 'package:restaurant_ui/Pages/Home.dart';
import 'package:restaurant_ui/Services/auth.dart';
import 'package:restaurant_ui/Shared/Loading.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final AuthService _auth = AuthService();

  final _formkey = GlobalKey<FormState>();
  String email = '';
  String password = '';
  String username = '';
  String error = '';
  String a = '';
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return loading? Loading(): Scaffold(
        body: Form(
      key: _formkey,
      child: ListView(children: <Widget>[
        Padding(
          padding: EdgeInsets.fromLTRB(90.0, 12.0, 90.0, 12.0),
          child: Container(
            child: ListTile(
              title: Text('Create an account',
                  style: TextStyle(
                      color: Colors.red, fontWeight: FontWeight.bold)),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Card(
            child: ListTile(
                leading: Icon(Icons.account_circle),
                title: TextFormField(
                    validator: (val) {
                      return val.isEmpty ? 'Enter a Username' : null;
                    },
                    onChanged: (val) {
                      setState(() {
                        return username = val;
                      });
                    },
                    decoration: InputDecoration(
                      hintText: "Username",
                    ))),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Card(
            child: ListTile(
              leading: Icon(Icons.email),
              title: TextFormField(
                validator: (val) {
                  return val.isEmpty ? 'Enter an Email ID' : null;
                },
                onChanged: (val) {
                  setState(() {
                    return email = val;
                  });
                },
                decoration: InputDecoration(hintText: "Email"),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Card(
            child: ListTile(
              leading: Icon(Icons.lock),
              title: TextFormField(
                obscureText: true,
                validator: (val) {
                  return val.length < 6
                      ? 'Your password should have atleast 6 characters'
                      : null;
                },
                onChanged: (val) {
                  setState(() {
                    return password = val;
                  });
                },
                decoration: InputDecoration(hintText: "Password"),
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 12.0),
          child: RaisedButton(
            color: Colors.red[800],
            onPressed: () async {
              if (_formkey.currentState.validate()) {
                setState(() {
                  loading=true;
                });
                dynamic result =
                    await _auth.registerWithEmailandPassword(username, email, password);
                if (result == null) {
                  setState(() {
                    loading=false;
                    error = 'Please enter a valid Email ID';
                  });
                }
              }
            },
            padding: EdgeInsets.all(20.0),
            elevation: 5,
                  child: Text('Register', style: TextStyle(color: Colors.white, fontSize: 16)),
          ),
        ),
        SizedBox(
          height: 15,
        ),
        Text(error)
      ]),
    ));
  }
}

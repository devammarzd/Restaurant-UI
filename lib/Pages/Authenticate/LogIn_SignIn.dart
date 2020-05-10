
import 'package:flutter/material.dart';
import 'package:restaurant_ui/Pages/Home.dart';
import 'package:restaurant_ui/Services/auth.dart';
import 'package:restaurant_ui/Shared/Loading.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();
  final _formkey = GlobalKey<FormState>();
  String email = '';
  String password = '';
  String username = '';
  String error = '';
  // String errorpassword = '';
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : Scaffold(
            body: Form(
            key: _formkey,
            child: ListView(children: <Widget>[
              Padding(
                padding: EdgeInsets.fromLTRB(90.0, 12.0, 90.0, 12.0),
                child: Container(
                  child: ListTile(
                    title: Text('Log in to your account',
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
                        return val.isEmpty ? 'Enter an Email ID' : null;
                      },
                      onChanged: (val) {
                        setState(() {
                          return email = val;
                        });
                      },
                      decoration: InputDecoration(hintText: "Email ID"),
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
                        return val.isEmpty ? 'Enter a Password' : null;
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
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Container(
                  child: ListTile(
                    trailing: Text('Forgot Password?',
                        style: TextStyle(
                            color: Colors.red, fontWeight: FontWeight.bold)),
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
                        loading = true;
                      });
                      dynamic result = await _auth.signInWithEmailandPassword(
                          email, password);

                      if (result == null) {
                        setState(() {
                          loading = false;
                          error = 'Cannot Sign in with those credentials';
                        });
                      }
                    }
                  },
                  padding: EdgeInsets.all(20.0),
                  elevation: 5,
                  child: Text('Login', style: TextStyle(color: Colors.white, fontSize: 16)),
                ),
              ),
              Padding(
                 padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 12.0),
                child: RaisedButton(
                  elevation: 5,
                  color: Colors.green,
                  padding: EdgeInsets.all(20.0),
                  onPressed: () async {
                    await _auth.gsignIn();
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text('Sign in with Google',
                            style: TextStyle(color: Colors.black, fontSize: 16))
                    ],
                  ),
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

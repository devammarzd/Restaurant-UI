import 'package:flutter/material.dart';
import 'package:restaurant_ui/Services/auth.dart';
import './LogIn_SignIn.dart' as signin;
import './LogIn_Register.dart' as register;

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return  DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading:
              IconButton(icon: IconButton(
                icon: Icon(Icons.arrow_back),
                color: Colors.black,), 
                onPressed: () => {}),
          bottom: TabBar(tabs: [
            Tab(
              text: 'LOGIN',
            ),
            Tab(text: 'REGISTER')
          ],
          labelColor: Colors.red,
          unselectedLabelColor: Colors.grey,
          indicatorWeight:5 ,),
        ),
        body: TabBarView(
          children: [signin.SignIn(), register.Register()]
          ),
      ),
  
    );
  }
}


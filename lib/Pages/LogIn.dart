import 'package:flutter/material.dart';
import './LogIn_SignIn.dart' as signin;
import './LogIn_Register.dart' as register;

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
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

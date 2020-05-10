import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_ui/Pages/Authenticate/LogIn.dart';
import 'package:restaurant_ui/Pages/Authenticate/authenticate.dart';
import 'package:restaurant_ui/Pages/Home.dart';

import 'package:restaurant_ui/models/User.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
if(user!=  null){
print('fetched id : '+user.uid);
print('fetched email : '+user.email);
}

    if (user == null) {
      return Login();
    } else {
      return HomePage();
    
    }
  }
}

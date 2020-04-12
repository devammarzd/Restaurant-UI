import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService{
  final FirebaseAuth _auth= FirebaseAuth.instance;
  Future signInAnon() async{
    try{
AuthResult result=await _auth.signInAnonymously();
FirebaseUser user= result.user;
return user;

    }catch(e){
print(e.toString());
return null;
    }
  }
}
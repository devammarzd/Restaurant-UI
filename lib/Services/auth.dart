import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:restaurant_ui/models/User.dart';

class AuthService {
//create an user object based on firebase user
  final FirebaseAuth _auth = FirebaseAuth.instance;
  User _userFromFirebaseUser(FirebaseUser user) {
    return user != null ? User(uid: user.uid) : null;
  }

//auth change user stream
  Stream<User> get user {
    return _auth.onAuthStateChanged
        // .map((FirebaseUser user)=>_userFromFirebaseUser(user));
        .map(_userFromFirebaseUser);
  }

  Future signInAnon() async {
    try {
      AuthResult result = await _auth.signInAnonymously();
      FirebaseUser user = result.user;
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
  //Sign In with email and password
  Future signInWithEmailandPassword(String email,String password)async{
      try{AuthResult result=await _auth.signInWithEmailAndPassword(email: email, password: password);
  FirebaseUser user =result.user;
  return _userFromFirebaseUser(user);
  }catch(e){
    print(e.toString());
    return null;
  }
  }

//register function
Future registerWithEmailandPassword(String email, String password) async{
  try{AuthResult result=await _auth.createUserWithEmailAndPassword(email: email, password: password);
  FirebaseUser user =result.user;
  return _userFromFirebaseUser(user);
  }catch(e){
    print(e.toString());
    return null;
  }
}


  //SignOut Function
  Future logOut() async{
    try{
      return await _auth.signOut();
    }catch(e){
      print(e.toString());
      return null;
    }
  }
}

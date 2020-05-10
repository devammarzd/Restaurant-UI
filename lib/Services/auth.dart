import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:restaurant_ui/Services/UserDatabase.dart';
import 'package:restaurant_ui/models/User.dart';

class AuthService {
//create an user object based on firebase user
  final FirebaseAuth _auth = FirebaseAuth.instance;
final GoogleSignIn googleSignin = new GoogleSignIn();

  User _userFromFirebaseUser(FirebaseUser user) {
    return user != null ? User(uid: user.uid, email: user.email) : null;
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
      try{
        AuthResult result=await _auth.signInWithEmailAndPassword(email: email, password: password);
  FirebaseUser user =result.user;
  
  return _userFromFirebaseUser(user);
  }catch(e){
    print(e.toString());
    return null;
  }
  }

//register function
Future registerWithEmailandPassword(String username,String email, String password) async{
  try{AuthResult result=await _auth.createUserWithEmailAndPassword(email: email, password: password);
  FirebaseUser user =result.user;
  if(user!=null){
    String dummyphotourl="https://png.pngtree.com/element_our/png/20181206/users-vector-icon-png_260862.jpg";
    UserDatabase().createuserdata(username, email,user.uid, dummyphotourl);
  }
  return _userFromFirebaseUser(user);
  }catch(e){
    print(e.toString());
    return null;
  }
}

//Google Sign in
  Future gsignIn() async {
    
    GoogleSignInAccount googleSignInAccount = await googleSignin.signIn();
    GoogleSignInAuthentication gSA = await googleSignInAccount.authentication;
    final AuthCredential credential = GoogleAuthProvider.getCredential(
      accessToken: gSA.accessToken,
      idToken: gSA.idToken,
    );
    final AuthResult authResult = await _auth.signInWithCredential(credential);
    final FirebaseUser user = authResult.user;
 if(user!=null){
    UserDatabase().createuserdata(user.displayName, user.email,user.uid, user.photoUrl);
  }
//     final FirebaseUser currentUser = await _auth.currentUser();
// if(currentUser != null){
//   print('Current User: ${currentUser.displayName}');
// }
    print("User Name:${user.displayName}");
    return _userFromFirebaseUser(user);
  }

  //googleSignout
  Future gsignOut() async{

      googleSignin.signOut().whenComplete((){
        print('Signed out succesfully');
      });
      return await _auth.signOut();
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

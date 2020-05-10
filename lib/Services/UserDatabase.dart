import 'package:cloud_firestore/cloud_firestore.dart';

class UserDatabase {
  final db = Firestore.instance;

// final CollectionReference brewCollection = Firestore.instance.collection('Users');
  createuserdata(String username, String email, String uid, String profileurl) async {
    return await db
        .collection('Users')
        .document(uid)
        .setData({
          'Username': username, 
          'Email': email,
          'Phone':'+92XXXXXXXXXX',
          'Address':'',
          'Gender':'',
          'Date of Birth': 'DD/MM/YYYY',
          'Photourl': profileurl
          }).whenComplete(() {
      print('Added');
    });
  }
}
